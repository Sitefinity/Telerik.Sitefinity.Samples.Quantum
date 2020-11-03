/* Up the character limit for SKU from 30 to 400. This is the maximum, as the UX_uCommerce_Product_Sku_VariantSku would exceed the size limit. */
IF EXISTS (SELECT 1
			   FROM INFORMATION_SCHEMA.COLUMNS
			   WHERE [TABLE_NAME] = 'uCommerce_Product'
			   AND [COLUMN_NAME] = 'Sku'
			   AND [DATA_TYPE] = 'NVARCHAR'
			   AND [CHARACTER_MAXIMUM_LENGTH] = 30)
BEGIN
	DROP INDEX IF EXISTS [IX_uCommerce_Product_Sku] ON [uCommerce_Product]
	DROP INDEX IF EXISTS [UX_uCommerce_Product_Sku_VariantSku] ON [uCommerce_Product]
	ALTER TABLE [uCommerce_Product] ALTER COLUMN [Sku] NVARCHAR(400)
	CREATE NONCLUSTERED INDEX [IX_uCommerce_Product_Sku] ON [dbo].[uCommerce_Product]
	(
		[Sku] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Product_Sku_VariantSku] ON [dbo].[uCommerce_Product]
	(
		[Sku] ASC,
		[VariantSku] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END