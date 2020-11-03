BEGIN
   UPDATE [dbo].[uCommerce_ProductCatalog] SET DisplayOnWebSite = 1
   ALTER TABLE [dbo].[uCommerce_ProductCatalog] DROP CONSTRAINT [uCommerce_DF_ProductCatalog_DisplayOnWebSite]
   ALTER TABLE [dbo].[uCommerce_ProductCatalog] ADD CONSTRAINT [uCommerce_DF_ProductCatalog_DisplayOnWebSite] DEFAULT ((1)) FOR [DisplayOnWebSite]
END