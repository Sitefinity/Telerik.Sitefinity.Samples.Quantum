IF NOT EXISTS (SELECT * FROM sys.columns
	WHERE  object_id = OBJECT_ID(N'[dbo].[uCommerce_ProductCatalog]') 
	AND name = 'DefinitionId'
)
BEGIN
	ALTER TABLE uCommerce_ProductCatalog
    ADD DefinitionId INT,
    FOREIGN KEY(DefinitionId) REFERENCES uCommerce_Definition(DefinitionId);
END