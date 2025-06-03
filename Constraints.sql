 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CONSTRAINT [PK_EmailDictonary] PRIMARY KEY CLUSTERED 
(
	[EmailTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_FullEmail]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[v_FullEmail] AS SELECT e.EmailId, e.ContactId, c.FirstName, c.LastName, e.EmailAdress, d.EmailType AS EmailTypeDescription FROM dbo.Email e JOIN dbo.Contact c ON e.ContactId = c.ContactId JOIN dbo.EmailDictonary d ON e.EmailType = d.EmailTypeId;
GO
/****** Object:  Table [dbo].[CountryDictonary]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CONSTRAINT [PK_CountryDictonary] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateDictonary]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CONSTRAINT [PK_StateDictonary] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CONSTRAINT [PK_AdressTypeDictonary] PRIMARY KEY CLUSTERED 
(
	[AdressTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_FullAddress]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CONSTRAINT [PK_PhoneDictonary] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CONSTRAINT [PK_GenderDictonary] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 
GO
INSERT [dbo].[Address] ([StreetNumber], [StreetName], [StreetZip], [State], [Country], [ContactId], [AdressType], [AdressID]) VALUES (17, N'Circle Lane', N'10512     ', 1, 1, 1, 1, 1010)
GO
INSERT [dbo].[Address] ([StreetNumber], [StreetName], [StreetZip], [State], [Country], [ContactId], [AdressType], [AdressID]) VALUES (8, N'Ridge Way', N'10567     ', 1, 1, 1, 2, 1011)
GO
INSERT [dbo].[Address] ([StreetNumber], [StreetName], [StreetZip], [State], [Country], [ContactId], [AdressType], [AdressID]) VALUES (999, N'Sample Lowercase Street', N'99999     ', 1, 1, 6, 1, 1022)
GO
INSERT [dbo].[Address] ([StreetNumber], [StreetName], [StreetZip], [State], [Country], [ContactId], [AdressType], [AdressID]) VALUES (20, N'Seminary Lane', N'10527     ', 1, 1, 2, 1, 1013)
GO
INSERT [dbo].[Address] ([StreetNumber], [StreetName], [StreetZip], [State], [Country], [ContactId], [AdressType], [AdressID]) VALUES (NULL, N'S Moger Avenue', N'10549     ', 1, 1, 2, 2, 1014)
GO
INSERT [dbo].[Address] ([StreetNumber], [StreetName], [StreetZip], [State], [Country], [ContactId], [AdressType], [AdressID]) VALUES (121, N'Berger Ave', N'10913     ', 1, 1, 3, 1, 1015)
GO
INSERT [dbo].[Address] ([StreetNumber], [StreetName], [StreetZip], [State], [Country], [ContactId], [AdressType], [AdressID]) VALUES (NULL, N'Pace University', N'10570     ', 1, 1, 3, 2, 1016)
GO
INSERT [dbo].[Address] ([StreetNumber], [StreetName], [StreetZip], [State], [Country], [ContactId], [AdressType], [AdressID]) VALUES (80, N'Wheeler Ave', N'10570     ', 1, 1, 4, 1, 1017)
GO
INSERT [dbo].[Address] ([StreetNumber], [StreetName], [StreetZip], [State], [Country], [ContactId], [AdressType], [AdressID]) VALUES (861, N'Bedford Rd', N'10570     ', 1, 1, 4, 2, 1018)
GO
INSERT [dbo].[Address] ([StreetNumber], [StreetName], [StreetZip], [State], [Country], [ContactId], [AdressType], [AdressID]) VALUES (82, N'Kingston Drive', N'10629     ', 1, 1, 5, 1, 1021)
GO
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
INSERT [dbo].[AdressTypeDictonary] ([AdressTypeId], [AdressType]) VALUES (1, N'Home                ')
GO
INSERT [dbo].[AdressTypeDictonary] ([AdressTypeId], [AdressType]) VALUES (2, N'Work                ')
GO
INSERT [dbo].[AdressTypeDictonary] ([AdressTypeId], [AdressType]) VALUES (3, N'Mailing             ')
GO
INSERT [dbo].[AdressTypeDictonary] ([AdressTypeId], [AdressType]) VALUES (4, N'Billing             ')
GO
INSERT [dbo].[AdressTypeDictonary] ([AdressTypeId], [AdressType]) VALUES (5, N'Shipping            ')
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 
GO
INSERT [dbo].[Contact] ([ContactId], [FirstName], [MiddleName], [LastName], [DOB], [Gender], [Company]) VALUES (1, N'Ashley                        ', N'R                             ', N'Peleg                         ', CAST(N'1997-08-21' AS Date), 1, NULL)
GO
INSERT [dbo].[Contact] ([ContactId], [FirstName], [MiddleName], [LastName], [DOB], [Gender], [Company]) VALUES (2, N'Michael                       ', NULL, N'Rourke                        ', CAST(N'2003-06-16' AS Date), 2, NULL)
GO
INSERT [dbo].[Contact] ([ContactId], [FirstName], [MiddleName], [LastName], [DOB], [Gender], [Company]) VALUES (3, N'Darius                        ', NULL, N'Bingleton                     ', CAST(N'2004-10-16' AS Date), 2, NULL)
GO
INSERT [dbo].[Contact] ([ContactId], [FirstName], [MiddleName], [LastName], [DOB], [Gender], [Company]) VALUES (4, N'Anthony                       ', NULL, N'Gjivovich                     ', CAST(N'2004-03-30' AS Date), 2, NULL)
GO
INSERT [dbo].[Contact] ([ContactId], [FirstName], [MiddleName], [LastName], [DOB], [Gender], [Company]) VALUES (5, N'Andres                        ', NULL, N'Rodriguez                     ', CAST(N'1999-04-20' AS Date), 2, NULL)
GO
INSERT [dbo].[Contact] ([ContactId], [FirstName], [MiddleName], [LastName], [DOB], [Gender], [Company]) VALUES (6, N'Triggertest                   ', NULL, N'User                          ', CAST(N'2000-01-01' AS Date), 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
INSERT [dbo].[CountryDictonary] ([CountryId], [Country]) VALUES (1, N'USA                           ')
GO
INSERT [dbo].[CountryDictonary] ([CountryId], [Country]) VALUES (2, N'Other                         ')
GO
SET IDENTITY_INSERT [dbo].[Email] ON 
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (1, N'ap84388p@pace.edu', 4, 1)
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (1, N'ashleypeleg333@gmail.com', 2, 2)
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (2, N'mr18038p@pace.edu', 1, 3)
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (2, N'rourkemichael5@gmail.com', 2, 4)
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (3, N'jk87807p@pace.edu', 4, 5)
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (3, N'jkapiti7@gmail.com', 2, 6)
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (4, N'ag17839p@pace.edu', 4, 7)
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (4, N'agjivovich@pace.edu', 1, 8)
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (5, N'arodatwork@gmail.com', 1, 11)
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (5, N'arod1403@gmail.com', 2, 12)
GO
INSERT [dbo].[Email] ([ContactId], [EmailAdress], [EmailType], [EmailId]) VALUES (6, N'myemail@pace.edu', 4, 13)
GO
SET IDENTITY_INSERT [dbo].[Email] OFF
GO
INSERT [dbo].[EmailDictonary] ([EmailTypeId], [EmailType]) VALUES (1, N'Work                          ')
GO
INSERT [dbo].[EmailDictonary] ([EmailTypeId], [EmailType]) VALUES (2, N'Personal                      ')
GO
INSERT [dbo].[EmailDictonary] ([EmailTypeId], [EmailType]) VALUES (3, N'Buisness                      ')
GO
INSERT [dbo].[EmailDictonary] ([EmailTypeId], [EmailType]) VALUES (4, N'School                        ')
GO
INSERT [dbo].[EmailDictonary] ([EmailTypeId], [EmailType]) VALUES (5, N'Other                         ')
GO
INSERT [dbo].[EmailDictonary] ([EmailTypeId], [EmailType]) VALUES (6, N'Temp                          ')
GO
INSERT [dbo].[GenderDictonary] ([GenderId], [GenderType]) VALUES (0, N'NA')
GO
INSERT [dbo].[GenderDictonary] ([GenderId], [GenderType]) VALUES (1, N'F ')
GO
INSERT [dbo].[GenderDictonary] ([GenderId], [GenderType]) VALUES (2, N'M ')
GO
SET IDENTITY_INSERT [dbo].[Phone] ON 
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (1, N'914-234-4567', 1, 1012)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (1, N'914-234-1543', 2, 1013)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (1, N'913-342-5674', 1, 1014)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (2, N'914-248-7541', 1, 1015)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (2, N'914-364-1863', 2, 1016)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (3, N'917-242-4192', 1, 1017)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (4, N'(631) 040-0474', 1, 1018)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (4, N'(914) 241-8214', 1, 1019)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (4, N'(914) 773-3379', 2, 1020)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (5, N'(914)-823-2942', 2, 1026)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (5, N'(845)-204-6560', 1, 1027)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (6, N'123-456-7890', 1, 1028)
GO
INSERT [dbo].[Phone] ([ContactId], [PhoneNumber], [PhoneType], [PhoneNumberId]) VALUES (6, N'222-333-4444', 2, 1029)
GO
SET IDENTITY_INSERT [dbo].[Phone] OFF
GO
INSERT [dbo].[PhoneDictonary] ([PhoneTypeId], [PhoneType]) VALUES (1, N'Work      ')
GO
INSERT [dbo].[PhoneDictonary] ([PhoneTypeId], [PhoneType]) VALUES (2, N'Home      ')
GO
INSERT [dbo].[PhoneDictonary] ([PhoneTypeId], [PhoneType]) VALUES (3, N'Personal  ')
GO
INSERT [dbo].[PhoneDictonary] ([PhoneTypeId], [PhoneType]) VALUES (4, N'Buisness  ')
GO
INSERT [dbo].[PhoneDictonary] ([PhoneTypeId], [PhoneType]) VALUES (5, N'Cell      ')
GO
INSERT [dbo].[PhoneDictonary] ([PhoneTypeId], [PhoneType]) VALUES (6, N'Other     ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (1, N'AL ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (2, N'AK ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (3, N'AZ ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (4, N'AR ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (5, N'CA ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (6, N'CO ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (7, N'CT ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (8, N'DE ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (9, N'FL ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (10, N'GA ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (11, N'HI ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (12, N'ID ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (13, N'IL ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (14, N'IN ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (15, N'IA ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (16, N'KS ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (17, N'KY ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (18, N'LA ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (19, N'ME ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (20, N'MD ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (21, N'MA ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (22, N'MI ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (23, N'MN ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (24, N'MS ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (25, N'MO ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (26, N'MT ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (27, N'NE ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (28, N'NV ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (29, N'NH ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (30, N'NJ ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (31, N'NM ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (32, N'NY ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (33, N'NC ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (34, N'ND ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (35, N'OH ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (36, N'OK ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (37, N'OR ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (38, N'PA ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (39, N'RI ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (40, N'SC ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (41, N'SD ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (42, N'TN ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (43, N'TX ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (44, N'UT ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (45, N'VT ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (46, N'VA ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (47, N'WA ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (48, N'WV ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (49, N'WI ')
GO
INSERT [dbo].[StateDictonary] ([StateId], [State]) VALUES (50, N'WY ')
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_FirstName]  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_LastName]  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Gender]  DEFAULT ('') FOR [Gender]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Company]  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[EmailDictonary] ADD  CONSTRAINT [DF_EmailDictonary_EmailId]  DEFAULT ('') FOR [EmailTypeId]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [Connect to Address] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [Connect to Address]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [Country_Relationship] FOREIGN KEY([Country])
REFERENCES [dbo].[CountryDictonary] ([CountryId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [Country_Relationship]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_StateDictonary] FOREIGN KEY([State])
REFERENCES [dbo].[StateDictonary] ([StateId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_StateDictonary]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [Connect to Gender] FOREIGN KEY([Gender])
REFERENCES [dbo].[GenderDictonary] ([GenderId])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [Connect to Gender]
GO
ALTER TABLE [dbo].[Email]  WITH CHECK ADD  CONSTRAINT [Connect to Email] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[Email] CHECK CONSTRAINT [Connect to Email]
GO
ALTER TABLE [dbo].[EmailDictonary]  WITH CHECK ADD  CONSTRAINT [FK_EmailDictonary_EmailDictonary] FOREIGN KEY([EmailTypeId])
REFERENCES [dbo].[EmailDictonary] ([EmailTypeId])
GO
ALTER TABLE [dbo].[EmailDictonary] CHECK CONSTRAINT [FK_EmailDictonary_EmailDictonary]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_Contact]
GO
ALTER TABLE [dbo].[PhoneDictonary]  WITH CHECK ADD  CONSTRAINT [FK_PhoneDictonary_PhoneDictonary] FOREIGN KEY([PhoneTypeId])
REFERENCES [dbo].[PhoneDictonary] ([PhoneTypeId])
GO
ALTER TABLE [dbo].[PhoneDictonary] CHECK CONSTRAINT [FK_PhoneDictonary_PhoneDictonary]
GO
/****** Object:  StoredProcedure [dbo].[AddAddress]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AddAddress]
    @StreetNumber INT,
    @StreetName VARCHAR(50),
    @StreetZip NCHAR(10),
    @State INT,
    @Country INT,
    @ContactId INT,
    @AdressType INT
AS
BEGIN
