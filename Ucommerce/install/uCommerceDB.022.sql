-- Move reference from shipment to orderline part 2 of 3
PRINT N'Altering [dbo].[uCommerce_OrderLine]'

ALTER TABLE [dbo].[uCommerce_OrderLine] ADD
[ShipmentId] [int] NULL