CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](30) NOT NULL,
	[MiddleName] [nchar](30) NULL,
	[LastName] [nchar](30) NOT NULL,
	[DOB] [date] NULL,
	[Gender] [int] NOT NULL,
	[Company] [nchar](30) NULL,
	[Age]  AS (datediff(year,[DOB],getdate())-case when datepart(month,[DOB])>datepart(month,getdate()) OR datepart(month,[DOB])=datepart(month,getdate()) AND datepart(day,[DOB])>datepart(day,getdate()) then (1) else (0) end),
CREATE TABLE [dbo].[Email](
	[ContactId] [int] NOT NULL,
	[EmailAdress] [nvarchar](50) NOT NULL,
	[EmailType] [int] NOT NULL,
	[EmailId] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailDictonary]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailDictonary](
	[EmailTypeId] [int] NOT NULL,
	[EmailType] [nchar](30) NULL,
CREATE TABLE [dbo].[CountryDictonary](
	[CountryId] [int] NOT NULL,
	[Country] [nchar](30) NULL,
CREATE TABLE [dbo].[StateDictonary](
	[StateId] [int] NOT NULL,
	[State] [nchar](3) NOT NULL,
CREATE TABLE [dbo].[Address](
	[StreetNumber] [int] NULL,
	[StreetName] [varchar](50) NOT NULL,
	[StreetZip] [nchar](10) NOT NULL,
	[State] [int] NOT NULL,
	[Country] [int] NOT NULL,
	[ContactId] [int] NOT NULL,
	[AdressType] [int] NULL,
	[AdressID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdressTypeDictonary]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdressTypeDictonary](
	[AdressTypeId] [int] NOT NULL,
	[AdressType] [nchar](20) NULL,
CREATE TABLE [dbo].[PhoneDictonary](
	[PhoneTypeId] [int] NOT NULL,
	[PhoneType] [nchar](10) NOT NULL,
CREATE TABLE [dbo].[Phone](
	[ContactId] [int] NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[PhoneType] [int] NOT NULL,
	[PhoneNumberId] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhoneNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_FullPhone]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[v_FullPhone] AS
SELECT 
    p.PhoneNumberId, 
    p.ContactId, 
    c.FirstName, 
    c.LastName, 
    p.PhoneNumber, 
    d.PhoneType AS PhoneTypeDescription
FROM dbo.Phone AS p
INNER JOIN dbo.Contact AS c ON p.ContactId = c.ContactId
INNER JOIN dbo.PhoneDictonary AS d ON p.PhoneType = d.PhoneTypeId;
GO
/****** Object:  Table [dbo].[GenderDictonary]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderDictonary](
	[GenderId] [int] NOT NULL,
	[GenderType] [nchar](2) NOT NULL,
