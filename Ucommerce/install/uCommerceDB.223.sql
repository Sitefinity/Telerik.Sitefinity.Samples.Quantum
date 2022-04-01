/* Add secret to product catalog group */
if not (exists (SELECT * FROM information_schema.COLUMNS WHERE TABLE_NAME = 'uCommerce_ProductCatalogGroup' AND COLUMN_NAME = 'Secret')) 
begin
    ALTER TABLE uCommerce_ProductCatalogGroup ADD Secret nvarchar(max) NOT NULL DEFAULT 'secret'
end