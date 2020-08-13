/* Create default catalog definition and set it for all catalogs with NULL definition. */
IF NOT EXISTS (SELECT 1 FROM uCommerce_Definition where [Name] = 'Default Catalog Definition')
BEGIN
  DECLARE @definitionTypeId INT
  SELECT @definitionTypeId = (SELECT DefinitionTypeId FROM uCommerce_DefinitionType where [Name] = 'Product Catalogs')

  INSERT INTO uCommerce_Definition ([Name], [DefinitionTypeId], [Description], [Deleted]) VALUES ('Default Catalog Definition', @definitionTypeId , 'Default catalog definition', 0)

  DECLARE @DefaultCatalogDefinitionId INT
  SELECT @DefaultCatalogDefinitionId = SCOPE_IDENTITY()

  UPDATE uCommerce_ProductCatalog SET DefinitionId = @DefaultCatalogDefinitionId where DefinitionId IS NULL
END

GO

/* Now that all catalogs have been assigned a definition, make the definitionId column not nullable. */
DECLARE @isDefinitionIdNullable INT
SELECT @isDefinitionIdNullable = COLUMNPROPERTY(OBJECT_ID('uCommerce_ProductCatalog', 'U'), 'DefinitionId', 'AllowsNull')
IF (@isDefinitionIdNullable = 1)
BEGIN
	ALTER TABLE uCommerce_ProductCatalog ALTER COLUMN DefinitionId INT NOT NULL
END