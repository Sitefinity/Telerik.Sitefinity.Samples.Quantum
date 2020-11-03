IF EXISTS (SELECT * FROM sys.columns WHERE Name = N'IsVirtual' AND Object_ID = Object_ID(N'uCommerce_ProductCatalog'))
BEGIN
	IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_ProductCatalog_IsVirtual'
			AND object_id = OBJECT_ID(N'dbo.uCommerce_ProductCatalog'))
	BEGIN
		DROP INDEX IX_uCommerce_ProductCatalog_IsVirtual ON dbo.uCommerce_ProductCatalog;
	END

	IF EXISTS (SELECT * FROM sys.default_constraints WHERE name = 'uCommerce_DF_ProductCatalog_IsVirtual'
			AND parent_object_id = OBJECT_ID(N'dbo.uCommerce_ProductCatalog'))
	BEGIN
		ALTER TABLE uCommerce_ProductCatalog DROP CONSTRAINT uCommerce_DF_ProductCatalog_IsVirtual
	END
	
	ALTER TABLE uCommerce_ProductCatalog DROP COLUMN IsVirtual;
END

GO


