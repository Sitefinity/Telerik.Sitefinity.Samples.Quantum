-- Move reference from shipment to orderline part 3 of 3
PRINT N'Adding foreign keys to [dbo].[uCommerce_OrderLine]'
 
ALTER TABLE [dbo].[uCommerce_OrderLine] ADD
CONSTRAINT [FK_OrderLine_Shipment] FOREIGN KEY ([ShipmentId]) REFERENCES [dbo].[uCommerce_Shipment] ([ShipmentId])

-- Update existing order lines to default shipment
UPDATE ol SET ol.ShipmentId = s.ShipmentId FROM uCommerce_OrderLine ol JOIN uCommerce_Shipment s ON ol.OrderId = s.OrderId