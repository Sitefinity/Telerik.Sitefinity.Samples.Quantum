IF EXISTS (SELECT * FROM sys.columns WHERE Name = N'Order' AND Object_ID = Object_ID(N'uCommerce_OrderStatus'))
BEGIN
	IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_OrderStatus_Order'
			AND object_id = OBJECT_ID(N'dbo.uCommerce_OrderStatus'))
	BEGIN
		DROP INDEX IX_uCommerce_OrderStatus_Order ON dbo.uCommerce_OrderStatus;
	END

		
	ALTER TABLE uCommerce_OrderStatus DROP COLUMN [Order];
END

GO
