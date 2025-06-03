CREATE PROCEDURE [dbo].[AddContact]
    @FirstName NVARCHAR(30),
    @MiddleName NVARCHAR(30),
    @LastName NVARCHAR(30),
    @DOB DATE,
    @GenderType NVARCHAR(10),
    @Company NVARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @GenderId INT;

    -- Format names before inserting
    SET @FirstName = UPPER(LEFT(@FirstName, 1)) + LOWER(SUBSTRING(@FirstName, 2, LEN(@FirstName)));
    SET @MiddleName = UPPER(LEFT(@MiddleName, 1)) + LOWER(SUBSTRING(@MiddleName, 2, LEN(@MiddleName)));
    SET @LastName = UPPER(LEFT(@LastName, 1)) + LOWER(SUBSTRING(@LastName, 2, LEN(@LastName)));

    -- Lookup Gender ID
    SELECT @GenderId = GenderId
    FROM dbo.GenderDictonary
    WHERE GenderType = @GenderType;

    -- Fail early if gender is invalid
    IF @GenderId IS NULL
    BEGIN
        PRINT 'Invalid gender type.';
        RETURN;
    END

    -- Insert the formatted values
CREATE PROCEDURE [dbo].[AddEmail]
    @ContactId INT,
    @EmailAdress NVARCHAR(50),
    @EmailTypeName NVARCHAR(50)  -- you now pass the type name like 'Personal' or 'School'
AS
BEGIN
    DECLARE @EmailTypeId INT;

    -- Get the corresponding EmailTypeId from the dictionary
    SELECT @EmailTypeId = EmailTypeId
    FROM dbo.EmailDictonary
    WHERE EmailType = @EmailTypeName;

    -- If it doesn't exist, throw an error
    IF @EmailTypeId IS NULL
    BEGIN
        THROW 50000, 'Invalid EmailType name provided.', 1;
        RETURN;
    END

    -- Insert using the resolved EmailTypeId
CREATE PROCEDURE [dbo].[DeleteContact]
    @ContactId INT
AS
BEGIN
    -- Check if the contact exists
    IF EXISTS (SELECT 1 FROM dbo.Contact WHERE ContactId = @ContactId)
    BEGIN
        -- Delete related records first
        DELETE FROM dbo.Phone WHERE ContactId = @ContactId;
        DELETE FROM dbo.Email WHERE ContactId = @ContactId;
        DELETE FROM dbo.Address WHERE ContactId = @ContactId;

        -- Now delete the contact
        DELETE FROM dbo.Contact WHERE ContactId = @ContactId;

        PRINT 'Contact ID ' + CAST(@ContactId AS NVARCHAR(10)) + ' and related records deleted successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Contact does not exist.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[EditAddress]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditAddress]
    @AdressID INT,
    @Field NVARCHAR(50),
    @NewValue NVARCHAR(255)
AS
BEGIN
    -- Check if the address exists
    IF EXISTS (SELECT 1 FROM dbo.Address WHERE AdressID = @AdressID)
    BEGIN
        -- If editing the ContactId field, first check if the new ContactId exists
        IF @Field = 'ContactId'
        BEGIN
            IF EXISTS (SELECT 1 FROM dbo.Contact WHERE ContactId = CAST(@NewValue AS INT))
            BEGIN
                UPDATE dbo.Address SET ContactId = CAST(@NewValue AS INT) WHERE AdressID = @AdressID;
            END
            ELSE
            BEGIN
                PRINT 'Cannot update: ContactId does not exist';
            END
        END
        ELSE
        BEGIN
            -- Update other fields
            IF @Field = 'StreetNumber'
                UPDATE dbo.Address SET StreetNumber = CAST(@NewValue AS INT) WHERE AdressID = @AdressID;

            ELSE IF @Field = 'StreetName'
                UPDATE dbo.Address SET StreetName = @NewValue WHERE AdressID = @AdressID;

            ELSE IF @Field = 'StreetZip'
                UPDATE dbo.Address SET StreetZip = @NewValue WHERE AdressID = @AdressID;

            ELSE IF @Field = 'State'
                UPDATE dbo.Address SET State = CAST(@NewValue AS INT) WHERE AdressID = @AdressID;

            ELSE IF @Field = 'Country'
                UPDATE dbo.Address SET Country = CAST(@NewValue AS INT) WHERE AdressID = @AdressID;

            ELSE IF @Field = 'AdressType'
                UPDATE dbo.Address SET AdressType = CAST(@NewValue AS INT) WHERE AdressID = @AdressID;

            ELSE
                PRINT 'Invalid field name';
        END
    END
    ELSE
    BEGIN
        PRINT 'Address does not exist';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[EditContact]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditContact]
    @ContactId INT,
    @Field NVARCHAR(50),
    @NewValue NVARCHAR(255)
AS
BEGIN
    -- Check if the contact exists
    IF EXISTS (SELECT 1 FROM dbo.Contact WHERE ContactId = @ContactId)
    BEGIN
        -- Update one field based on the input
        IF @Field = 'FirstName'
            UPDATE dbo.Contact SET FirstName = @NewValue WHERE ContactId = @ContactId;

        ELSE IF @Field = 'MiddleName'
            UPDATE dbo.Contact SET MiddleName = @NewValue WHERE ContactId = @ContactId;

        ELSE IF @Field = 'LastName'
            UPDATE dbo.Contact SET LastName = @NewValue WHERE ContactId = @ContactId;

        ELSE IF @Field = 'DOB'
            UPDATE dbo.Contact SET DOB = CAST(@NewValue AS DATE) WHERE ContactId = @ContactId;

        ELSE IF @Field = 'Gender'
            UPDATE dbo.Contact SET Gender = CAST(@NewValue AS INT) WHERE ContactId = @ContactId;

        ELSE IF @Field = 'Company'
            UPDATE dbo.Contact SET Company = @NewValue WHERE ContactId = @ContactId;

        ELSE
            PRINT 'Invalid field name';
    END
    ELSE
    BEGIN
        PRINT 'Contact does not exist';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[EditEmail]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditEmail]
    @EmailId INT,
    @Field NVARCHAR(50),
    @NewValue NVARCHAR(255)
AS
BEGIN
    -- Check if the email record exists
    IF EXISTS (SELECT 1 FROM dbo.Email WHERE EmailId = @EmailId)
    BEGIN
        -- If updating ContactId, check if the new ContactId exists first
        IF @Field = 'ContactId'
        BEGIN
            IF EXISTS (SELECT 1 FROM dbo.Contact WHERE ContactId = CAST(@NewValue AS INT))
            BEGIN
                UPDATE dbo.Email SET ContactId = CAST(@NewValue AS INT) WHERE EmailId = @EmailId;
            END
            ELSE
            BEGIN
                PRINT 'Cannot update: ContactId does not exist';
            END
        END
        ELSE
        BEGIN
            -- Update other fields
            IF @Field = 'EmailAdress'
                UPDATE dbo.Email SET EmailAdress = @NewValue WHERE EmailId = @EmailId;

            ELSE IF @Field = 'EmailType'
                UPDATE dbo.Email SET EmailType = CAST(@NewValue AS INT) WHERE EmailId = @EmailId;

            ELSE
                PRINT 'Invalid field name';
        END
    END
    ELSE
    BEGIN
        PRINT 'Email record does not exist';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[EditPhone]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditPhone]
    @PhoneNumberId INT,
    @Field NVARCHAR(50),
    @NewValue NVARCHAR(255)
AS
BEGIN
    -- Check if the phone record exists
    IF EXISTS (SELECT 1 FROM dbo.Phone WHERE PhoneNumberId = @PhoneNumberId)
    BEGIN
        -- If updating ContactId, check if the new ContactId exists first
        IF @Field = 'ContactId'
        BEGIN
            IF EXISTS (SELECT 1 FROM dbo.Contact WHERE ContactId = CAST(@NewValue AS INT))
            BEGIN
                UPDATE dbo.Phone SET ContactId = CAST(@NewValue AS INT) WHERE PhoneNumberId = @PhoneNumberId;
            END
            ELSE
            BEGIN
                PRINT 'Cannot update: ContactId does not exist';
            END
        END
        ELSE
        BEGIN
            -- Update other fields
            IF @Field = 'PhoneNumber'
                UPDATE dbo.Phone SET PhoneNumber = @NewValue WHERE PhoneNumberId = @PhoneNumberId;

            ELSE IF @Field = 'PhoneType'
                UPDATE dbo.Phone SET PhoneType = CAST(@NewValue AS INT) WHERE PhoneNumberId = @PhoneNumberId;

            ELSE
                PRINT 'Invalid field name';
        END
    END
    ELSE
    BEGIN
        PRINT 'Phone record does not exist';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[ShowContactDetails]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowContactDetails]
    @FirstName NVARCHAR(30)
AS
BEGIN
    -- Contact Info with gender type
    SELECT 
        c.ContactId,
        c.FirstName,
        c.MiddleName,
        c.LastName,
        c.DOB,
        g.GenderType AS Gender,
        c.Company,
        c.Age
    FROM dbo.Contact c
    INNER JOIN dbo.GenderDictonary g ON c.Gender = g.GenderId
    WHERE c.FirstName = @FirstName;

    -- Email Info
    SELECT * FROM v_FullEmail WHERE FirstName = @FirstName;

    -- Address Info
    SELECT * FROM v_FullAddress WHERE FirstName = @FirstName;

    -- Phone Info
    SELECT * FROM v_FullPhone WHERE FirstName = @FirstName;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 15
               Left = 96
               Bottom = 324
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 15
               Left = 520
               Bottom = 238
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 15
               Left = 944
               Bottom = 238
               Right = 1272
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ctry"
            Begin Extent = 
               Top = 15
               Left = 1368
               Bottom = 238
               Right = 1696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 15
               Left = 1792
               Bottom = 324
               Right = 2120
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 600
         Width = 600
         Width = 600
         Width = 600
         Width = 600
         Width = 600
         Width = 600
         Width = 600
         Width = 600
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_FullAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_FullAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_FullAddress'
GO
USE [master]
GO
