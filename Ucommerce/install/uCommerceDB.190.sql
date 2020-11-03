/*Add PriceGroupPrice data to ProductPrice table*/
IF EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[uCommerce_PriceGroupPrice]'))
BEGIN
	/*Insert data into ProductPrice*/
	INSERT INTO [dbo].[uCommerce_ProductPrice] ([ProductId], [PriceId], [GUID]) 
		SELECT pgp.ProductId, pgp.PriceGroupPriceId, NEWID() FROM [dbo].[uCommerce_PriceGroupPrice] pgp 
		where not exists (SELECT * from uCommerce_ProductPrice pp where pp.PriceId != pgp.PriceGroupPriceId and pp.ProductId != pgp.ProductId)
END

