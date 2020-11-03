ALTER TABLE uCommerce_Shipment ADD ShipmentDiscount MONEY

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[uCommerce_ShipmentDiscountRelation](
	[ShipmentDiscountRelationId] [int] IDENTITY(1,1) NOT NULL,
	[ShipmentId] [int] NOT NULL,
	[DiscountId] [int] NOT NULL,
 CONSTRAINT [PK_uCommerce_ShipmentDiscountRelation] PRIMARY KEY CLUSTERED 
(
	[ShipmentDiscountRelationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO

ALTER TABLE [dbo].[uCommerce_ShipmentDiscountRelation]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_ShipmentDiscountRelation_uCommerce_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[uCommerce_Discount] ([DiscountId])
GO

ALTER TABLE [dbo].[uCommerce_ShipmentDiscountRelation] CHECK CONSTRAINT [FK_uCommerce_ShipmentDiscountRelation_uCommerce_Discount]
GO

ALTER TABLE [dbo].[uCommerce_ShipmentDiscountRelation]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_ShipmentDiscountRelation_uCommerce_Shipment] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[uCommerce_Shipment] ([ShipmentId])
GO

ALTER TABLE [dbo].[uCommerce_ShipmentDiscountRelation] CHECK CONSTRAINT [FK_uCommerce_ShipmentDiscountRelation_uCommerce_Shipment]
GO