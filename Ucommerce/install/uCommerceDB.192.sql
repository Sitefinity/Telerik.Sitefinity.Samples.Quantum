/*Add foreign key on ProductPrice.PriceId*/
ALTER TABLE [dbo].[uCommerce_ProductPrice]
ADD FOREIGN KEY (PriceId) REFERENCES uCommerce_Price(PriceId);

ALTER TABLE [dbo].[uCommerce_ProductPrice]
ADD FOREIGN KEY (ProductId) REFERENCES uCommerce_Product(ProductId);

/*Add indexes*/
IF EXISTS(SELECT * 
	FROM sys.indexes 
	WHERE name='IX_uCommerce_ProductPrice_ProductId' AND object_id = OBJECT_ID('Schema.[uCommerce_ProductPrice]'))
BEGIN
	CREATE INDEX IX_uCommerce_ProductPrice_ProductId
	ON [dbo].[uCommerce_ProductPrice] (ProductId);
	
	CREATE INDEX IX_uCommerce_ProductPrice_PriceId
	ON [dbo].[uCommerce_ProductPrice] (PriceId);
	
	CREATE UNIQUE INDEX UX_uCommerce_ProductPrice_Guid
	ON [dbo].[uCommerce_ProductPrice] ([Guid]);
END