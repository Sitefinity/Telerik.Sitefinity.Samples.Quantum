/* Create default catalog group definition and set it for all catalog groups with NULL definition. */
IF NOT EXISTS (SELECT 1 FROM uCommerce_Definition where [Name] = 'Default Product Catalog Group Definition')
BEGIN
  DECLARE @definitionTypeId INT
  SELECT @definitionTypeId = (SELECT DefinitionTypeId FROM uCommerce_DefinitionType where [Name] = 'Product Catalog Groups')

  INSERT INTO uCommerce_Definition ([Name], [DefinitionTypeId], [Description], [Deleted]) VALUES ('Default Product Catalog Group Definition', @definitionTypeId , 'Default product catalog group definition', 0)

  DECLARE @DefaultCatalogDefinitionId INT
  SELECT @DefaultCatalogDefinitionId = SCOPE_IDENTITY()

  UPDATE uCommerce_ProductCatalogGroup SET DefinitionId = @DefaultCatalogDefinitionId where DefinitionId IS NULL
END

GO

/* Now that all catalog groups have been assigned a definition, make the definitionId column not nullable. */
DECLARE @isDefinitionIdNullable INT
SELECT @isDefinitionIdNullable = COLUMNPROPERTY(OBJECT_ID('uCommerce_ProductCatalogGroup', 'U'), 'DefinitionId', 'AllowsNull')
IF (@isDefinitionIdNullable = 1)
BEGIN
	ALTER TABLE uCommerce_ProductCatalogGroup ALTER COLUMN DefinitionId INT NOT NULL
END