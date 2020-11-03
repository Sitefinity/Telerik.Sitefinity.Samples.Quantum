IF EXISTS (SELECT * FROM sys.columns WHERE Name = N'ContentId' AND Object_ID = Object_ID(N'uCommerce_CategoryDescription'))
BEGIN
	IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_CategoryDescription_ContentId'
			AND object_id = OBJECT_ID(N'dbo.uCommerce_CategoryDescription'))
	BEGIN
		DROP INDEX IX_uCommerce_CategoryDescription_ContentId ON dbo.uCommerce_CategoryDescription;
	END

	ALTER TABLE uCommerce_CategoryDescription DROP COLUMN ContentId;
END

GO