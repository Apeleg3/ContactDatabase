CREATE VIEW [dbo].[v_FullAddress]
AS
SELECT a.ContactId, c.FirstName, c.LastName, a.StreetNumber, RTRIM(a.StreetName) AS StreetName, a.StreetZip, s.State AS StateName, ctry.Country AS CountryName, d.AdressType AS AdressTypeDescription, CAST(a.StreetNumber AS VARCHAR(10)) + ' ' + RTRIM(a.StreetName) + ', ' + s.State + ' ' + RTRIM(a.StreetZip) + ', ' + ctry.Country AS FullAddress
FROM  dbo.Address AS a INNER JOIN
         dbo.Contact AS c ON a.ContactId = c.ContactId INNER JOIN
         dbo.AdressTypeDictonary AS d ON a.AdressType = d.AdressTypeId INNER JOIN
         dbo.StateDictonary AS s ON a.State = s.StateId INNER JOIN
         dbo.CountryDictonary AS ctry ON a.Country = ctry.CountryId
GO
/****** Object:  Table [dbo].[PhoneDictonary]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
