IF EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'Sku' AND [object_id] = OBJECT_ID(N'uCommerce_ProductTarget'))
BEGIN
    ALTER TABLE uCommerce_ProductTarget DROP COLUMN Sku
END

GO

IF EXISTS(SELECT * FROM sys.columns 
        WHERE [name] = N'VariantSku' AND [object_id] = OBJECT_ID(N'uCommerce_ProductTarget'))
BEGIN
    ALTER TABLE uCommerce_ProductTarget DROP COLUMN VariantSku
END

GO