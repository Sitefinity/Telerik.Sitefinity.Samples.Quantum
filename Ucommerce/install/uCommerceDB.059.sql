/*********************************/
/*** Common upgrade Query List for uCommerce 3 ***/
/*********************************/

ALTER TABLE uCommerce_ProductDefinitionFieldDescription ADD [Description] NVARCHAR(MAX) NULL

INSERT INTO uCommerce_DataType (TypeName, Nullable, ValidationExpression, BuiltIn, DefinitionName, Deleted) VALUES ('Content', 1, '', 1, 'Content', 0)

--Remove erronous foreign key from shipment to order line
ALTER TABLE [dbo].[uCommerce_Shipment] DROP COLUMN OrderLineId

-- Add foreign key for product variant hierarchies
ALTER TABLE [dbo].[uCommerce_Product]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_Product_ParentProduct] FOREIGN KEY([ParentProductId])
REFERENCES [dbo].[uCommerce_Product] ([ProductId])

-- Add foreign key for category hierarchies
ALTER TABLE [dbo].[uCommerce_Category]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_Category_ParentCategory] FOREIGN KEY([ParentCategoryId])
REFERENCES [dbo].[uCommerce_Category] ([CategoryId])

-- Add index for basketid
CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_BasketId] ON [dbo].[uCommerce_PurchaseOrder] 
(
	[BasketId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

-- Foreign keys for EmailProfileInformation
ALTER TABLE [dbo].[uCommerce_EmailProfileInformation]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_EmailProfileInformation_uCommerce_EmailType] FOREIGN KEY([EmailTypeId])
REFERENCES [dbo].[uCommerce_EmailType] ([EmailTypeId])
GO

ALTER TABLE [dbo].[uCommerce_EmailProfileInformation] CHECK CONSTRAINT [FK_uCommerce_EmailProfileInformation_uCommerce_EmailType]
GO


ALTER TABLE [dbo].[uCommerce_EmailProfileInformation]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_EmailProfileInformation_uCommerce_EmailProfile] FOREIGN KEY([EmailProfileId])
REFERENCES [dbo].[uCommerce_EmailProfile] ([EmailProfileId])
GO

ALTER TABLE [dbo].[uCommerce_EmailProfileInformation] CHECK CONSTRAINT [FK_uCommerce_EmailProfileInformation_uCommerce_EmailProfile]
GO