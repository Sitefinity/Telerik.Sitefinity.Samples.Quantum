IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_uCommerce_ProductDefinitionId')
   AND parent_object_id = OBJECT_ID(N'dbo.uCommerce_ProductDefinitionRelation'))
BEGIN
	ALTER TABLE uCommerce_ProductDefinitionRelation ADD CONSTRAINT FK_uCommerce_ProductDefinitionId FOREIGN KEY (ProductDefinitionId) REFERENCES uCommerce_ProductDefinition(ProductDefinitionId)
END

GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_uCommerce_ParentProductDefinitionId')
   AND parent_object_id = OBJECT_ID(N'dbo.uCommerce_ProductDefinitionRelation'))
BEGIN
	ALTER TABLE uCommerce_ProductDefinitionRelation ADD CONSTRAINT FK_uCommerce_ParentProductDefinitionId FOREIGN KEY (ParentProductDefinitionId) REFERENCES uCommerce_ProductDefinition(ProductDefinitionId)
END

GO