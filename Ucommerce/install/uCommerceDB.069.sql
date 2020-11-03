-- Allowed price groups on catalog relation table
CREATE TABLE [dbo].[uCommerce_ProductCatalogPriceGroupRelation](
	[ProductCatalogPriceGroupRelationId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCatalogId] [int] NOT NULL,
	[PriceGroupId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_uCommerce_ProductCatalogPriceGroupRelation] PRIMARY KEY CLUSTERED 
(
	[ProductCatalogPriceGroupRelationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

ALTER TABLE [dbo].[uCommerce_ProductCatalogPriceGroupRelation] ADD  CONSTRAINT [DF_uCommerce_ProductCatalogPriceGroupRelation_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO

ALTER TABLE [dbo].[uCommerce_ProductCatalogPriceGroupRelation]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_ProductCatalogPriceGroupRelation_uCommerce_PriceGroup] FOREIGN KEY([PriceGroupId])
REFERENCES [dbo].[uCommerce_PriceGroup] ([PriceGroupId])
GO

ALTER TABLE [dbo].[uCommerce_ProductCatalogPriceGroupRelation] CHECK CONSTRAINT [FK_uCommerce_ProductCatalogPriceGroupRelation_uCommerce_PriceGroup]
GO

ALTER TABLE [dbo].[uCommerce_ProductCatalogPriceGroupRelation]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_ProductCatalogPriceGroupRelation_uCommerce_ProductCatalog] FOREIGN KEY([ProductCatalogId])
REFERENCES [dbo].[uCommerce_ProductCatalog] ([ProductCatalogId])
GO

ALTER TABLE [dbo].[uCommerce_ProductCatalogPriceGroupRelation] CHECK CONSTRAINT [FK_uCommerce_ProductCatalogPriceGroupRelation_uCommerce_ProductCatalog]
GO


