-- Change the datatype of AmountOffTotal on uCommerce_Discount.
IF EXISTS (SELECT * FROM sys.columns WHERE name = 'AmountOffTotal' AND object_id = OBJECT_ID('dbo.uCommerce_Discount'))
BEGIN
	ALTER TABLE uCommerce_Discount
	ALTER COLUMN AmountOffTotal MONEY NOT NULL;
END