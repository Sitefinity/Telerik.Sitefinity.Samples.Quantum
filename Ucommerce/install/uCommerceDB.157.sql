IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_UserGroup_ExternalId' AND object_id = OBJECT_ID('uCommerce_UserGroup')) BEGIN
DROP INDEX [IX_uCommerce_UserGroup_ExternalId]
    ON [dbo].[uCommerce_UserGroup];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_Category_ProductCatalogId' AND object_id = OBJECT_ID('uCommerce_Category')) BEGIN
DROP INDEX [IX_uCommerce_Category_ProductCatalogId]
    ON [dbo].[uCommerce_Category];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_CategoryDescription_CategoryId' AND object_id = OBJECT_ID('uCommerce_CategoryDescription')) BEGIN
DROP INDEX [IX_uCommerce_CategoryDescription_CategoryId]
    ON [dbo].[uCommerce_CategoryDescription];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_CategoryProductRelation_ProductId' AND object_id = OBJECT_ID('uCommerce_CategoryProductRelation')) BEGIN
DROP INDEX [IX_uCommerce_CategoryProductRelation_ProductId]
    ON [dbo].[uCommerce_CategoryProductRelation];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_CategoryProperty_CategoryId' AND object_id = OBJECT_ID('uCommerce_CategoryProperty')) BEGIN
DROP INDEX [IX_uCommerce_CategoryProperty_CategoryId]
    ON [dbo].[uCommerce_CategoryProperty];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_Discount_OrderId' AND object_id = OBJECT_ID('uCommerce_Discount')) BEGIN
DROP INDEX [IX_uCommerce_Discount_OrderId]
    ON [dbo].[uCommerce_Discount];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_OrderLine_OrderId' AND object_id = OBJECT_ID('uCommerce_OrderLine')) BEGIN
DROP INDEX [IX_uCommerce_OrderLine_OrderId]
    ON [dbo].[uCommerce_OrderLine];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_OrderLine_ShipmentId' AND object_id = OBJECT_ID('uCommerce_OrderLine')) BEGIN
DROP INDEX [IX_uCommerce_OrderLine_ShipmentId]
    ON [dbo].[uCommerce_OrderLine];
END


GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_OrderStatusAudit_OrderId' AND object_id = OBJECT_ID('uCommerce_OrderStatusAudit')) BEGIN
DROP INDEX [IX_uCommerce_OrderStatusAudit_OrderId]
    ON [dbo].[uCommerce_OrderStatusAudit];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_PriceGroupPrice_PriceGroupId' AND object_id = OBJECT_ID('uCommerce_PriceGroupPrice')) BEGIN
DROP INDEX [IX_uCommerce_PriceGroupPrice_PriceGroupId]
    ON [dbo].[uCommerce_PriceGroupPrice];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_Shipment_OrderId' AND object_id = OBJECT_ID('uCommerce_Shipment')) BEGIN
DROP INDEX [IX_uCommerce_Shipment_OrderId]
    ON [dbo].[uCommerce_Shipment];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_AdminPage' AND object_id = OBJECT_ID('uCommerce_AdminPage')) BEGIN
DROP INDEX [IX_AdminPage]
    ON [dbo].[uCommerce_AdminPage];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_Campaign' AND object_id = OBJECT_ID('uCommerce_Campaign')) BEGIN
DROP INDEX [IX_uCommerce_Campaign]
    ON [dbo].[uCommerce_Campaign];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_Category' AND object_id = OBJECT_ID('uCommerce_Category')) BEGIN
DROP INDEX [IX_Category]
    ON [dbo].[uCommerce_Category];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_CategoryProductRelation' AND object_id = OBJECT_ID('uCommerce_CategoryProductRelation')) BEGIN
DROP INDEX [IX_CategoryProductRelation]
    ON [dbo].[uCommerce_CategoryProductRelation];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_Definition' AND object_id = OBJECT_ID('uCommerce_Definition')) BEGIN
DROP INDEX [IX_uCommerce_Definition]
    ON [dbo].[uCommerce_Definition];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_OrderNumbers' AND object_id = OBJECT_ID('uCommerce_OrderNumberSerie')) BEGIN
DROP INDEX [IX_OrderNumbers]
    ON [dbo].[uCommerce_OrderNumberSerie];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_OrderProperty' AND object_id = OBJECT_ID('uCommerce_OrderProperty')) BEGIN
DROP INDEX [IX_uCommerce_OrderProperty]
    ON [dbo].[uCommerce_OrderProperty];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='uCommerce_OrderProperty_OrderLineId' AND object_id = OBJECT_ID('uCommerce_OrderProperty')) BEGIN
DROP INDEX [uCommerce_OrderProperty_OrderLineId]
    ON [dbo].[uCommerce_OrderProperty];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_Product_UniqueSkuAndVariantSku' AND object_id = OBJECT_ID('uCommerce_Product')) BEGIN
DROP INDEX [IX_Product_UniqueSkuAndVariantSku]
    ON [dbo].[uCommerce_Product];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_ProductCatalog_UniqueName' AND object_id = OBJECT_ID('uCommerce_ProductCatalog')) BEGIN
DROP INDEX [IX_ProductCatalog_UniqueName]
    ON [dbo].[uCommerce_ProductCatalog];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='uCommerce_NonClusteredIndex_ProductDescriptionId' AND object_id = OBJECT_ID('uCommerce_ProductDescriptionProperty')) BEGIN
DROP INDEX [uCommerce_NonClusteredIndex_ProductDescriptionId]
    ON [dbo].[uCommerce_ProductDescriptionProperty];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_ProductRelation' AND object_id = OBJECT_ID('uCommerce_ProductRelation')) BEGIN
DROP INDEX [IX_uCommerce_ProductRelation]
    ON [dbo].[uCommerce_ProductRelation];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_ProductReview' AND object_id = OBJECT_ID('uCommerce_ProductReview')) BEGIN
DROP INDEX [IX_uCommerce_ProductReview]
    ON [dbo].[uCommerce_ProductReview];
END

GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_Order' AND object_id = OBJECT_ID('uCommerce_PurchaseOrder')) BEGIN
DROP INDEX [IX_Order]
    ON [dbo].[uCommerce_PurchaseOrder];
END

GO
ALTER TABLE [dbo].[uCommerce_EntityUiDescription] DROP CONSTRAINT [FK_uCommerce_EntityUiDescription_uCommerce_EntityUi];


GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name='IX_uCommerce_EntityUi_Type' AND object_id = OBJECT_ID('uCommerce_EntityUi')) BEGIN
DROP INDEX [IX_uCommerce_EntityUi_Type]
    ON [dbo].[uCommerce_EntityUi];
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unique_CategoryDescription_CultureCode_CategoryId]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_CategoryDescription] DROP CONSTRAINT [Unique_CategoryDescription_CultureCode_CategoryId]
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unique_CategoryId_ProductId]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_CategoryProductRelation] DROP CONSTRAINT [Unique_CategoryId_ProductId]
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UX_CategoryProperty_CategoryId_CultureCode_DefinitionFieldId]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_CategoryProperty] DROP CONSTRAINT [UX_CategoryProperty_CategoryId_CultureCode_DefinitionFieldId]
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentMethodProperty_Unique_PaymentMethodId_DefinitionFieldId]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_PaymentMethodProperty] DROP CONSTRAINT [PaymentMethodProperty_Unique_PaymentMethodId_DefinitionFieldId]
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unique_Permission_UserId_RoleId]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_Permission] DROP CONSTRAINT [Unique_Permission_UserId_RoleId]
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unique_ProductId_PriceGroupId_PriceGroupPrice]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_PriceGroupPrice] DROP CONSTRAINT [Unique_ProductId_PriceGroupId_PriceGroupPrice]
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unique_ProductDefinitionFieldDescription_CultureCode_ProductDefintionFieldId]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_ProductDefinitionFieldDescription] DROP CONSTRAINT [Unique_ProductDefinitionFieldDescription_CultureCode_ProductDefintionFieldId]
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IX_uCommerce_ProductDescription_ProductId_CultureCode]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_ProductDescription] DROP CONSTRAINT [IX_uCommerce_ProductDescription_ProductId_CultureCode]
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductDescriptionProperty_Unique_ProductDescriptionId_ProductDefinitionFieldId]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_ProductDescriptionProperty] DROP CONSTRAINT [ProductDescriptionProperty_Unique_ProductDescriptionId_ProductDefinitionFieldId]
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unique_ProductProperty_ProductId_ProductDefinitionFieldId]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_ProductProperty] DROP CONSTRAINT [Unique_ProductProperty_ProductId_ProductDefinitionFieldId]
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unique_User_External_Id]') AND type in (N'UQ')) BEGIN
	ALTER TABLE [dbo].[uCommerce_User] DROP CONSTRAINT [Unique_User_External_Id]
END

GO

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Address]') AND name = N'IX_uCommerce_Address_CountryId')
BEGIN
  DROP INDEX [IX_uCommerce_Address_CountryId] ON [dbo].[uCommerce_Address];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Address_CountryId] ON [dbo].[uCommerce_Address](CountryId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Address]') AND name = N'IX_uCommerce_Address_CustomerId')
BEGIN
  DROP INDEX [IX_uCommerce_Address_CustomerId] ON [dbo].[uCommerce_Address];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Address_CustomerId] ON [dbo].[uCommerce_Address](CustomerId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AdminPage]') AND name = N'IX_uCommerce_AdminPage_FullName')
BEGIN
  DROP INDEX [IX_uCommerce_AdminPage_FullName] ON [dbo].[uCommerce_AdminPage];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_AdminPage_FullName] ON [dbo].[uCommerce_AdminPage](FullName ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AdminTab]') AND name = N'IX_uCommerce_AdminTab_AdminPageId')
BEGIN
  DROP INDEX [IX_uCommerce_AdminTab_AdminPageId] ON [dbo].[uCommerce_AdminTab];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_AdminTab_AdminPageId] ON [dbo].[uCommerce_AdminTab](AdminPageId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AdminTab]') AND name = N'IX_uCommerce_AdminTab_Enabled')
BEGIN
  DROP INDEX [IX_uCommerce_AdminTab_Enabled] ON [dbo].[uCommerce_AdminTab];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_AdminTab_Enabled] ON [dbo].[uCommerce_AdminTab](Enabled ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AdminTab]') AND name = N'IX_uCommerce_AdminTab_MultiLingual')
BEGIN
  DROP INDEX [IX_uCommerce_AdminTab_MultiLingual] ON [dbo].[uCommerce_AdminTab];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_AdminTab_MultiLingual] ON [dbo].[uCommerce_AdminTab](MultiLingual ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AdminTab]') AND name = N'IX_uCommerce_AdminTab_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_AdminTab_SortOrder] ON [dbo].[uCommerce_AdminTab];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_AdminTab_SortOrder] ON [dbo].[uCommerce_AdminTab](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AppSystemVersion]') AND name = N'IX_uCommerce_AppSystemVersion_SchemaVersion')
BEGIN
  DROP INDEX [IX_uCommerce_AppSystemVersion_SchemaVersion] ON [dbo].[uCommerce_AppSystemVersion];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_AppSystemVersion_SchemaVersion] ON [dbo].[uCommerce_AppSystemVersion](SchemaVersion ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Award]') AND name = N'IX_uCommerce_Award_CampaignItemId')
BEGIN
  DROP INDEX [IX_uCommerce_Award_CampaignItemId] ON [dbo].[uCommerce_Award];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Award_CampaignItemId] ON [dbo].[uCommerce_Award](CampaignItemId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Campaign]') AND name = N'IX_uCommerce_Campaign_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_Campaign_Deleted] ON [dbo].[uCommerce_Campaign];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Campaign_Deleted] ON [dbo].[uCommerce_Campaign](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Campaign]') AND name = N'IX_uCommerce_Campaign_Enabled')
BEGIN
  DROP INDEX [IX_uCommerce_Campaign_Enabled] ON [dbo].[uCommerce_Campaign];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Campaign_Enabled] ON [dbo].[uCommerce_Campaign](Enabled ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Campaign]') AND name = N'IX_uCommerce_Campaign_EndsOn')
BEGIN
  DROP INDEX [IX_uCommerce_Campaign_EndsOn] ON [dbo].[uCommerce_Campaign];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Campaign_EndsOn] ON [dbo].[uCommerce_Campaign](EndsOn ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Campaign]') AND name = N'IX_uCommerce_Campaign_Priority')
BEGIN
  DROP INDEX [IX_uCommerce_Campaign_Priority] ON [dbo].[uCommerce_Campaign];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Campaign_Priority] ON [dbo].[uCommerce_Campaign](Priority ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Campaign]') AND name = N'IX_uCommerce_Campaign_StartsOn')
BEGIN
  DROP INDEX [IX_uCommerce_Campaign_StartsOn] ON [dbo].[uCommerce_Campaign];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Campaign_StartsOn] ON [dbo].[uCommerce_Campaign](StartsOn ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItem]') AND name = N'IX_uCommerce_CampaignItem_AllowNextCampaignItems')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItem_AllowNextCampaignItems] ON [dbo].[uCommerce_CampaignItem];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItem_AllowNextCampaignItems] ON [dbo].[uCommerce_CampaignItem](AllowNextCampaignItems ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItem]') AND name = N'IX_uCommerce_CampaignItem_AnyTargetAdvertises')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItem_AnyTargetAdvertises] ON [dbo].[uCommerce_CampaignItem];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItem_AnyTargetAdvertises] ON [dbo].[uCommerce_CampaignItem](AnyTargetAdvertises ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItem]') AND name = N'IX_uCommerce_CampaignItem_AnyTargetAppliesAwards')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItem_AnyTargetAppliesAwards] ON [dbo].[uCommerce_CampaignItem];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItem_AnyTargetAppliesAwards] ON [dbo].[uCommerce_CampaignItem](AnyTargetAppliesAwards ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItem]') AND name = N'IX_uCommerce_CampaignItem_CampaignId')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItem_CampaignId] ON [dbo].[uCommerce_CampaignItem];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItem_CampaignId] ON [dbo].[uCommerce_CampaignItem](CampaignId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItem]') AND name = N'IX_uCommerce_CampaignItem_DefinitionId')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItem_DefinitionId] ON [dbo].[uCommerce_CampaignItem];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItem_DefinitionId] ON [dbo].[uCommerce_CampaignItem](DefinitionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItem]') AND name = N'IX_uCommerce_CampaignItem_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItem_Deleted] ON [dbo].[uCommerce_CampaignItem];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItem_Deleted] ON [dbo].[uCommerce_CampaignItem](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItem]') AND name = N'IX_uCommerce_CampaignItem_Enabled')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItem_Enabled] ON [dbo].[uCommerce_CampaignItem];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItem_Enabled] ON [dbo].[uCommerce_CampaignItem](Enabled ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItem]') AND name = N'IX_uCommerce_CampaignItem_Priority')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItem_Priority] ON [dbo].[uCommerce_CampaignItem];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItem_Priority] ON [dbo].[uCommerce_CampaignItem](Priority ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItemProperty]') AND name = N'IX_uCommerce_CampaignItemProperty_CampaignItemId')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItemProperty_CampaignItemId] ON [dbo].[uCommerce_CampaignItemProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItemProperty_CampaignItemId] ON [dbo].[uCommerce_CampaignItemProperty](CampaignItemId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItemProperty]') AND name = N'IX_uCommerce_CampaignItemProperty_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItemProperty_CultureCode] ON [dbo].[uCommerce_CampaignItemProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItemProperty_CultureCode] ON [dbo].[uCommerce_CampaignItemProperty](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItemProperty]') AND name = N'IX_uCommerce_CampaignItemProperty_DefinitionFieldId')
BEGIN
  DROP INDEX [IX_uCommerce_CampaignItemProperty_DefinitionFieldId] ON [dbo].[uCommerce_CampaignItemProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CampaignItemProperty_DefinitionFieldId] ON [dbo].[uCommerce_CampaignItemProperty](DefinitionFieldId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Category]') AND name = N'IX_uCommerce_Category_ParentCategoryId')
BEGIN
  DROP INDEX [IX_uCommerce_Category_ParentCategoryId] ON [dbo].[uCommerce_Category];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Category_ParentCategoryId] ON [dbo].[uCommerce_Category](ParentCategoryId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Category]') AND name = N'IX_uCommerce_Category_ProductCatalogId')
BEGIN
  DROP INDEX [IX_uCommerce_Category_ProductCatalogId] ON [dbo].[uCommerce_Category];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Category_ProductCatalogId] ON [dbo].[uCommerce_Category](ProductCatalogId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Category]') AND name = N'IX_uCommerce_Category_DefinitionId')
BEGIN
  DROP INDEX [IX_uCommerce_Category_DefinitionId] ON [dbo].[uCommerce_Category];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Category_DefinitionId] ON [dbo].[uCommerce_Category](DefinitionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Category]') AND name = N'IX_uCommerce_Category_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_Category_Deleted] ON [dbo].[uCommerce_Category];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Category_Deleted] ON [dbo].[uCommerce_Category](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Category]') AND name = N'IX_uCommerce_Category_DisplayOnSite')
BEGIN
  DROP INDEX [IX_uCommerce_Category_DisplayOnSite] ON [dbo].[uCommerce_Category];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Category_DisplayOnSite] ON [dbo].[uCommerce_Category](DisplayOnSite ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Category]') AND name = N'IX_uCommerce_Category_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_Category_Guid] ON [dbo].[uCommerce_Category];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Category_Guid] ON [dbo].[uCommerce_Category](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Category]') AND name = N'IX_uCommerce_Category_Name')
BEGIN
  DROP INDEX [IX_uCommerce_Category_Name] ON [dbo].[uCommerce_Category];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Category_Name] ON [dbo].[uCommerce_Category](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Category]') AND name = N'IX_uCommerce_Category_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_Category_SortOrder] ON [dbo].[uCommerce_Category];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Category_SortOrder] ON [dbo].[uCommerce_Category](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryDescription]') AND name = N'IX_uCommerce_CategoryDescription_CategoryId')
BEGIN
  DROP INDEX [IX_uCommerce_CategoryDescription_CategoryId] ON [dbo].[uCommerce_CategoryDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryDescription_CategoryId] ON [dbo].[uCommerce_CategoryDescription](CategoryId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryDescription]') AND name = N'IX_uCommerce_CategoryDescription_ContentId')
BEGIN
  DROP INDEX [IX_uCommerce_CategoryDescription_ContentId] ON [dbo].[uCommerce_CategoryDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryDescription_ContentId] ON [dbo].[uCommerce_CategoryDescription](ContentId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryDescription]') AND name = N'IX_uCommerce_CategoryDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_CategoryDescription_CultureCode] ON [dbo].[uCommerce_CategoryDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryDescription_CultureCode] ON [dbo].[uCommerce_CategoryDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryDescription]') AND name = N'IX_uCommerce_CategoryDescription_RenderAsContent')
BEGIN
  DROP INDEX [IX_uCommerce_CategoryDescription_RenderAsContent] ON [dbo].[uCommerce_CategoryDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryDescription_RenderAsContent] ON [dbo].[uCommerce_CategoryDescription](RenderAsContent ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryProductRelation]') AND name = N'IX_uCommerce_CategoryProductRelation_ProductId')
BEGIN
  DROP INDEX [IX_uCommerce_CategoryProductRelation_ProductId] ON [dbo].[uCommerce_CategoryProductRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryProductRelation_ProductId] ON [dbo].[uCommerce_CategoryProductRelation](ProductId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryProductRelation]') AND name = N'IX_uCommerce_CategoryProductRelation_CategoryId')
BEGIN
  DROP INDEX [IX_uCommerce_CategoryProductRelation_CategoryId] ON [dbo].[uCommerce_CategoryProductRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryProductRelation_CategoryId] ON [dbo].[uCommerce_CategoryProductRelation](CategoryId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryProductRelation]') AND name = N'IX_uCommerce_CategoryProductRelation_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_CategoryProductRelation_SortOrder] ON [dbo].[uCommerce_CategoryProductRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryProductRelation_SortOrder] ON [dbo].[uCommerce_CategoryProductRelation](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryProperty]') AND name = N'IX_uCommerce_CategoryProperty_CategoryId')
BEGIN
  DROP INDEX [IX_uCommerce_CategoryProperty_CategoryId] ON [dbo].[uCommerce_CategoryProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryProperty_CategoryId] ON [dbo].[uCommerce_CategoryProperty](CategoryId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryProperty]') AND name = N'IX_uCommerce_CategoryProperty_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_CategoryProperty_CultureCode] ON [dbo].[uCommerce_CategoryProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryProperty_CultureCode] ON [dbo].[uCommerce_CategoryProperty](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryProperty]') AND name = N'IX_uCommerce_CategoryProperty_DefinitionFieldId')
BEGIN
  DROP INDEX [IX_uCommerce_CategoryProperty_DefinitionFieldId] ON [dbo].[uCommerce_CategoryProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryProperty_DefinitionFieldId] ON [dbo].[uCommerce_CategoryProperty](DefinitionFieldId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Country]') AND name = N'IX_uCommerce_Country_Culture')
BEGIN
  DROP INDEX [IX_uCommerce_Country_Culture] ON [dbo].[uCommerce_Country];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Country_Culture] ON [dbo].[uCommerce_Country](Culture ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Country]') AND name = N'IX_uCommerce_Country_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_Country_Deleted] ON [dbo].[uCommerce_Country];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Country_Deleted] ON [dbo].[uCommerce_Country](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Currency]') AND name = N'IX_uCommerce_Currency_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_Currency_Deleted] ON [dbo].[uCommerce_Currency];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Currency_Deleted] ON [dbo].[uCommerce_Currency](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Currency]') AND name = N'IX_uCommerce_Currency_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_Currency_Guid] ON [dbo].[uCommerce_Currency];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Currency_Guid] ON [dbo].[uCommerce_Currency](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Currency]') AND name = N'IX_uCommerce_Currency_ISOCode')
BEGIN
  DROP INDEX [IX_uCommerce_Currency_ISOCode] ON [dbo].[uCommerce_Currency];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Currency_ISOCode] ON [dbo].[uCommerce_Currency](ISOCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Customer]') AND name = N'IX_uCommerce_Customer_MemberId')
BEGIN
  DROP INDEX [IX_uCommerce_Customer_MemberId] ON [dbo].[uCommerce_Customer];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Customer_MemberId] ON [dbo].[uCommerce_Customer](MemberId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataType]') AND name = N'IX_uCommerce_DataType_BuiltIn')
BEGIN
  DROP INDEX [IX_uCommerce_DataType_BuiltIn] ON [dbo].[uCommerce_DataType];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataType_BuiltIn] ON [dbo].[uCommerce_DataType](BuiltIn ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataType]') AND name = N'IX_uCommerce_DataType_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_DataType_Deleted] ON [dbo].[uCommerce_DataType];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataType_Deleted] ON [dbo].[uCommerce_DataType](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataType]') AND name = N'IX_uCommerce_DataType_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_DataType_Guid] ON [dbo].[uCommerce_DataType];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataType_Guid] ON [dbo].[uCommerce_DataType](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataType]') AND name = N'IX_uCommerce_DataType_Nullable')
BEGIN
  DROP INDEX [IX_uCommerce_DataType_Nullable] ON [dbo].[uCommerce_DataType];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataType_Nullable] ON [dbo].[uCommerce_DataType](Nullable ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataType]') AND name = N'IX_uCommerce_DataType_TypeName')
BEGIN
  DROP INDEX [IX_uCommerce_DataType_TypeName] ON [dbo].[uCommerce_DataType];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataType_TypeName] ON [dbo].[uCommerce_DataType](TypeName ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataTypeEnum]') AND name = N'IX_uCommerce_DataTypeEnum_DataTypeId')
BEGIN
  DROP INDEX [IX_uCommerce_DataTypeEnum_DataTypeId] ON [dbo].[uCommerce_DataTypeEnum];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataTypeEnum_DataTypeId] ON [dbo].[uCommerce_DataTypeEnum](DataTypeId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataTypeEnum]') AND name = N'IX_uCommerce_DataTypeEnum_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_DataTypeEnum_Deleted] ON [dbo].[uCommerce_DataTypeEnum];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataTypeEnum_Deleted] ON [dbo].[uCommerce_DataTypeEnum](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataTypeEnum]') AND name = N'IX_uCommerce_DataTypeEnum_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_DataTypeEnum_Guid] ON [dbo].[uCommerce_DataTypeEnum];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataTypeEnum_Guid] ON [dbo].[uCommerce_DataTypeEnum](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataTypeEnum]') AND name = N'IX_uCommerce_DataTypeEnum_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_DataTypeEnum_SortOrder] ON [dbo].[uCommerce_DataTypeEnum];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataTypeEnum_SortOrder] ON [dbo].[uCommerce_DataTypeEnum](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataTypeEnumDescription]') AND name = N'IX_uCommerce_DataTypeEnumDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_DataTypeEnumDescription_CultureCode] ON [dbo].[uCommerce_DataTypeEnumDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataTypeEnumDescription_CultureCode] ON [dbo].[uCommerce_DataTypeEnumDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataTypeEnumDescription]') AND name = N'IX_uCommerce_DataTypeEnumDescription_DataTypeEnumId')
BEGIN
  DROP INDEX [IX_uCommerce_DataTypeEnumDescription_DataTypeEnumId] ON [dbo].[uCommerce_DataTypeEnumDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DataTypeEnumDescription_DataTypeEnumId] ON [dbo].[uCommerce_DataTypeEnumDescription](DataTypeEnumId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Definition]') AND name = N'IX_uCommerce_Definition_BuiltIn')
BEGIN
  DROP INDEX [IX_uCommerce_Definition_BuiltIn] ON [dbo].[uCommerce_Definition];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Definition_BuiltIn] ON [dbo].[uCommerce_Definition](BuiltIn ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Definition]') AND name = N'IX_uCommerce_Definition_DefinitionTypeId')
BEGIN
  DROP INDEX [IX_uCommerce_Definition_DefinitionTypeId] ON [dbo].[uCommerce_Definition];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Definition_DefinitionTypeId] ON [dbo].[uCommerce_Definition](DefinitionTypeId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Definition]') AND name = N'IX_uCommerce_Definition_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_Definition_Deleted] ON [dbo].[uCommerce_Definition];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Definition_Deleted] ON [dbo].[uCommerce_Definition](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Definition]') AND name = N'IX_uCommerce_Definition_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_Definition_Guid] ON [dbo].[uCommerce_Definition];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Definition_Guid] ON [dbo].[uCommerce_Definition](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Definition]') AND name = N'IX_uCommerce_Definition_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_Definition_SortOrder] ON [dbo].[uCommerce_Definition];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Definition_SortOrder] ON [dbo].[uCommerce_Definition](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND name = N'IX_uCommerce_DefinitionField_BuiltIn')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionField_BuiltIn] ON [dbo].[uCommerce_DefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionField_BuiltIn] ON [dbo].[uCommerce_DefinitionField](BuiltIn ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND name = N'IX_uCommerce_DefinitionField_DataTypeId')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionField_DataTypeId] ON [dbo].[uCommerce_DefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionField_DataTypeId] ON [dbo].[uCommerce_DefinitionField](DataTypeId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND name = N'IX_uCommerce_DefinitionField_DefinitionId')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionField_DefinitionId] ON [dbo].[uCommerce_DefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionField_DefinitionId] ON [dbo].[uCommerce_DefinitionField](DefinitionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND name = N'IX_uCommerce_DefinitionField_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionField_Deleted] ON [dbo].[uCommerce_DefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionField_Deleted] ON [dbo].[uCommerce_DefinitionField](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND name = N'IX_uCommerce_DefinitionField_DisplayOnSite')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionField_DisplayOnSite] ON [dbo].[uCommerce_DefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionField_DisplayOnSite] ON [dbo].[uCommerce_DefinitionField](DisplayOnSite ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND name = N'IX_uCommerce_DefinitionField_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionField_Guid] ON [dbo].[uCommerce_DefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionField_Guid] ON [dbo].[uCommerce_DefinitionField](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND name = N'IX_uCommerce_DefinitionField_Multilingual')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionField_Multilingual] ON [dbo].[uCommerce_DefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionField_Multilingual] ON [dbo].[uCommerce_DefinitionField](Multilingual ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND name = N'IX_uCommerce_DefinitionField_RenderInEditor')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionField_RenderInEditor] ON [dbo].[uCommerce_DefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionField_RenderInEditor] ON [dbo].[uCommerce_DefinitionField](RenderInEditor ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND name = N'IX_uCommerce_DefinitionField_Searchable')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionField_Searchable] ON [dbo].[uCommerce_DefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionField_Searchable] ON [dbo].[uCommerce_DefinitionField](Searchable ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND name = N'IX_uCommerce_DefinitionField_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionField_SortOrder] ON [dbo].[uCommerce_DefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionField_SortOrder] ON [dbo].[uCommerce_DefinitionField](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionFieldDescription]') AND name = N'IX_uCommerce_DefinitionFieldDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionFieldDescription_CultureCode] ON [dbo].[uCommerce_DefinitionFieldDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionFieldDescription_CultureCode] ON [dbo].[uCommerce_DefinitionFieldDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionFieldDescription]') AND name = N'IX_uCommerce_DefinitionFieldDescription_DefinitionFieldId')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionFieldDescription_DefinitionFieldId] ON [dbo].[uCommerce_DefinitionFieldDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionFieldDescription_DefinitionFieldId] ON [dbo].[uCommerce_DefinitionFieldDescription](DefinitionFieldId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionRelation]') AND name = N'IX_uCommerce_DefinitionRelation_DefinitionId')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionRelation_DefinitionId] ON [dbo].[uCommerce_DefinitionRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionRelation_DefinitionId] ON [dbo].[uCommerce_DefinitionRelation](DefinitionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionRelation]') AND name = N'IX_uCommerce_DefinitionRelation_ParentDefinitionId')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionRelation_ParentDefinitionId] ON [dbo].[uCommerce_DefinitionRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionRelation_ParentDefinitionId] ON [dbo].[uCommerce_DefinitionRelation](ParentDefinitionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionRelation]') AND name = N'IX_uCommerce_DefinitionRelation_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionRelation_SortOrder] ON [dbo].[uCommerce_DefinitionRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionRelation_SortOrder] ON [dbo].[uCommerce_DefinitionRelation](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionType]') AND name = N'IX_uCommerce_DefinitionType_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionType_Deleted] ON [dbo].[uCommerce_DefinitionType];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionType_Deleted] ON [dbo].[uCommerce_DefinitionType](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionType]') AND name = N'IX_uCommerce_DefinitionType_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionType_SortOrder] ON [dbo].[uCommerce_DefinitionType];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionType_SortOrder] ON [dbo].[uCommerce_DefinitionType](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionTypeDescription]') AND name = N'IX_uCommerce_DefinitionTypeDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionTypeDescription_CultureCode] ON [dbo].[uCommerce_DefinitionTypeDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionTypeDescription_CultureCode] ON [dbo].[uCommerce_DefinitionTypeDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionTypeDescription]') AND name = N'IX_uCommerce_DefinitionTypeDescription_DefinitionTypeId')
BEGIN
  DROP INDEX [IX_uCommerce_DefinitionTypeDescription_DefinitionTypeId] ON [dbo].[uCommerce_DefinitionTypeDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DefinitionTypeDescription_DefinitionTypeId] ON [dbo].[uCommerce_DefinitionTypeDescription](DefinitionTypeId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Discount]') AND name = N'IX_uCommerce_Discount_OrderId')
BEGIN
  DROP INDEX [IX_uCommerce_Discount_OrderId] ON [dbo].[uCommerce_Discount];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Discount_OrderId] ON [dbo].[uCommerce_Discount](OrderId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DiscountSpecificOrderLineAward]') AND name = N'IX_uCommerce_DiscountSpecificOrderLineAward_AmountType')
BEGIN
  DROP INDEX [IX_uCommerce_DiscountSpecificOrderLineAward_AmountType] ON [dbo].[uCommerce_DiscountSpecificOrderLineAward];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DiscountSpecificOrderLineAward_AmountType] ON [dbo].[uCommerce_DiscountSpecificOrderLineAward](AmountType ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DiscountSpecificOrderLineAward]') AND name = N'IX_uCommerce_DiscountSpecificOrderLineAward_DiscountTarget')
BEGIN
  DROP INDEX [IX_uCommerce_DiscountSpecificOrderLineAward_DiscountTarget] ON [dbo].[uCommerce_DiscountSpecificOrderLineAward];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DiscountSpecificOrderLineAward_DiscountTarget] ON [dbo].[uCommerce_DiscountSpecificOrderLineAward](DiscountTarget ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DynamicOrderPropertyTarget]') AND name = N'IX_uCommerce_DynamicOrderPropertyTarget_CompareMode')
BEGIN
  DROP INDEX [IX_uCommerce_DynamicOrderPropertyTarget_CompareMode] ON [dbo].[uCommerce_DynamicOrderPropertyTarget];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DynamicOrderPropertyTarget_CompareMode] ON [dbo].[uCommerce_DynamicOrderPropertyTarget](CompareMode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DynamicOrderPropertyTarget]') AND name = N'IX_uCommerce_DynamicOrderPropertyTarget_Key')
BEGIN
  DROP INDEX [IX_uCommerce_DynamicOrderPropertyTarget_Key] ON [dbo].[uCommerce_DynamicOrderPropertyTarget];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DynamicOrderPropertyTarget_Key] ON [dbo].[uCommerce_DynamicOrderPropertyTarget]([Key] ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DynamicOrderPropertyTarget]') AND name = N'IX_uCommerce_DynamicOrderPropertyTarget_TargetOrderLine')
BEGIN
  DROP INDEX [IX_uCommerce_DynamicOrderPropertyTarget_TargetOrderLine] ON [dbo].[uCommerce_DynamicOrderPropertyTarget];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_DynamicOrderPropertyTarget_TargetOrderLine] ON [dbo].[uCommerce_DynamicOrderPropertyTarget](TargetOrderLine ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailContent]') AND name = N'IX_uCommerce_EmailContent_ContentId')
BEGIN
  DROP INDEX [IX_uCommerce_EmailContent_ContentId] ON [dbo].[uCommerce_EmailContent];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EmailContent_ContentId] ON [dbo].[uCommerce_EmailContent](ContentId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailContent]') AND name = N'IX_uCommerce_EmailContent_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_EmailContent_CultureCode] ON [dbo].[uCommerce_EmailContent];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EmailContent_CultureCode] ON [dbo].[uCommerce_EmailContent](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailContent]') AND name = N'IX_uCommerce_EmailContent_EmailProfileId')
BEGIN
  DROP INDEX [IX_uCommerce_EmailContent_EmailProfileId] ON [dbo].[uCommerce_EmailContent];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EmailContent_EmailProfileId] ON [dbo].[uCommerce_EmailContent](EmailProfileId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailContent]') AND name = N'IX_uCommerce_EmailContent_EmailTypeId')
BEGIN
  DROP INDEX [IX_uCommerce_EmailContent_EmailTypeId] ON [dbo].[uCommerce_EmailContent];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EmailContent_EmailTypeId] ON [dbo].[uCommerce_EmailContent](EmailTypeId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailProfile]') AND name = N'IX_uCommerce_EmailProfile_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_EmailProfile_Deleted] ON [dbo].[uCommerce_EmailProfile];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EmailProfile_Deleted] ON [dbo].[uCommerce_EmailProfile](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailProfile]') AND name = N'IX_uCommerce_EmailProfile_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_EmailProfile_Guid] ON [dbo].[uCommerce_EmailProfile];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EmailProfile_Guid] ON [dbo].[uCommerce_EmailProfile](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailProfileInformation]') AND name = N'IX_uCommerce_EmailProfileInformation_EmailProfileId')
BEGIN
  DROP INDEX [IX_uCommerce_EmailProfileInformation_EmailProfileId] ON [dbo].[uCommerce_EmailProfileInformation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EmailProfileInformation_EmailProfileId] ON [dbo].[uCommerce_EmailProfileInformation](EmailProfileId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailProfileInformation]') AND name = N'IX_uCommerce_EmailProfileInformation_EmailTypeId')
BEGIN
  DROP INDEX [IX_uCommerce_EmailProfileInformation_EmailTypeId] ON [dbo].[uCommerce_EmailProfileInformation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EmailProfileInformation_EmailTypeId] ON [dbo].[uCommerce_EmailProfileInformation](EmailTypeId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailType]') AND name = N'IX_uCommerce_EmailType_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_EmailType_Deleted] ON [dbo].[uCommerce_EmailType];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EmailType_Deleted] ON [dbo].[uCommerce_EmailType](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EntityUi]') AND name = N'IX_uCommerce_EntityUi_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_EntityUi_SortOrder] ON [dbo].[uCommerce_EntityUi];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EntityUi_SortOrder] ON [dbo].[uCommerce_EntityUi](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EntityUiDescription]') AND name = N'IX_uCommerce_EntityUiDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_EntityUiDescription_CultureCode] ON [dbo].[uCommerce_EntityUiDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EntityUiDescription_CultureCode] ON [dbo].[uCommerce_EntityUiDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EntityUiDescription]') AND name = N'IX_uCommerce_EntityUiDescription_EntityUiId')
BEGIN
  DROP INDEX [IX_uCommerce_EntityUiDescription_EntityUiId] ON [dbo].[uCommerce_EntityUiDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_EntityUiDescription_EntityUiId] ON [dbo].[uCommerce_EntityUiDescription](EntityUiId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderAddress]') AND name = N'IX_uCommerce_OrderAddress_CountryId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderAddress_CountryId] ON [dbo].[uCommerce_OrderAddress];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderAddress_CountryId] ON [dbo].[uCommerce_OrderAddress](CountryId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderAddress]') AND name = N'IX_uCommerce_OrderAddress_OrderId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderAddress_OrderId] ON [dbo].[uCommerce_OrderAddress];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderAddress_OrderId] ON [dbo].[uCommerce_OrderAddress](OrderId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderLine]') AND name = N'IX_uCommerce_OrderLine_OrderId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderLine_OrderId] ON [dbo].[uCommerce_OrderLine];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderLine_OrderId] ON [dbo].[uCommerce_OrderLine](OrderId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderLine]') AND name = N'IX_uCommerce_OrderLine_ShipmentId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderLine_ShipmentId] ON [dbo].[uCommerce_OrderLine];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderLine_ShipmentId] ON [dbo].[uCommerce_OrderLine](ShipmentId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderLineDiscountRelation]') AND name = N'IX_uCommerce_OrderLineDiscountRelation_DiscountId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderLineDiscountRelation_DiscountId] ON [dbo].[uCommerce_OrderLineDiscountRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderLineDiscountRelation_DiscountId] ON [dbo].[uCommerce_OrderLineDiscountRelation](DiscountId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderLineDiscountRelation]') AND name = N'IX_uCommerce_OrderLineDiscountRelation_OrderLineId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderLineDiscountRelation_OrderLineId] ON [dbo].[uCommerce_OrderLineDiscountRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderLineDiscountRelation_OrderLineId] ON [dbo].[uCommerce_OrderLineDiscountRelation](OrderLineId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderNumberSerie]') AND name = N'IX_uCommerce_OrderNumberSerie_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_OrderNumberSerie_Deleted] ON [dbo].[uCommerce_OrderNumberSerie];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderNumberSerie_Deleted] ON [dbo].[uCommerce_OrderNumberSerie](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderNumberSerie]') AND name = N'IX_uCommerce_OrderNumberSerie_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_OrderNumberSerie_Guid] ON [dbo].[uCommerce_OrderNumberSerie];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderNumberSerie_Guid] ON [dbo].[uCommerce_OrderNumberSerie](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderNumberSerie]') AND name = N'IX_uCommerce_OrderNumberSerie_OrderNumberName')
BEGIN
  DROP INDEX [IX_uCommerce_OrderNumberSerie_OrderNumberName] ON [dbo].[uCommerce_OrderNumberSerie];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderNumberSerie_OrderNumberName] ON [dbo].[uCommerce_OrderNumberSerie](OrderNumberName ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderProperty]') AND name = N'IX_uCommerce_OrderProperty_Key')
BEGIN
  DROP INDEX [IX_uCommerce_OrderProperty_Key] ON [dbo].[uCommerce_OrderProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderProperty_Key] ON [dbo].[uCommerce_OrderProperty]([Key] ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderProperty]') AND name = N'IX_uCommerce_OrderProperty_OrderId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderProperty_OrderId] ON [dbo].[uCommerce_OrderProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderProperty_OrderId] ON [dbo].[uCommerce_OrderProperty](OrderId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderProperty]') AND name = N'IX_uCommerce_OrderProperty_OrderLineId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderProperty_OrderLineId] ON [dbo].[uCommerce_OrderProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderProperty_OrderLineId] ON [dbo].[uCommerce_OrderProperty](OrderLineId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_AllowOrderEdit')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_AllowOrderEdit] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_AllowOrderEdit] ON [dbo].[uCommerce_OrderStatus](AllowOrderEdit ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_AllowUpdate')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_AllowUpdate] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_AllowUpdate] ON [dbo].[uCommerce_OrderStatus](AllowUpdate ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_AlwaysAvailable')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_AlwaysAvailable] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_AlwaysAvailable] ON [dbo].[uCommerce_OrderStatus](AlwaysAvailable ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_ExternalId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_ExternalId] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_ExternalId] ON [dbo].[uCommerce_OrderStatus](ExternalId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_IncludeInAuditTrail')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_IncludeInAuditTrail] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_IncludeInAuditTrail] ON [dbo].[uCommerce_OrderStatus](IncludeInAuditTrail ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_Name')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_Name] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_Name] ON [dbo].[uCommerce_OrderStatus](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_NextOrderStatusId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_NextOrderStatusId] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_NextOrderStatusId] ON [dbo].[uCommerce_OrderStatus](NextOrderStatusId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_Order')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_Order] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_Order] ON [dbo].[uCommerce_OrderStatus]([Order] ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_RenderChildren')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_RenderChildren] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_RenderChildren] ON [dbo].[uCommerce_OrderStatus](RenderChildren ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_RenderInMenu')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_RenderInMenu] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_RenderInMenu] ON [dbo].[uCommerce_OrderStatus](RenderInMenu ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND name = N'IX_uCommerce_OrderStatus_Sort')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatus_Sort] ON [dbo].[uCommerce_OrderStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatus_Sort] ON [dbo].[uCommerce_OrderStatus](Sort ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatusAudit]') AND name = N'IX_uCommerce_OrderStatusAudit_OrderId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatusAudit_OrderId] ON [dbo].[uCommerce_OrderStatusAudit];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatusAudit_OrderId] ON [dbo].[uCommerce_OrderStatusAudit](OrderId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatusAudit]') AND name = N'IX_uCommerce_OrderStatusAudit_NewOrderStatusId')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatusAudit_NewOrderStatusId] ON [dbo].[uCommerce_OrderStatusAudit];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatusAudit_NewOrderStatusId] ON [dbo].[uCommerce_OrderStatusAudit](NewOrderStatusId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatusDescription]') AND name = N'IX_uCommerce_OrderStatusDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_OrderStatusDescription_CultureCode] ON [dbo].[uCommerce_OrderStatusDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_OrderStatusDescription_CultureCode] ON [dbo].[uCommerce_OrderStatusDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Payment]') AND name = N'IX_uCommerce_Payment_PaymentMethodId')
BEGIN
  DROP INDEX [IX_uCommerce_Payment_PaymentMethodId] ON [dbo].[uCommerce_Payment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Payment_PaymentMethodId] ON [dbo].[uCommerce_Payment](PaymentMethodId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Payment]') AND name = N'IX_uCommerce_Payment_PaymentMethodName')
BEGIN
  DROP INDEX [IX_uCommerce_Payment_PaymentMethodName] ON [dbo].[uCommerce_Payment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Payment_PaymentMethodName] ON [dbo].[uCommerce_Payment](PaymentMethodName ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Payment]') AND name = N'IX_uCommerce_Payment_PaymentStatusId')
BEGIN
  DROP INDEX [IX_uCommerce_Payment_PaymentStatusId] ON [dbo].[uCommerce_Payment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Payment_PaymentStatusId] ON [dbo].[uCommerce_Payment](PaymentStatusId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethod]') AND name = N'IX_uCommerce_PaymentMethod_DefinitionId')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethod_DefinitionId] ON [dbo].[uCommerce_PaymentMethod];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethod_DefinitionId] ON [dbo].[uCommerce_PaymentMethod](DefinitionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethod]') AND name = N'IX_uCommerce_PaymentMethod_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethod_Deleted] ON [dbo].[uCommerce_PaymentMethod];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethod_Deleted] ON [dbo].[uCommerce_PaymentMethod](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethod]') AND name = N'IX_uCommerce_PaymentMethod_Enabled')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethod_Enabled] ON [dbo].[uCommerce_PaymentMethod];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethod_Enabled] ON [dbo].[uCommerce_PaymentMethod](Enabled ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethod]') AND name = N'IX_uCommerce_PaymentMethod_Name')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethod_Name] ON [dbo].[uCommerce_PaymentMethod];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethod_Name] ON [dbo].[uCommerce_PaymentMethod](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodDescription]') AND name = N'IX_uCommerce_PaymentMethodDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethodDescription_CultureCode] ON [dbo].[uCommerce_PaymentMethodDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethodDescription_CultureCode] ON [dbo].[uCommerce_PaymentMethodDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodDescription]') AND name = N'IX_uCommerce_PaymentMethodDescription_PaymentMethodId')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethodDescription_PaymentMethodId] ON [dbo].[uCommerce_PaymentMethodDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethodDescription_PaymentMethodId] ON [dbo].[uCommerce_PaymentMethodDescription](PaymentMethodId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodFee]') AND name = N'IX_uCommerce_PaymentMethodFee_CurrencyId')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethodFee_CurrencyId] ON [dbo].[uCommerce_PaymentMethodFee];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethodFee_CurrencyId] ON [dbo].[uCommerce_PaymentMethodFee](CurrencyId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodFee]') AND name = N'IX_uCommerce_PaymentMethodFee_PaymentMethodId')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethodFee_PaymentMethodId] ON [dbo].[uCommerce_PaymentMethodFee];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethodFee_PaymentMethodId] ON [dbo].[uCommerce_PaymentMethodFee](PaymentMethodId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodFee]') AND name = N'IX_uCommerce_PaymentMethodFee_PriceGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethodFee_PriceGroupId] ON [dbo].[uCommerce_PaymentMethodFee];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethodFee_PriceGroupId] ON [dbo].[uCommerce_PaymentMethodFee](PriceGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodProperty]') AND name = N'IX_uCommerce_PaymentMethodProperty_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethodProperty_CultureCode] ON [dbo].[uCommerce_PaymentMethodProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethodProperty_CultureCode] ON [dbo].[uCommerce_PaymentMethodProperty](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodProperty]') AND name = N'IX_uCommerce_PaymentMethodProperty_DefinitionFieldId')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethodProperty_DefinitionFieldId] ON [dbo].[uCommerce_PaymentMethodProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethodProperty_DefinitionFieldId] ON [dbo].[uCommerce_PaymentMethodProperty](DefinitionFieldId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodProperty]') AND name = N'IX_uCommerce_PaymentMethodProperty_PaymentMethodId')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentMethodProperty_PaymentMethodId] ON [dbo].[uCommerce_PaymentMethodProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentMethodProperty_PaymentMethodId] ON [dbo].[uCommerce_PaymentMethodProperty](PaymentMethodId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentProperty]') AND name = N'IX_uCommerce_PaymentProperty_Key')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentProperty_Key] ON [dbo].[uCommerce_PaymentProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentProperty_Key] ON [dbo].[uCommerce_PaymentProperty]([Key] ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentProperty]') AND name = N'IX_uCommerce_PaymentProperty_PaymentId')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentProperty_PaymentId] ON [dbo].[uCommerce_PaymentProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentProperty_PaymentId] ON [dbo].[uCommerce_PaymentProperty](PaymentId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentStatus]') AND name = N'IX_uCommerce_PaymentStatus_Name')
BEGIN
  DROP INDEX [IX_uCommerce_PaymentStatus_Name] ON [dbo].[uCommerce_PaymentStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PaymentStatus_Name] ON [dbo].[uCommerce_PaymentStatus](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Permission]') AND name = N'IX_uCommerce_Permission_RoleId')
BEGIN
  DROP INDEX [IX_uCommerce_Permission_RoleId] ON [dbo].[uCommerce_Permission];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Permission_RoleId] ON [dbo].[uCommerce_Permission](RoleId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Permission]') AND name = N'IX_uCommerce_Permission_UserId')
BEGIN
  DROP INDEX [IX_uCommerce_Permission_UserId] ON [dbo].[uCommerce_Permission];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Permission_UserId] ON [dbo].[uCommerce_Permission](UserId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PriceGroup]') AND name = N'IX_uCommerce_PriceGroup_CurrencyId')
BEGIN
  DROP INDEX [IX_uCommerce_PriceGroup_CurrencyId] ON [dbo].[uCommerce_PriceGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PriceGroup_CurrencyId] ON [dbo].[uCommerce_PriceGroup](CurrencyId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PriceGroup]') AND name = N'IX_uCommerce_PriceGroup_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_PriceGroup_Deleted] ON [dbo].[uCommerce_PriceGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PriceGroup_Deleted] ON [dbo].[uCommerce_PriceGroup](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PriceGroup]') AND name = N'IX_uCommerce_PriceGroup_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_PriceGroup_Guid] ON [dbo].[uCommerce_PriceGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PriceGroup_Guid] ON [dbo].[uCommerce_PriceGroup](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PriceGroupPrice]') AND name = N'IX_uCommerce_PriceGroupPrice_ProductId')
BEGIN
  DROP INDEX [IX_uCommerce_PriceGroupPrice_ProductId] ON [dbo].[uCommerce_PriceGroupPrice];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PriceGroupPrice_ProductId] ON [dbo].[uCommerce_PriceGroupPrice](ProductId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PriceGroupPrice]') AND name = N'IX_uCommerce_PriceGroupPrice_PriceGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_PriceGroupPrice_PriceGroupId] ON [dbo].[uCommerce_PriceGroupPrice];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PriceGroupPrice_PriceGroupId] ON [dbo].[uCommerce_PriceGroupPrice](PriceGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Product]') AND name = N'IX_uCommerce_Product_AllowOrdering')
BEGIN
  DROP INDEX [IX_uCommerce_Product_AllowOrdering] ON [dbo].[uCommerce_Product];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Product_AllowOrdering] ON [dbo].[uCommerce_Product](AllowOrdering ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Product]') AND name = N'IX_uCommerce_Product_ParentProductId')
BEGIN
  DROP INDEX [IX_uCommerce_Product_ParentProductId] ON [dbo].[uCommerce_Product];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Product_ParentProductId] ON [dbo].[uCommerce_Product](ParentProductId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Product]') AND name = N'IX_uCommerce_Product_DisplayOnSite')
BEGIN
  DROP INDEX [IX_uCommerce_Product_DisplayOnSite] ON [dbo].[uCommerce_Product];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Product_DisplayOnSite] ON [dbo].[uCommerce_Product](DisplayOnSite ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Product]') AND name = N'IX_uCommerce_Product_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_Product_Guid] ON [dbo].[uCommerce_Product];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Product_Guid] ON [dbo].[uCommerce_Product](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Product]') AND name = N'IX_uCommerce_Product_ProductDefinitionId')
BEGIN
  DROP INDEX [IX_uCommerce_Product_ProductDefinitionId] ON [dbo].[uCommerce_Product];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Product_ProductDefinitionId] ON [dbo].[uCommerce_Product](ProductDefinitionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Product]') AND name = N'IX_uCommerce_Product_Rating')
BEGIN
  DROP INDEX [IX_uCommerce_Product_Rating] ON [dbo].[uCommerce_Product];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Product_Rating] ON [dbo].[uCommerce_Product](Rating ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Product]') AND name = N'IX_uCommerce_Product_Sku')
BEGIN
  DROP INDEX [IX_uCommerce_Product_Sku] ON [dbo].[uCommerce_Product];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Product_Sku] ON [dbo].[uCommerce_Product](Sku ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Product]') AND name = N'IX_uCommerce_Product_VariantSku')
BEGIN
  DROP INDEX [IX_uCommerce_Product_VariantSku] ON [dbo].[uCommerce_Product];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Product_VariantSku] ON [dbo].[uCommerce_Product](VariantSku ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'IX_uCommerce_ProductCatalog_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalog_Deleted] ON [dbo].[uCommerce_ProductCatalog];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalog_Deleted] ON [dbo].[uCommerce_ProductCatalog](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'IX_uCommerce_ProductCatalog_DisplayOnWebSite')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalog_DisplayOnWebSite] ON [dbo].[uCommerce_ProductCatalog];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalog_DisplayOnWebSite] ON [dbo].[uCommerce_ProductCatalog](DisplayOnWebSite ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'IX_uCommerce_ProductCatalog_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalog_Guid] ON [dbo].[uCommerce_ProductCatalog];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalog_Guid] ON [dbo].[uCommerce_ProductCatalog](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'IX_uCommerce_ProductCatalog_IsVirtual')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalog_IsVirtual] ON [dbo].[uCommerce_ProductCatalog];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalog_IsVirtual] ON [dbo].[uCommerce_ProductCatalog](IsVirtual ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'IX_uCommerce_ProductCatalog_LimitedAccess')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalog_LimitedAccess] ON [dbo].[uCommerce_ProductCatalog];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalog_LimitedAccess] ON [dbo].[uCommerce_ProductCatalog](LimitedAccess ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'IX_uCommerce_ProductCatalog_Name')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalog_Name] ON [dbo].[uCommerce_ProductCatalog];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalog_Name] ON [dbo].[uCommerce_ProductCatalog](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'IX_uCommerce_ProductCatalog_PriceGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalog_PriceGroupId] ON [dbo].[uCommerce_ProductCatalog];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalog_PriceGroupId] ON [dbo].[uCommerce_ProductCatalog](PriceGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'IX_uCommerce_ProductCatalog_ProductCatalogGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalog_ProductCatalogGroupId] ON [dbo].[uCommerce_ProductCatalog];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalog_ProductCatalogGroupId] ON [dbo].[uCommerce_ProductCatalog](ProductCatalogGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'IX_uCommerce_ProductCatalog_ShowPricesIncludingVAT')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalog_ShowPricesIncludingVAT] ON [dbo].[uCommerce_ProductCatalog];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalog_ShowPricesIncludingVAT] ON [dbo].[uCommerce_ProductCatalog](ShowPricesIncludingVAT ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'IX_uCommerce_ProductCatalog_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalog_SortOrder] ON [dbo].[uCommerce_ProductCatalog];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalog_SortOrder] ON [dbo].[uCommerce_ProductCatalog](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogDescription]') AND name = N'IX_uCommerce_ProductCatalogDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogDescription_CultureCode] ON [dbo].[uCommerce_ProductCatalogDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogDescription_CultureCode] ON [dbo].[uCommerce_ProductCatalogDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogDescription]') AND name = N'IX_uCommerce_ProductCatalogDescription_ProductCatalogId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogDescription_ProductCatalogId] ON [dbo].[uCommerce_ProductCatalogDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogDescription_ProductCatalogId] ON [dbo].[uCommerce_ProductCatalogDescription](ProductCatalogId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND name = N'IX_uCommerce_ProductCatalogGroup_CreateCustomersAsMembers')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroup_CreateCustomersAsMembers] ON [dbo].[uCommerce_ProductCatalogGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroup_CreateCustomersAsMembers] ON [dbo].[uCommerce_ProductCatalogGroup](CreateCustomersAsMembers ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND name = N'IX_uCommerce_ProductCatalogGroup_CurrencyId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroup_CurrencyId] ON [dbo].[uCommerce_ProductCatalogGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroup_CurrencyId] ON [dbo].[uCommerce_ProductCatalogGroup](CurrencyId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND name = N'IX_uCommerce_ProductCatalogGroup_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroup_Deleted] ON [dbo].[uCommerce_ProductCatalogGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroup_Deleted] ON [dbo].[uCommerce_ProductCatalogGroup](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND name = N'IX_uCommerce_ProductCatalogGroup_DomainId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroup_DomainId] ON [dbo].[uCommerce_ProductCatalogGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroup_DomainId] ON [dbo].[uCommerce_ProductCatalogGroup](DomainId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND name = N'IX_uCommerce_ProductCatalogGroup_EmailProfileId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroup_EmailProfileId] ON [dbo].[uCommerce_ProductCatalogGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroup_EmailProfileId] ON [dbo].[uCommerce_ProductCatalogGroup](EmailProfileId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND name = N'IX_uCommerce_ProductCatalogGroup_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroup_Guid] ON [dbo].[uCommerce_ProductCatalogGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroup_Guid] ON [dbo].[uCommerce_ProductCatalogGroup](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND name = N'IX_uCommerce_ProductCatalogGroup_MemberGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroup_MemberGroupId] ON [dbo].[uCommerce_ProductCatalogGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroup_MemberGroupId] ON [dbo].[uCommerce_ProductCatalogGroup](MemberGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND name = N'IX_uCommerce_ProductCatalogGroup_MemberTypeId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroup_MemberTypeId] ON [dbo].[uCommerce_ProductCatalogGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroup_MemberTypeId] ON [dbo].[uCommerce_ProductCatalogGroup](MemberTypeId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND name = N'IX_uCommerce_ProductCatalogGroup_Name')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroup_Name] ON [dbo].[uCommerce_ProductCatalogGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroup_Name] ON [dbo].[uCommerce_ProductCatalogGroup](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND name = N'IX_uCommerce_ProductCatalogGroup_OrderNumberId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroup_OrderNumberId] ON [dbo].[uCommerce_ProductCatalogGroup];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroup_OrderNumberId] ON [dbo].[uCommerce_ProductCatalogGroup](OrderNumberId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroupCampaignRelation]') AND name = N'IX_uCommerce_ProductCatalogGroupCampaignRelation_CampaignId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroupCampaignRelation_CampaignId] ON [dbo].[uCommerce_ProductCatalogGroupCampaignRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroupCampaignRelation_CampaignId] ON [dbo].[uCommerce_ProductCatalogGroupCampaignRelation](CampaignId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroupCampaignRelation]') AND name = N'IX_uCommerce_ProductCatalogGroupCampaignRelation_ProductCatalogGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroupCampaignRelation_ProductCatalogGroupId] ON [dbo].[uCommerce_ProductCatalogGroupCampaignRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroupCampaignRelation_ProductCatalogGroupId] ON [dbo].[uCommerce_ProductCatalogGroupCampaignRelation](ProductCatalogGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroupTarget]') AND name = N'IX_uCommerce_ProductCatalogGroupTarget_Name')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogGroupTarget_Name] ON [dbo].[uCommerce_ProductCatalogGroupTarget];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogGroupTarget_Name] ON [dbo].[uCommerce_ProductCatalogGroupTarget](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogPriceGroupRelation]') AND name = N'IX_uCommerce_ProductCatalogPriceGroupRelation_PriceGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogPriceGroupRelation_PriceGroupId] ON [dbo].[uCommerce_ProductCatalogPriceGroupRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogPriceGroupRelation_PriceGroupId] ON [dbo].[uCommerce_ProductCatalogPriceGroupRelation](PriceGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogPriceGroupRelation]') AND name = N'IX_uCommerce_ProductCatalogPriceGroupRelation_ProductCatalogId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogPriceGroupRelation_ProductCatalogId] ON [dbo].[uCommerce_ProductCatalogPriceGroupRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogPriceGroupRelation_ProductCatalogId] ON [dbo].[uCommerce_ProductCatalogPriceGroupRelation](ProductCatalogId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogPriceGroupRelation]') AND name = N'IX_uCommerce_ProductCatalogPriceGroupRelation_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogPriceGroupRelation_SortOrder] ON [dbo].[uCommerce_ProductCatalogPriceGroupRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogPriceGroupRelation_SortOrder] ON [dbo].[uCommerce_ProductCatalogPriceGroupRelation](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogTarget]') AND name = N'IX_uCommerce_ProductCatalogTarget_Name')
BEGIN
  DROP INDEX [IX_uCommerce_ProductCatalogTarget_Name] ON [dbo].[uCommerce_ProductCatalogTarget];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductCatalogTarget_Name] ON [dbo].[uCommerce_ProductCatalogTarget](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinition]') AND name = N'IX_uCommerce_ProductDefinition_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinition_Deleted] ON [dbo].[uCommerce_ProductDefinition];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinition_Deleted] ON [dbo].[uCommerce_ProductDefinition](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinition]') AND name = N'IX_uCommerce_ProductDefinition_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinition_Guid] ON [dbo].[uCommerce_ProductDefinition];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinition_Guid] ON [dbo].[uCommerce_ProductDefinition](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinition]') AND name = N'IX_uCommerce_ProductDefinition_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinition_SortOrder] ON [dbo].[uCommerce_ProductDefinition];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinition_SortOrder] ON [dbo].[uCommerce_ProductDefinition](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_DataTypeId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_DataTypeId] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_DataTypeId] ON [dbo].[uCommerce_ProductDefinitionField](DataTypeId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_Deleted] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_Deleted] ON [dbo].[uCommerce_ProductDefinitionField](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_DisplayOnSite')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_DisplayOnSite] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_DisplayOnSite] ON [dbo].[uCommerce_ProductDefinitionField](DisplayOnSite ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_Facet')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_Facet] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_Facet] ON [dbo].[uCommerce_ProductDefinitionField](Facet ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_Guid')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_Guid] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_Guid] ON [dbo].[uCommerce_ProductDefinitionField](Guid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_IsVariantProperty')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_IsVariantProperty] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_IsVariantProperty] ON [dbo].[uCommerce_ProductDefinitionField](IsVariantProperty ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_Multilingual')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_Multilingual] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_Multilingual] ON [dbo].[uCommerce_ProductDefinitionField](Multilingual ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_ProductDefinitionId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_ProductDefinitionId] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_ProductDefinitionId] ON [dbo].[uCommerce_ProductDefinitionField](ProductDefinitionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_RenderInEditor')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_RenderInEditor] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_RenderInEditor] ON [dbo].[uCommerce_ProductDefinitionField](RenderInEditor ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_Searchable')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_Searchable] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_Searchable] ON [dbo].[uCommerce_ProductDefinitionField](Searchable ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND name = N'IX_uCommerce_ProductDefinitionField_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionField_SortOrder] ON [dbo].[uCommerce_ProductDefinitionField];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionField_SortOrder] ON [dbo].[uCommerce_ProductDefinitionField](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionFieldDescription]') AND name = N'IX_uCommerce_ProductDefinitionFieldDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionFieldDescription_CultureCode] ON [dbo].[uCommerce_ProductDefinitionFieldDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionFieldDescription_CultureCode] ON [dbo].[uCommerce_ProductDefinitionFieldDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionFieldDescription]') AND name = N'IX_uCommerce_ProductDefinitionFieldDescription_ProductDefinitionFieldId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionFieldDescription_ProductDefinitionFieldId] ON [dbo].[uCommerce_ProductDefinitionFieldDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionFieldDescription_ProductDefinitionFieldId] ON [dbo].[uCommerce_ProductDefinitionFieldDescription](ProductDefinitionFieldId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionRelation]') AND name = N'IX_uCommerce_ProductDefinitionRelation_ParentProductDefinitionId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionRelation_ParentProductDefinitionId] ON [dbo].[uCommerce_ProductDefinitionRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionRelation_ParentProductDefinitionId] ON [dbo].[uCommerce_ProductDefinitionRelation](ParentProductDefinitionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionRelation]') AND name = N'IX_uCommerce_ProductDefinitionRelation_ProductDefinitionId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionRelation_ProductDefinitionId] ON [dbo].[uCommerce_ProductDefinitionRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionRelation_ProductDefinitionId] ON [dbo].[uCommerce_ProductDefinitionRelation](ProductDefinitionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionRelation]') AND name = N'IX_uCommerce_ProductDefinitionRelation_SortOrder')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDefinitionRelation_SortOrder] ON [dbo].[uCommerce_ProductDefinitionRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDefinitionRelation_SortOrder] ON [dbo].[uCommerce_ProductDefinitionRelation](SortOrder ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDescription]') AND name = N'IX_uCommerce_ProductDescription_ProductId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDescription_ProductId] ON [dbo].[uCommerce_ProductDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDescription_ProductId] ON [dbo].[uCommerce_ProductDescription](ProductId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDescription]') AND name = N'IX_uCommerce_ProductDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDescription_CultureCode] ON [dbo].[uCommerce_ProductDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDescription_CultureCode] ON [dbo].[uCommerce_ProductDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDescriptionProperty]') AND name = N'IX_uCommerce_ProductDescriptionProperty_ProductDefinitionFieldId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDescriptionProperty_ProductDefinitionFieldId] ON [dbo].[uCommerce_ProductDescriptionProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDescriptionProperty_ProductDefinitionFieldId] ON [dbo].[uCommerce_ProductDescriptionProperty](ProductDefinitionFieldId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDescriptionProperty]') AND name = N'IX_uCommerce_ProductDescriptionProperty_ProductDescriptionId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductDescriptionProperty_ProductDescriptionId] ON [dbo].[uCommerce_ProductDescriptionProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductDescriptionProperty_ProductDescriptionId] ON [dbo].[uCommerce_ProductDescriptionProperty](ProductDescriptionId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductProperty]') AND name = N'IX_uCommerce_ProductProperty_ProductId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductProperty_ProductId] ON [dbo].[uCommerce_ProductProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductProperty_ProductId] ON [dbo].[uCommerce_ProductProperty](ProductId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductProperty]') AND name = N'IX_uCommerce_ProductProperty_ProductDefinitionFieldId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductProperty_ProductDefinitionFieldId] ON [dbo].[uCommerce_ProductProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductProperty_ProductDefinitionFieldId] ON [dbo].[uCommerce_ProductProperty](ProductDefinitionFieldId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductRelation]') AND name = N'IX_uCommerce_ProductRelation_ProductId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductRelation_ProductId] ON [dbo].[uCommerce_ProductRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductRelation_ProductId] ON [dbo].[uCommerce_ProductRelation](ProductId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductRelation]') AND name = N'IX_uCommerce_ProductRelation_ProductRelationTypeId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductRelation_ProductRelationTypeId] ON [dbo].[uCommerce_ProductRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductRelation_ProductRelationTypeId] ON [dbo].[uCommerce_ProductRelation](ProductRelationTypeId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductRelation]') AND name = N'IX_uCommerce_ProductRelation_RelatedProductId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductRelation_RelatedProductId] ON [dbo].[uCommerce_ProductRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductRelation_RelatedProductId] ON [dbo].[uCommerce_ProductRelation](RelatedProductId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductRelationType]') AND name = N'IX_uCommerce_ProductRelationType_Name')
BEGIN
  DROP INDEX [IX_uCommerce_ProductRelationType_Name] ON [dbo].[uCommerce_ProductRelationType];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductRelationType_Name] ON [dbo].[uCommerce_ProductRelationType](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReview]') AND name = N'IX_uCommerce_ProductReview_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReview_CultureCode] ON [dbo].[uCommerce_ProductReview];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReview_CultureCode] ON [dbo].[uCommerce_ProductReview](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReview]') AND name = N'IX_uCommerce_ProductReview_CustomerId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReview_CustomerId] ON [dbo].[uCommerce_ProductReview];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReview_CustomerId] ON [dbo].[uCommerce_ProductReview](CustomerId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReview]') AND name = N'IX_uCommerce_ProductReview_ProductCatalogGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReview_ProductCatalogGroupId] ON [dbo].[uCommerce_ProductReview];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReview_ProductCatalogGroupId] ON [dbo].[uCommerce_ProductReview](ProductCatalogGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReview]') AND name = N'IX_uCommerce_ProductReview_ProductId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReview_ProductId] ON [dbo].[uCommerce_ProductReview];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReview_ProductId] ON [dbo].[uCommerce_ProductReview](ProductId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReview]') AND name = N'IX_uCommerce_ProductReview_ProductReviewStatusId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReview_ProductReviewStatusId] ON [dbo].[uCommerce_ProductReview];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReview_ProductReviewStatusId] ON [dbo].[uCommerce_ProductReview](ProductReviewStatusId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReview]') AND name = N'IX_uCommerce_ProductReview_Rating')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReview_Rating] ON [dbo].[uCommerce_ProductReview];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReview_Rating] ON [dbo].[uCommerce_ProductReview](Rating ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReviewComment]') AND name = N'IX_uCommerce_ProductReviewComment_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReviewComment_CultureCode] ON [dbo].[uCommerce_ProductReviewComment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReviewComment_CultureCode] ON [dbo].[uCommerce_ProductReviewComment](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReviewComment]') AND name = N'IX_uCommerce_ProductReviewComment_CustomerId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReviewComment_CustomerId] ON [dbo].[uCommerce_ProductReviewComment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReviewComment_CustomerId] ON [dbo].[uCommerce_ProductReviewComment](CustomerId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReviewComment]') AND name = N'IX_uCommerce_ProductReviewComment_Helpful')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReviewComment_Helpful] ON [dbo].[uCommerce_ProductReviewComment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReviewComment_Helpful] ON [dbo].[uCommerce_ProductReviewComment](Helpful ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReviewComment]') AND name = N'IX_uCommerce_ProductReviewComment_ProductReviewId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReviewComment_ProductReviewId] ON [dbo].[uCommerce_ProductReviewComment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReviewComment_ProductReviewId] ON [dbo].[uCommerce_ProductReviewComment](ProductReviewId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReviewComment]') AND name = N'IX_uCommerce_ProductReviewComment_ProductReviewStatusId')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReviewComment_ProductReviewStatusId] ON [dbo].[uCommerce_ProductReviewComment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReviewComment_ProductReviewStatusId] ON [dbo].[uCommerce_ProductReviewComment](ProductReviewStatusId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReviewComment]') AND name = N'IX_uCommerce_ProductReviewComment_Unhelpful')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReviewComment_Unhelpful] ON [dbo].[uCommerce_ProductReviewComment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReviewComment_Unhelpful] ON [dbo].[uCommerce_ProductReviewComment](Unhelpful ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReviewStatus]') AND name = N'IX_uCommerce_ProductReviewStatus_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_ProductReviewStatus_Deleted] ON [dbo].[uCommerce_ProductReviewStatus];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ProductReviewStatus_Deleted] ON [dbo].[uCommerce_ProductReviewStatus](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND name = N'IX_uCommerce_PurchaseOrder_BillingAddressId')
BEGIN
  DROP INDEX [IX_uCommerce_PurchaseOrder_BillingAddressId] ON [dbo].[uCommerce_PurchaseOrder];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_BillingAddressId] ON [dbo].[uCommerce_PurchaseOrder](BillingAddressId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND name = N'IX_uCommerce_PurchaseOrder_BasketId')
BEGIN
  DROP INDEX [IX_uCommerce_PurchaseOrder_BasketId] ON [dbo].[uCommerce_PurchaseOrder];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_BasketId] ON [dbo].[uCommerce_PurchaseOrder](BasketId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND name = N'IX_uCommerce_PurchaseOrder_CurrencyId')
BEGIN
  DROP INDEX [IX_uCommerce_PurchaseOrder_CurrencyId] ON [dbo].[uCommerce_PurchaseOrder];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_CurrencyId] ON [dbo].[uCommerce_PurchaseOrder](CurrencyId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND name = N'IX_uCommerce_PurchaseOrder_CustomerId')
BEGIN
  DROP INDEX [IX_uCommerce_PurchaseOrder_CustomerId] ON [dbo].[uCommerce_PurchaseOrder];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_CustomerId] ON [dbo].[uCommerce_PurchaseOrder](CustomerId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND name = N'IX_uCommerce_PurchaseOrder_OrderGuid')
BEGIN
  DROP INDEX [IX_uCommerce_PurchaseOrder_OrderGuid] ON [dbo].[uCommerce_PurchaseOrder];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_OrderGuid] ON [dbo].[uCommerce_PurchaseOrder](OrderGuid ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND name = N'IX_uCommerce_PurchaseOrder_OrderNumber')
BEGIN
  DROP INDEX [IX_uCommerce_PurchaseOrder_OrderNumber] ON [dbo].[uCommerce_PurchaseOrder];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_OrderNumber] ON [dbo].[uCommerce_PurchaseOrder](OrderNumber ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND name = N'IX_uCommerce_PurchaseOrder_OrderStatusId')
BEGIN
  DROP INDEX [IX_uCommerce_PurchaseOrder_OrderStatusId] ON [dbo].[uCommerce_PurchaseOrder];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_OrderStatusId] ON [dbo].[uCommerce_PurchaseOrder](OrderStatusId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND name = N'IX_uCommerce_PurchaseOrder_ProductCatalogGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_PurchaseOrder_ProductCatalogGroupId] ON [dbo].[uCommerce_PurchaseOrder];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_PurchaseOrder_ProductCatalogGroupId] ON [dbo].[uCommerce_PurchaseOrder](ProductCatalogGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_QuantityTarget]') AND name = N'IX_uCommerce_QuantityTarget_TargetOrderLine')
BEGIN
  DROP INDEX [IX_uCommerce_QuantityTarget_TargetOrderLine] ON [dbo].[uCommerce_QuantityTarget];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_QuantityTarget_TargetOrderLine] ON [dbo].[uCommerce_QuantityTarget](TargetOrderLine ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Role]') AND name = N'IX_uCommerce_Role_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_Role_CultureCode] ON [dbo].[uCommerce_Role];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Role_CultureCode] ON [dbo].[uCommerce_Role](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Role]') AND name = N'IX_uCommerce_Role_Name')
BEGIN
  DROP INDEX [IX_uCommerce_Role_Name] ON [dbo].[uCommerce_Role];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Role_Name] ON [dbo].[uCommerce_Role](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Role]') AND name = N'IX_uCommerce_Role_ParentRoleId')
BEGIN
  DROP INDEX [IX_uCommerce_Role_ParentRoleId] ON [dbo].[uCommerce_Role];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Role_ParentRoleId] ON [dbo].[uCommerce_Role](ParentRoleId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Role]') AND name = N'IX_uCommerce_Role_PriceGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_Role_PriceGroupId] ON [dbo].[uCommerce_Role];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Role_PriceGroupId] ON [dbo].[uCommerce_Role](PriceGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Role]') AND name = N'IX_uCommerce_Role_ProductCatalogGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_Role_ProductCatalogGroupId] ON [dbo].[uCommerce_Role];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Role_ProductCatalogGroupId] ON [dbo].[uCommerce_Role](ProductCatalogGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Role]') AND name = N'IX_uCommerce_Role_ProductCatalogId')
BEGIN
  DROP INDEX [IX_uCommerce_Role_ProductCatalogId] ON [dbo].[uCommerce_Role];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Role_ProductCatalogId] ON [dbo].[uCommerce_Role](ProductCatalogId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Role]') AND name = N'IX_uCommerce_Role_RoleType')
BEGIN
  DROP INDEX [IX_uCommerce_Role_RoleType] ON [dbo].[uCommerce_Role];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Role_RoleType] ON [dbo].[uCommerce_Role](RoleType ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Shipment]') AND name = N'IX_uCommerce_Shipment_OrderId')
BEGIN
  DROP INDEX [IX_uCommerce_Shipment_OrderId] ON [dbo].[uCommerce_Shipment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Shipment_OrderId] ON [dbo].[uCommerce_Shipment](OrderId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Shipment]') AND name = N'IX_uCommerce_Shipment_ShipmentAddressId')
BEGIN
  DROP INDEX [IX_uCommerce_Shipment_ShipmentAddressId] ON [dbo].[uCommerce_Shipment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Shipment_ShipmentAddressId] ON [dbo].[uCommerce_Shipment](ShipmentAddressId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Shipment]') AND name = N'IX_uCommerce_Shipment_ShipmentName')
BEGIN
  DROP INDEX [IX_uCommerce_Shipment_ShipmentName] ON [dbo].[uCommerce_Shipment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Shipment_ShipmentName] ON [dbo].[uCommerce_Shipment](ShipmentName ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Shipment]') AND name = N'IX_uCommerce_Shipment_ShippingMethodId')
BEGIN
  DROP INDEX [IX_uCommerce_Shipment_ShippingMethodId] ON [dbo].[uCommerce_Shipment];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Shipment_ShippingMethodId] ON [dbo].[uCommerce_Shipment](ShippingMethodId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShipmentDiscountRelation]') AND name = N'IX_uCommerce_ShipmentDiscountRelation_DiscountId')
BEGIN
  DROP INDEX [IX_uCommerce_ShipmentDiscountRelation_DiscountId] ON [dbo].[uCommerce_ShipmentDiscountRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShipmentDiscountRelation_DiscountId] ON [dbo].[uCommerce_ShipmentDiscountRelation](DiscountId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShipmentDiscountRelation]') AND name = N'IX_uCommerce_ShipmentDiscountRelation_ShipmentId')
BEGIN
  DROP INDEX [IX_uCommerce_ShipmentDiscountRelation_ShipmentId] ON [dbo].[uCommerce_ShipmentDiscountRelation];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShipmentDiscountRelation_ShipmentId] ON [dbo].[uCommerce_ShipmentDiscountRelation](ShipmentId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethod]') AND name = N'IX_uCommerce_ShippingMethod_Deleted')
BEGIN
  DROP INDEX [IX_uCommerce_ShippingMethod_Deleted] ON [dbo].[uCommerce_ShippingMethod];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShippingMethod_Deleted] ON [dbo].[uCommerce_ShippingMethod](Deleted ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethod]') AND name = N'IX_uCommerce_ShippingMethod_Name')
BEGIN
  DROP INDEX [IX_uCommerce_ShippingMethod_Name] ON [dbo].[uCommerce_ShippingMethod];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShippingMethod_Name] ON [dbo].[uCommerce_ShippingMethod](Name ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethod]') AND name = N'IX_uCommerce_ShippingMethod_PaymentMethodId')
BEGIN
  DROP INDEX [IX_uCommerce_ShippingMethod_PaymentMethodId] ON [dbo].[uCommerce_ShippingMethod];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShippingMethod_PaymentMethodId] ON [dbo].[uCommerce_ShippingMethod](PaymentMethodId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethod]') AND name = N'IX_uCommerce_ShippingMethod_ServiceName')
BEGIN
  DROP INDEX [IX_uCommerce_ShippingMethod_ServiceName] ON [dbo].[uCommerce_ShippingMethod];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShippingMethod_ServiceName] ON [dbo].[uCommerce_ShippingMethod](ServiceName ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethodDescription]') AND name = N'IX_uCommerce_ShippingMethodDescription_CultureCode')
BEGIN
  DROP INDEX [IX_uCommerce_ShippingMethodDescription_CultureCode] ON [dbo].[uCommerce_ShippingMethodDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShippingMethodDescription_CultureCode] ON [dbo].[uCommerce_ShippingMethodDescription](CultureCode ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethodDescription]') AND name = N'IX_uCommerce_ShippingMethodDescription_ShippingMethodId')
BEGIN
  DROP INDEX [IX_uCommerce_ShippingMethodDescription_ShippingMethodId] ON [dbo].[uCommerce_ShippingMethodDescription];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShippingMethodDescription_ShippingMethodId] ON [dbo].[uCommerce_ShippingMethodDescription](ShippingMethodId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethodPrice]') AND name = N'IX_uCommerce_ShippingMethodPrice_CurrencyId')
BEGIN
  DROP INDEX [IX_uCommerce_ShippingMethodPrice_CurrencyId] ON [dbo].[uCommerce_ShippingMethodPrice];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShippingMethodPrice_CurrencyId] ON [dbo].[uCommerce_ShippingMethodPrice](CurrencyId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethodPrice]') AND name = N'IX_uCommerce_ShippingMethodPrice_PriceGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_ShippingMethodPrice_PriceGroupId] ON [dbo].[uCommerce_ShippingMethodPrice];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShippingMethodPrice_PriceGroupId] ON [dbo].[uCommerce_ShippingMethodPrice](PriceGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethodPrice]') AND name = N'IX_uCommerce_ShippingMethodPrice_ShippingMethodId')
BEGIN
  DROP INDEX [IX_uCommerce_ShippingMethodPrice_ShippingMethodId] ON [dbo].[uCommerce_ShippingMethodPrice];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_ShippingMethodPrice_ShippingMethodId] ON [dbo].[uCommerce_ShippingMethodPrice](ShippingMethodId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_SystemVersion]') AND name = N'IX_uCommerce_SystemVersion_SchemaVersion')
BEGIN
  DROP INDEX [IX_uCommerce_SystemVersion_SchemaVersion] ON [dbo].[uCommerce_SystemVersion];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_SystemVersion_SchemaVersion] ON [dbo].[uCommerce_SystemVersion](SchemaVersion ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Target]') AND name = N'IX_uCommerce_Target_CampaignItemId')
BEGIN
  DROP INDEX [IX_uCommerce_Target_CampaignItemId] ON [dbo].[uCommerce_Target];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Target_CampaignItemId] ON [dbo].[uCommerce_Target](CampaignItemId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Target]') AND name = N'IX_uCommerce_Target_EnabledForApply')
BEGIN
  DROP INDEX [IX_uCommerce_Target_EnabledForApply] ON [dbo].[uCommerce_Target];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Target_EnabledForApply] ON [dbo].[uCommerce_Target](EnabledForApply ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Target]') AND name = N'IX_uCommerce_Target_EnabledForDisplay')
BEGIN
  DROP INDEX [IX_uCommerce_Target_EnabledForDisplay] ON [dbo].[uCommerce_Target];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_Target_EnabledForDisplay] ON [dbo].[uCommerce_Target](EnabledForDisplay ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_UserGroupPermission]') AND name = N'IX_uCommerce_UserGroupPermission_RoleId')
BEGIN
  DROP INDEX [IX_uCommerce_UserGroupPermission_RoleId] ON [dbo].[uCommerce_UserGroupPermission];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_UserGroupPermission_RoleId] ON [dbo].[uCommerce_UserGroupPermission](RoleId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_UserGroupPermission]') AND name = N'IX_uCommerce_UserGroupPermission_UserGroupId')
BEGIN
  DROP INDEX [IX_uCommerce_UserGroupPermission_UserGroupId] ON [dbo].[uCommerce_UserGroupPermission];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_UserGroupPermission_UserGroupId] ON [dbo].[uCommerce_UserGroupPermission](UserGroupId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_UserWidgetSetting]') AND name = N'IX_uCommerce_UserWidgetSetting_UserId')
BEGIN
  DROP INDEX [IX_uCommerce_UserWidgetSetting_UserId] ON [dbo].[uCommerce_UserWidgetSetting];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_UserWidgetSetting_UserId] ON [dbo].[uCommerce_UserWidgetSetting](UserId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_UserWidgetSettingProperty]') AND name = N'IX_uCommerce_UserWidgetSettingProperty_UserWidgetSettingId')
BEGIN
  DROP INDEX [IX_uCommerce_UserWidgetSettingProperty_UserWidgetSettingId] ON [dbo].[uCommerce_UserWidgetSettingProperty];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_UserWidgetSettingProperty_UserWidgetSettingId] ON [dbo].[uCommerce_UserWidgetSettingProperty](UserWidgetSettingId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_VoucherCode]') AND name = N'IX_uCommerce_VoucherCode_MaxUses')
BEGIN
  DROP INDEX [IX_uCommerce_VoucherCode_MaxUses] ON [dbo].[uCommerce_VoucherCode];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_VoucherCode_MaxUses] ON [dbo].[uCommerce_VoucherCode](MaxUses ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_VoucherCode]') AND name = N'IX_uCommerce_VoucherCode_NumberUsed')
BEGIN
  DROP INDEX [IX_uCommerce_VoucherCode_NumberUsed] ON [dbo].[uCommerce_VoucherCode];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_VoucherCode_NumberUsed] ON [dbo].[uCommerce_VoucherCode](NumberUsed ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_VoucherCode]') AND name = N'IX_uCommerce_VoucherCode_TargetId')
BEGIN
  DROP INDEX [IX_uCommerce_VoucherCode_TargetId] ON [dbo].[uCommerce_VoucherCode];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_VoucherCode_TargetId] ON [dbo].[uCommerce_VoucherCode](TargetId ASC);

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_VoucherTarget]') AND name = N'IX_uCommerce_VoucherTarget_Name')
BEGIN
  DROP INDEX [IX_uCommerce_VoucherTarget_Name] ON [dbo].[uCommerce_VoucherTarget];
END

GO

CREATE NONCLUSTERED INDEX [IX_uCommerce_VoucherTarget_Name] ON [dbo].[uCommerce_VoucherTarget](Name ASC);

GO

WITH CTE AS(
   SELECT CategoryDescriptionId, CultureCode, CategoryId,
       RN = ROW_NUMBER()OVER(PARTITION BY CultureCode, CategoryId ORDER BY CategoryDescriptionId DESC)
   FROM uCommerce_CategoryDescription
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryDescription]') AND name = N'UX_uCommerce_CategoryDescription_CultureCode_CategoryId')
BEGIN
  DROP INDEX [UX_uCommerce_CategoryDescription_CultureCode_CategoryId] ON [dbo].[uCommerce_CategoryDescription];
END

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_CategoryDescription_CultureCode_CategoryId] ON [dbo].[uCommerce_CategoryDescription]([CultureCode] ASC, [CategoryId] ASC);


GO

WITH CTE AS(
   SELECT CategoryId, ProductId,
       RN = ROW_NUMBER()OVER(PARTITION BY CategoryId, ProductId ORDER BY CategoryProductRelationId DESC)
   FROM uCommerce_CategoryProductRelation
)
DELETE FROM CTE WHERE RN > 1		

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryProductRelation]') AND name = N'UX_uCommerce_CategoryProductRelation_CategoryId_ProductId')
BEGIN
  DROP INDEX [UX_uCommerce_CategoryProductRelation_CategoryId_ProductId] ON [dbo].[uCommerce_CategoryProductRelation];
END

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_CategoryProductRelation_CategoryId_ProductId] ON [dbo].[uCommerce_CategoryProductRelation]([CategoryId] ASC, [ProductId] ASC);

GO

WITH CTE AS(
   SELECT CategoryPropertyId, CategoryId, CultureCode, DefinitionFieldId,
       RN = ROW_NUMBER()OVER(PARTITION BY CategoryId, CultureCode, DefinitionFieldId ORDER BY CategoryPropertyId DESC)
   FROM uCommerce_CategoryProperty
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryProperty]') AND name = N'UX_uCommerce_CategoryProperty_CategoryId_CultureCode_DefinitionFieldId')
BEGIN
  DROP INDEX [UX_uCommerce_CategoryProperty_CategoryId_CultureCode_DefinitionFieldId] ON [dbo].[uCommerce_CategoryProperty];
END
	
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_CategoryProperty_CategoryId_CultureCode_DefinitionFieldId] ON [dbo].[uCommerce_CategoryProperty]([CategoryId] ASC, [CultureCode] ASC, [DefinitionFieldId] ASC);


GO

WITH CTE AS(
   SELECT PaymentMethodPropertyId, PaymentMethodId, CultureCode, DefinitionFieldId,
       RN = ROW_NUMBER()OVER(PARTITION BY PaymentMethodId, CultureCode, DefinitionFieldId ORDER BY PaymentMethodPropertyId DESC)
   FROM uCommerce_PaymentMethodProperty
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodProperty]') AND name = N'UX_uCommerce_PaymentMethodProperty_PaymentMethodId_CultureCode_DefinitionFieldId')
BEGIN
  DROP INDEX [UX_uCommerce_PaymentMethodProperty_PaymentMethodId_CultureCode_DefinitionFieldId] ON [dbo].[uCommerce_PaymentMethodProperty];
END
	
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PaymentMethodProperty_PaymentMethodId_CultureCode_DefinitionFieldId]
    ON [dbo].[uCommerce_PaymentMethodProperty]([PaymentMethodId] ASC, [CultureCode] ASC, [DefinitionFieldId] ASC);

GO
	
WITH CTE AS(
   SELECT UserId, RoleId,
       RN = ROW_NUMBER()OVER(PARTITION BY UserId, RoleId ORDER BY PermissionId DESC)
   FROM uCommerce_Permission
)
DELETE FROM CTE WHERE RN > 1		

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Permission]') AND name = N'UX_uCommerce_Permission_UserId_RoleId')
BEGIN
  DROP INDEX [UX_uCommerce_Permission_UserId_RoleId] ON [dbo].[uCommerce_Permission];
END

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Permission_UserId_RoleId]
    ON [dbo].[uCommerce_Permission]([UserId] ASC, [RoleId] ASC);

	
	
GO

WITH CTE AS(
   SELECT PriceGroupPriceId, ProductId, PriceGroupId,
       RN = ROW_NUMBER()OVER(PARTITION BY ProductId, PriceGroupId ORDER BY PriceGroupPriceId DESC)
   FROM uCommerce_PriceGroupPrice
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PriceGroupPrice]') AND name = N'UX_uCommerce_PriceGroupPrice_ProductId_PriceGroupId')
BEGIN
  DROP INDEX [UX_uCommerce_PriceGroupPrice_ProductId_PriceGroupId] ON [dbo].[uCommerce_PriceGroupPrice];
END

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PriceGroupPrice_ProductId_PriceGroupId]
    ON [dbo].[uCommerce_PriceGroupPrice]([ProductId] ASC, [PriceGroupId] ASC);

	
GO
	
WITH CTE AS(
   SELECT ProductId, Sku, VariantSku,
       RN = ROW_NUMBER()OVER(PARTITION BY Sku, VariantSku ORDER BY ProductId DESC)
   FROM uCommerce_Product
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Product]') AND name = N'UX_uCommerce_Product_Sku_VariantSku')
BEGIN
  DROP INDEX [UX_uCommerce_Product_Sku_VariantSku] ON [dbo].[uCommerce_Product];
END
	
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Product_Sku_VariantSku]
    ON [dbo].[uCommerce_Product]([Sku] ASC, [VariantSku] ASC);

GO
	
	WITH CTE AS(
   SELECT ProductCatalogId, Name, ProductCatalogGroupId,
       RN = ROW_NUMBER()OVER(PARTITION BY Name, ProductCatalogGroupId ORDER BY ProductCatalogId DESC)
   FROM uCommerce_ProductCatalog
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND name = N'UX_uCommerce_ProductCatalog_Name_ProductCatalogGroupId')
BEGIN
  DROP INDEX [UX_uCommerce_ProductCatalog_Name_ProductCatalogGroupId] ON [dbo].[uCommerce_ProductCatalog];
END

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalog_Name_ProductCatalogGroupId]
    ON [dbo].[uCommerce_ProductCatalog]([Name] ASC, [ProductCatalogGroupId] ASC);

	
GO

WITH CTE AS(
   SELECT ProductCatalogDescriptionId, ProductCatalogId, CultureCode,
       RN = ROW_NUMBER()OVER(PARTITION BY ProductCatalogId, CultureCode ORDER BY ProductCatalogDescriptionId DESC)
   FROM uCommerce_ProductCatalogDescription
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogDescription]') AND name = N'UX_uCommerce_ProductCatalogDescription_ProductCatalogId_CultureCode')
BEGIN
  DROP INDEX [UX_uCommerce_ProductCatalogDescription_ProductCatalogId_CultureCode] ON [dbo].[uCommerce_ProductCatalogDescription];
END
	
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalogDescription_ProductCatalogId_CultureCode]
    ON [dbo].[uCommerce_ProductCatalogDescription]([ProductCatalogId] ASC, [CultureCode] ASC);


GO
	
WITH CTE AS(
   SELECT ProductDefinitionFieldDescriptionId, CultureCode, ProductDefinitionFieldId,
       RN = ROW_NUMBER()OVER(PARTITION BY CultureCode, ProductDefinitionFieldId ORDER BY ProductDefinitionFieldDescriptionId DESC)
   FROM uCommerce_ProductDefinitionFieldDescription
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionFieldDescription]') AND name = N'UX_uCommerce_ProductDefinitionFieldDescription_CultureCode_ProductDefinitionFieldId')
BEGIN
  DROP INDEX [UX_uCommerce_ProductDefinitionFieldDescription_CultureCode_ProductDefinitionFieldId] ON [dbo].[uCommerce_ProductDefinitionFieldDescription];
END
	
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductDefinitionFieldDescription_CultureCode_ProductDefinitionFieldId]
    ON [dbo].[uCommerce_ProductDefinitionFieldDescription]([CultureCode] ASC, [ProductDefinitionFieldId] ASC);

GO
	
WITH CTE AS(
   SELECT ProductDescriptionId, ProductId, CultureCode,
       RN = ROW_NUMBER()OVER(PARTITION BY ProductId, CultureCode ORDER BY ProductDescriptionId DESC)
   FROM uCommerce_ProductDescription
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDescription]') AND name = N'UX_uCommerce_ProductDescription_ProductId_CultureCode')
BEGIN
  DROP INDEX [UX_uCommerce_ProductDescription_ProductId_CultureCode] ON [dbo].[uCommerce_ProductDescription];
END
	
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductDescription_ProductId_CultureCode]
    ON [dbo].[uCommerce_ProductDescription]([ProductId] ASC, [CultureCode] ASC);

GO
	
WITH CTE AS(
   SELECT ProductDescriptionPropertyId, ProductDescriptionId, ProductDefinitionFieldId,
       RN = ROW_NUMBER()OVER(PARTITION BY ProductDescriptionId, ProductDefinitionFieldId ORDER BY ProductDescriptionPropertyId DESC)
   FROM uCommerce_ProductDescriptionProperty
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDescriptionProperty]') AND name = N'UX_uCommerce_ProductDescriptionProperty_ProductDescriptionId_ProductDefinitionFieldId')
BEGIN
  DROP INDEX [UX_uCommerce_ProductDescriptionProperty_ProductDescriptionId_ProductDefinitionFieldId] ON [dbo].[uCommerce_ProductDescriptionProperty];
END

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductDescriptionProperty_ProductDescriptionId_ProductDefinitionFieldId]
    ON [dbo].[uCommerce_ProductDescriptionProperty]([ProductDescriptionId] ASC, [ProductDefinitionFieldId] ASC);

	
GO
	
WITH CTE AS(
   SELECT ProductPropertyId, ProductId, ProductDefinitionFieldId,
       RN = ROW_NUMBER()OVER(PARTITION BY ProductId, ProductDefinitionFieldId ORDER BY ProductPropertyId DESC)
   FROM uCommerce_ProductProperty
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductProperty]') AND name = N'UX_uCommerce_ProductProperty_ProductId_ProductDefinitionFieldId')
BEGIN
  DROP INDEX [UX_uCommerce_ProductProperty_ProductId_ProductDefinitionFieldId] ON [dbo].[uCommerce_ProductProperty];
END
	
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductProperty_ProductId_ProductDefinitionFieldId]
    ON [dbo].[uCommerce_ProductProperty]([ProductId] ASC, [ProductDefinitionFieldId] ASC);

	
GO
	
WITH CTE AS(
   SELECT ProductRelationId, ProductId, RelatedProductId, ProductRelationTypeId,
       RN = ROW_NUMBER()OVER(PARTITION BY ProductId, RelatedProductId, ProductRelationTypeId ORDER BY ProductRelationId DESC)
   FROM uCommerce_ProductRelation
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductRelation]') AND name = N'UX_uCommerce_ProductRelation_ProductId_RelatedProductId_ProductRelationTypeId')
BEGIN
  DROP INDEX [UX_uCommerce_ProductRelation_ProductId_RelatedProductId_ProductRelationTypeId] ON [dbo].[uCommerce_ProductRelation];
END
	
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductRelation_ProductId_RelatedProductId_ProductRelationTypeId]
    ON [dbo].[uCommerce_ProductRelation]([ProductId] ASC, [RelatedProductId] ASC, [ProductRelationTypeId] ASC);

	
GO
	
WITH CTE AS(
   SELECT UserId, ExternalId,
       RN = ROW_NUMBER()OVER(PARTITION BY ExternalId ORDER BY UserId DESC)
   FROM uCommerce_User
)
DELETE FROM CTE WHERE RN > 1	

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_User]') AND name = N'UX_uCommerce_User_ExternalId')
BEGIN
  DROP INDEX [UX_uCommerce_User_ExternalId] ON [dbo].[uCommerce_User];
END

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_User_ExternalId]
    ON [dbo].[uCommerce_User]([ExternalId] ASC);

GO
	
WITH CTE AS(
   SELECT UserGroupId, ExternalId,
       RN = ROW_NUMBER()OVER(PARTITION BY ExternalId ORDER BY UserGroupId DESC)
   FROM uCommerce_UserGroup
)
DELETE FROM CTE WHERE RN > 1		

GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_UserGroup]') AND name = N'UX_uCommerce_UserGroup_ExternalId')
BEGIN
  DROP INDEX [UX_uCommerce_UserGroup_ExternalId] ON [dbo].[uCommerce_UserGroup];
END
	
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_UserGroup_ExternalId]
    ON [dbo].[uCommerce_UserGroup]([ExternalId] ASC);


GO
ALTER TABLE [dbo].[uCommerce_EntityUiDescription] WITH NOCHECK
    ADD CONSTRAINT [FK_uCommerce_EntityUiDescription_uCommerce_EntityUi] FOREIGN KEY ([EntityUiId]) REFERENCES [dbo].[uCommerce_EntityUi] ([EntityUiId]);
	
GO

ALTER TABLE [dbo].[uCommerce_EntityUiDescription] WITH CHECK CHECK CONSTRAINT [FK_uCommerce_EntityUiDescription_uCommerce_EntityUi];

GO
