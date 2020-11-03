DECLARE @productCatalogDefinitionTypeId AS INT
SET @productCatalogDefinitionTypeId  = 1 + (SELECT MAX(DefinitionTypeId) FROM uCommerce_DefinitionType);

IF NOT EXISTS (SELECT * FROM uCommerce_DefinitionType WHERE name = 'Product Catalogs')
BEGIN
	INSERT INTO uCommerce_DefinitionType VALUES (@productCatalogDefinitionTypeId, 'Product Catalogs', 0, 0);
END
