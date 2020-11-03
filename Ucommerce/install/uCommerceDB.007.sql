CREATE NONCLUSTERED INDEX [IX_uCommerce_PriceGroupPrice_ProductId] ON [dbo].[uCommerce_PriceGroupPrice] ([ProductId])

CREATE NONCLUSTERED INDEX [IX_uCommerce_Product_ParentProductId] ON [dbo].[uCommerce_Product] ([ParentProductId])

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDescription_ProductId] ON [dbo].[uCommerce_ProductDescription] ([ProductId])

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductProperty_ProductId] ON [dbo].[uCommerce_ProductProperty] ([ProductId])