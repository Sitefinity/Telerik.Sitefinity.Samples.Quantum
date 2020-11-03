IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderProperty]') AND [name] = 'IX_uCommerce_OrderProperty_Key_Incl_OrderId') BEGIN
CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderProperty_Key_Incl_OrderId] ON [dbo].[uCommerce_OrderProperty]
(
	[Key] ASC
)
INCLUDE ( 	
	[OrderId],
	[Value])
END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND [name] = 'IX_uCommerce_PurchaseOrder_OrderStatusId_Incl_CompletedDate_ProductCatalogGroupId_ModifiedOn') BEGIN
CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_OrderStatusId_Incl_CompletedDate_ProductCatalogGroupId_ModifiedOn] ON [dbo].[uCommerce_PurchaseOrder]
(
	[OrderStatusId] ASC
)
INCLUDE ( 	
	[CompletedDate],
	[ProductCatalogGroupId],
	[ModifiedOn])
END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Payment]') AND [name] = 'IX_uCommerce_Payment_OrderId_Incl_All') BEGIN
CREATE NONCLUSTERED INDEX [IX_uCommerce_Payment_OrderId_Incl_All] ON [dbo].[uCommerce_Payment]
(
	[OrderId] ASC
)
INCLUDE ( 	
	[TransactionId],
	[PaymentMethodName],
	[Created],
	[PaymentMethodId],
	[Fee],
	[FeePercentage],
	[PaymentStatusId],
	[Amount],
	[FeeTotal],
	[ReferenceId],
	[Tax],
	[TaxRate],
	[GrossAmount],
	[Guid],
	[PaymentId])
END	
	 
GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductPrice]') AND [name] = 'UX_uCommerce_ProductPrice_ProductId') BEGIN

CREATE NONCLUSTERED INDEX [UX_uCommerce_ProductPrice_ProductId] ON [dbo].[uCommerce_ProductPrice]
(
	[ProductId] ASC
)
INCLUDE ( 	
	[MinimumQuantity],
	[PriceId])
END