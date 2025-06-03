    INSERT INTO dbo.Address (StreetNumber, StreetName, StreetZip, State, Country, ContactId, AdressType)
    VALUES (@StreetNumber, @StreetName, @StreetZip, @State, @Country, @ContactId, @AdressType);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddContact]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    INSERT INTO dbo.Contact (FirstName, MiddleName, LastName, DOB, Gender, Company)
    VALUES (@FirstName, @MiddleName, @LastName, @DOB, @GenderId, @Company);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddEmail]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    INSERT INTO dbo.Email (ContactId, EmailAdress, EmailType)
    VALUES (@ContactId, @EmailAdress, @EmailTypeId);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddPhone]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AddPhone]
    @ContactId INT,
    @PhoneNumber NVARCHAR(20),
    @PhoneType INT
AS
BEGIN
    INSERT INTO dbo.Phone (ContactId, PhoneNumber, PhoneType)
    VALUES (@ContactId, @PhoneNumber, @PhoneType);
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 5/9/2025 6:04:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
