-- DELETE OLD COLUMN
IF EXISTS(SELECT * FROM sys.columns 
            WHERE Name = N'CategoryGuid' AND Object_ID = Object_ID(N'uCommerce_CategoryTarget'))
BEGIN
	ALTER TABLE uCommerce_CategoryTarget
		DROP COLUMN CategoryGuid
END

IF EXISTS(SELECT * FROM sys.columns 
            WHERE Name = N'Name' AND Object_ID = Object_ID(N'uCommerce_CategoryTarget'))
BEGIN
	ALTER TABLE uCommerce_CategoryTarget
		ALTER COLUMN Name NVARCHAR(MAX) NOT NULL
END