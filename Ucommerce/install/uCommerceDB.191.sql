/*Update PriceGroupPrice to Price table*/
IF NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[uCommerce_Price]'))
BEGIN
	/*Drop foreign keys*/
	ALTER TABLE [uCommerce_PriceGroupPrice]
	DROP CONSTRAINT uCommerce_FK_PriceGroupPrice_Product;
	
       	/*Drop indexes*/
	DROP INDEX IX_uCommerce_PriceGroupPrice_ProductId ON [dbo].[uCommerce_PriceGroupPrice];
	DROP INDEX UX_uCommerce_PriceGroupPrice_ProductId_PriceGroupId ON [dbo].[uCommerce_PriceGroupPrice];
	DROP INDEX IX_uCommerce_PriceGroupPrice_PriceGroupId ON [dbo].[uCommerce_PriceGroupPrice];

	/*Remove columns*/
	ALTER TABLE [dbo].[uCommerce_PriceGroupPrice]
	DROP COLUMN DiscountPrice;

	ALTER TABLE [dbo].[uCommerce_PriceGroupPrice]
	DROP COLUMN ProductId;

	/*Add columns*/
	ALTER TABLE [dbo].[uCommerce_PriceGroupPrice]
	ADD [Guid] [uniqueidentifier] NOT NULL CONSTRAINT DF__uCommerce___Guid DEFAULT (newsequentialid()) WITH VALUES
	
	/*update price where value = null*/
	UPDATE [dbo].[uCommerce_PriceGroupPrice] SET Price = 0 WHERE Price is null;

	/*Not null on Price*/
	ALTER TABLE [dbo].[uCommerce_PriceGroupPrice] ALTER COLUMN Price MONEY NOT NULL

	/*Renaming*/
	EXEC sp_rename 'uCommerce_PriceGroupPrice.PriceGroupPriceId', 'PriceId', 'COLUMN'
	EXEC sp_rename 'uCommerce_PriceGroupPrice.Price', 'Amount', 'COLUMN';
	EXEC sp_rename 'uCommerce_PriceGroupPrice', 'uCommerce_Price';
	EXEC sp_rename 'uCommerce_PK_PriceGroupPrice', 'uCommerce_PK_Price'; 
	 
	/*Add indexes*/
	CREATE INDEX IX_uCommerce_Price_PriceGroupId
	ON [dbo].[uCommerce_Price] (PriceGroupId);

	CREATE UNIQUE INDEX UX_uCommerce_Price_Guid
	ON [dbo].[uCommerce_Price] ([Guid]);
END