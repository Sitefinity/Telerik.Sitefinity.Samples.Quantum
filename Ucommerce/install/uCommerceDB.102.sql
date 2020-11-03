/* Add indexes to improve performance when loading order
	and related objects
*/

/* Order lines for order */
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_OrderLine_OrderId' AND object_id = OBJECT_ID('dbo.uCommerce_OrderLine'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderLine_OrderId]
	ON [dbo].[uCommerce_OrderLine] ([OrderId])
	INCLUDE ([OrderLineId],[Sku],[ProductName],[Price],[Quantity],[CreatedOn],[Discount],[VAT],[Total],[VATRate],[VariantSku],[ShipmentId],[UnitDiscount])
END
GO

/* Order lines for shipment */
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_OrderLine_ShipmentId' AND object_id = OBJECT_ID('dbo.uCommerce_OrderLine'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderLine_ShipmentId]
	ON [dbo].[uCommerce_OrderLine] ([ShipmentId])
	INCLUDE ([OrderLineId],[OrderId],[Sku],[ProductName],[Price],[Quantity],[CreatedOn],[Discount],[VAT],[Total],[VATRate],[VariantSku],[UnitDiscount])
END
GO

/* Change type of DeliveryText from ntext to nvarchar(max) to support including it index */
ALTER TABLE dbo.uCommerce_Shipment ALTER COLUMN DeliveryNote NVARCHAR(MAX)

/* Shipments for order */
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_Shipment_OrderId' AND object_id = OBJECT_ID('dbo.uCommerce_Shipment'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_Shipment_OrderId]
	ON [dbo].[uCommerce_Shipment] ([OrderId])
	INCLUDE (ShipmentId,ShipmentName,CreatedOn,ShipmentPrice,ShippingMethodId,ShipmentAddressId,DeliveryNote,TrackAndTrace,CreatedBy,Tax,TaxRate,ShipmentTotal,ShipmentDiscount)
END
GO

/* Order properties for order lines */
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'uCommerce_OrderProperty_OrderLineId' AND object_id = OBJECT_ID('dbo.uCommerce_OrderProperty'))
BEGIN
	CREATE NONCLUSTERED INDEX [uCommerce_OrderProperty_OrderLineId]
	ON [dbo].[uCommerce_OrderProperty] ([OrderLineId])
	INCLUDE ([OrderPropertyId],[OrderId],[Key],[Value])
END
GO

/* Discounts for orders */
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_Discount_OrderId' AND object_id = OBJECT_ID('dbo.uCommerce_Discount'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_Discount_OrderId]
	ON [dbo].[uCommerce_Discount] ([OrderId])
	INCLUDE (DiscountId,CampaignName,CampaignItemName,Description,AmountOffTotal,CreatedOn,ModifiedOn,CreatedBy,ModifiedBy)
END
GO

/* Order status audit for order */
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_OrderStatusAudit_OrderId' AND object_id = OBJECT_ID('dbo.uCommerce_OrderStatusAudit'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatusAudit_OrderId]
	ON [dbo].[uCommerce_OrderStatusAudit] ([OrderId])
	INCLUDE (OrderStatusAuditId,NewOrderStatusId,CreatedOn,CreatedBy,Message)
END
GO