UPDATE uCommerce_ProductTarget
SET Skus = Sku + '|' + VariantSku where (VariantSku is not null AND VariantSku != '') AND (Sku is not null AND Sku != '')

GO

UPDATE uCommerce_ProductTarget SET Skus = Sku where Skus is null AND (Sku is not null AND Sku != '')

GO