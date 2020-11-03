-- Recreate the ucommerce index.
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_Discount_OrderId' AND object_id = OBJECT_ID('dbo.uCommerce_Discount'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_Discount_OrderId]
	ON [dbo].[uCommerce_Discount] ([OrderId])
	INCLUDE (DiscountId,CampaignName,CampaignItemName,Description,AmountOffTotal,CreatedOn,ModifiedOn,CreatedBy,ModifiedBy)
END