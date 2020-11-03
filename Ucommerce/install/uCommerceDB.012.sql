-- update orderid for existing billing addresses
BEGIN TRAN
update orderAddress set OrderId = purchaseOrder.OrderId
from uCommerce_PurchaseOrder purchaseOrder
join uCommerce_OrderAddress orderAddress on purchaseOrder.BillingAddressId = orderAddress.OrderAddressId
where orderAddress.OrderId is null

-- update orderid for existing shipment addresses
update orderAddress set OrderId = purchaseOrder.OrderId
from uCommerce_PurchaseOrder purchaseOrder
join uCommerce_Shipment shipment on shipment.OrderId = purchaseOrder.OrderId
join uCommerce_OrderAddress orderAddress on shipment.ShipmentAddressId = orderAddress.OrderAddressId
where orderAddress.OrderId is null
COMMIT