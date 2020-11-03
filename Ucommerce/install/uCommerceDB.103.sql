/* Add indexes to improve performance when loading a single product page */

/* CategoryProductRelations */
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_CategoryProductRelation_ProductId' AND object_id = OBJECT_ID('dbo.uCommerce_CategoryProductRelation'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryProductRelation_ProductId]
	ON [dbo].[uCommerce_CategoryProductRelation] ([ProductId])
	INCLUDE ([CategoryProductRelationId],[CategoryId],[SortOrder])
END

GO

/* PriceGroup prices */
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_PriceGroupPrice_PriceGroupId' AND object_id = OBJECT_ID('dbo.uCommerce_PriceGroupPrice'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_PriceGroupPrice_PriceGroupId]
	ON [dbo].[uCommerce_PriceGroupPrice] ([PriceGroupId])
	INCLUDE ([Price])
END

GO

/* Categories in Catalog */
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_Category_ProductCatalogId' AND object_id = OBJECT_ID('dbo.uCommerce_Category'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_Category_ProductCatalogId]
	ON [dbo].[uCommerce_Category] ([ProductCatalogId],[Deleted])
	INCLUDE ([CategoryId],[Name],[ImageMediaId],[DisplayOnSite],[CreatedOn],[ParentCategoryId],[ModifiedOn],[ModifiedBy],[SortOrder],[CreatedBy],[DefinitionId],[Guid])
END

GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_Category_ParentCategoryId' AND object_id = OBJECT_ID('dbo.uCommerce_Category'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_Category_ParentCategoryId]
	ON [dbo].[uCommerce_Category] ([ParentCategoryId],[Deleted])
END

GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_uCommerce_CategoryDescription_CategoryId' AND object_id = OBJECT_ID('dbo.uCommerce_CategoryDescription'))
BEGIN
	CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryDescription_CategoryId]
	ON [dbo].[uCommerce_CategoryDescription] ([CategoryId])
	INCLUDE ([CategoryDescriptionId],[DisplayName],[Description],[CultureCode])
END

GO

