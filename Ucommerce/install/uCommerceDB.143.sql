-- CREATE NEW COLUMN IF IT DOESN'T EXIST
IF NOT EXISTS(SELECT * FROM sys.columns 
            WHERE Name = N'CategoryGuids' AND Object_ID = Object_ID(N'uCommerce_CategoryTarget'))
BEGIN
	ALTER TABLE uCommerce_CategoryTarget
		ADD CategoryGuids NVARCHAR(MAX) null
END