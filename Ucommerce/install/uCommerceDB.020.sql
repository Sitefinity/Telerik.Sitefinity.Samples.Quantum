UPDATE uCommerce_OrderStatus SET AllowOrderEdit = 1 WHERE OrderStatusId = 2

--Enable save on orders
UPDATE uCommerce_AdminTab SET HasSaveButton = 1 WHERE VirtualPath = 'EditOrderOverview.ascx'