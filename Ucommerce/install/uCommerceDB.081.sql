GO
IF NOT EXISTS (SELECT * FROM uCommerce_AdminTab WHERE VirtualPath = 'EditOrderPayments.ascx')
BEGIN
	INSERT INTO uCommerce_AdminTaB
	VALUES ('EditOrderPayments.ascx', 5, 3, 0, 'Payments', 0, 0, 1);
END