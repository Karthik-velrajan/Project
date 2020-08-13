USE [Billing_and_Collections]
GO
-- ENTER ALL INFORMATION IN UPPER CASE

DECLARE @ProducerCode NVARCHAR(50)
DECLARE @ProducerName NVARCHAR(55)
DECLARE @Address1 NVARCHAR(255)
DECLARE @Address2 NVARCHAR(255)
DECLARE @Address3 NVARCHAR(255)
DECLARE @City NVARCHAR(255)
DECLARE @State NVARCHAR(255)
DECLARE @Zip NVARCHAR(255)

              
       
SET @ProducerCode = 'KOSI0001'
SET @ProducerName = 'UVIS KOSICH INS AGENCY, INC.'
SET @Address1 = '3435 MT DIABLO BLVD STE 300'
SET @Address2 = ''
SET @Address3 = ''
set @city ='LAFAYETTE'
SET @State = 'CA'
SET @Zip = '94549'

--SELECT * FROM [tbl AGENTS] WHERE [Producer ID] IN ('REGI0314')
--SELECT * FROM [tblLetters] WHERE [Producer Code] IN ('REGI0314')

IF NOT EXISTS(SELECT 1 FROM [tbl AGENTS] WHERE [Producer ID] = @ProducerCode)
BEGIN
	INSERT INTO [tbl Agents] ([Producer ID] ,[Producer])
		VALUES (@ProducerCode, @ProducerName)
END
ELSE
BEGIN
	UPDATE [tbl Agents]
	SET [Producer] = @ProducerName
	WHERE [Producer ID] = @ProducerCode
END


IF NOT EXISTS(SELECT 1 FROM [tblLetters] WHERE [Producer Code] = @ProducerCode)
BEGIN
	INSERT INTO [tblLetters] ([Producer Name], [Producer Code], [Address 1], [Address 2], [Address 3], [City], [State], [Zip])
		VALUES (@ProducerName, @ProducerCode, @Address1, @Address2, @Address3, @City, @State, @Zip)
END
ELSE
BEGIN
	UPDATE [tblLetters]
	SET [Producer Name] = @ProducerName
	,[Address 1] = @Address1
	,[Address 2] = @Address2
	,[Address 3] = @Address3
	,[City] = @City
	,[State] = @State
	,[Zip] = @Zip
	WHERE [Producer Code] = @ProducerCode
END