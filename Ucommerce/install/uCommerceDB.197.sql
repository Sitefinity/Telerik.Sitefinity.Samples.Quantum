-- Drop invalid constraints
GO
WHILE EXISTS (
	(SELECT * FROM sys.default_constraints WHERE [name] LIKE 'DF%uCommerce___Guid%')
)
BEGiN
DECLARE @tableName VARCHAR(128);
DECLARE @constraintName VARCHAR (128);
SELECT
	@tableName = tmp.TableName,
	@constraintName = tmp.DefaultConstraintName FROM
(
SELECT TOP 1
	[oj].[name] [TableName],
	[dc].[name] [DefaultConstraintName]
	,[dc].[definition]
FROM
	sys.default_constraints [dc],
	sys.all_objects [oj],
	sys.all_columns [ac]
WHERE (
	([oj].[object_id] = [dc].[parent_object_id]) 
	AND ([oj].[object_id] = [ac].[object_id]) 
	AND ([dc].[parent_column_id] = [ac].[column_id])
	AND oj.name LIKE 'uC%'
	AND dc.name LIKE 'DF%uCommerce___Guid%'
	) 
) tmp
DECLARE @sql VARCHAR(MAX);
SET @sql = 'ALTER TABLE '+ @tableName +' DROP CONSTRAINT '+ @constraintName +''
EXEC (@sql) END

-- Create valid constraints
GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_Category_Guid') BEGIN
ALTER TABLE [uCommerce_Category] ADD CONSTRAINT [DF_uCommerce_Category_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_Currency_Guid') BEGIN
ALTER TABLE [uCommerce_Currency] ADD CONSTRAINT [DF_uCommerce_Currency_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_DataType_Guid') BEGIN
ALTER TABLE [uCommerce_DataType] ADD CONSTRAINT [DF_uCommerce_DataType_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_DataTypeEnum_Guid') BEGIN
ALTER TABLE [uCommerce_DataTypeEnum] ADD CONSTRAINT [DF_uCommerce_DataTypeEnum_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_Definition_Guid') BEGIN
ALTER TABLE [uCommerce_Definition] ADD CONSTRAINT [DF_uCommerce_Definition_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_DefinitionField_Guid') BEGIN
ALTER TABLE [uCommerce_DefinitionField] ADD CONSTRAINT [DF_uCommerce_DefinitionField_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_EmailProfile_Guid') BEGIN
ALTER TABLE [uCommerce_EmailProfile] ADD CONSTRAINT [DF_uCommerce_EmailProfile_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_EntityProperty_Guid') BEGIN
ALTER TABLE [uCommerce_EntityProperty] ADD CONSTRAINT [DF_uCommerce_EntityProperty_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_OrderNumberSerie_Guid') BEGIN
ALTER TABLE [uCommerce_OrderNumberSerie] ADD CONSTRAINT [DF_uCommerce_OrderNumberSerie_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_Price_Guid') BEGIN
ALTER TABLE [uCommerce_Price] ADD CONSTRAINT [DF_uCommerce_Price_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_PriceGroup_Guid') BEGIN
ALTER TABLE [uCommerce_PriceGroup] ADD CONSTRAINT [DF_uCommerce_PriceGroup_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_Product_Guid') BEGIN
ALTER TABLE [uCommerce_Product] ADD CONSTRAINT [DF_uCommerce_Product_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_ProductCatalog_Guid') BEGIN
ALTER TABLE [uCommerce_ProductCatalog] ADD CONSTRAINT [DF_uCommerce_ProductCatalog_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_ProductCatalogGroup_Guid') BEGIN
ALTER TABLE [uCommerce_ProductCatalogGroup] ADD CONSTRAINT [DF_uCommerce_ProductCatalogGroup_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_ProductDefinition_Guid') BEGIN
ALTER TABLE [uCommerce_ProductDefinition] ADD CONSTRAINT [DF_uCommerce_ProductDefinition_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_ProductDefinitionField_Guid') BEGIN
ALTER TABLE [uCommerce_ProductDefinitionField] ADD CONSTRAINT [DF_uCommerce_ProductDefinitionField_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

GO
IF NOT EXISTS(SELECT * FROM sys.default_constraints WHERE [name] = 'DF_uCommerce_ProductPrice_Guid') BEGIN
ALTER TABLE [uCommerce_ProductPrice] ADD CONSTRAINT [DF_uCommerce_ProductPrice_Guid] DEFAULT NEWSEQUENTIALID() FOR Guid END

-- Make sure all Guids are unique
GO
UPDATE uCommerce_Category SET Guid = NEWID() WHERE CategoryId IN (
SELECT CategoryId FROM (
    SELECT CategoryId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_Category
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_Currency SET Guid = NEWID() WHERE CurrencyId IN (
SELECT CurrencyId FROM (
    SELECT CurrencyId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_Currency
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_DataType SET Guid = NEWID() WHERE DataTypeId IN (
SELECT DataTypeId FROM (
    SELECT DataTypeId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_DataType
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_DataTypeEnum SET Guid = NEWID() WHERE DataTypeEnumId IN (
SELECT DataTypeEnumId FROM (
    SELECT DataTypeEnumId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_DataTypeEnum
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_Definition SET Guid = NEWID() WHERE DefinitionId IN (
SELECT DefinitionId FROM (
    SELECT DefinitionId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_Definition
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_DefinitionField SET Guid = NEWID() WHERE DefinitionFieldId IN (
SELECT DefinitionFieldId FROM (
    SELECT DefinitionFieldId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_DefinitionField
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_EmailProfile SET Guid = NEWID() WHERE EmailProfileId IN (
SELECT EmailProfileId FROM (
    SELECT EmailProfileId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_EmailProfile
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_EntityProperty SET Guid = NEWID() WHERE EntityPropertyId IN (
SELECT EntityPropertyId FROM (
    SELECT EntityPropertyId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_EntityProperty
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_OrderNumberSerie SET Guid = NEWID() WHERE OrderNumberId IN (
SELECT OrderNumberId FROM (
    SELECT OrderNumberId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_OrderNumberSerie
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_Price SET Guid = NEWID() WHERE PriceId IN (
SELECT PriceId FROM (
    SELECT PriceId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_Price
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_PriceGroup SET Guid = NEWID() WHERE PriceGroupId IN (
SELECT PriceGroupId FROM (
    SELECT PriceGroupId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_PriceGroup
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_Product SET Guid = NEWID() WHERE ProductId IN (
SELECT ProductId FROM (
    SELECT ProductId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_Product
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_ProductCatalog SET Guid = NEWID() WHERE ProductCatalogId IN (
SELECT ProductCatalogId FROM (
    SELECT ProductCatalogId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_ProductCatalog
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_ProductCatalogGroup SET Guid = NEWID() WHERE ProductCatalogGroupId IN (
SELECT ProductCatalogGroupId FROM (
    SELECT ProductCatalogGroupId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_ProductCatalogGroup
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_ProductDefinition SET Guid = NEWID() WHERE ProductDefinitionId IN (
SELECT ProductDefinitionId FROM (
    SELECT ProductDefinitionId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_ProductDefinition
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_ProductDefinitionField SET Guid = NEWID() WHERE ProductDefinitionFieldId IN (
SELECT ProductDefinitionFieldId FROM (
    SELECT ProductDefinitionFieldId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_ProductDefinitionField
) tmp WHERE RowNumber > 1)
GO
UPDATE uCommerce_ProductPrice SET Guid = NEWID() WHERE ProductPriceId IN (
SELECT ProductPriceId FROM (
    SELECT ProductPriceId, ROW_NUMBER () OVER (PARTITION BY Guid ORDER BY Guid DESC) AS RowNumber from uCommerce_ProductPrice
) tmp WHERE RowNumber > 1)

-- Drop Guid indexes that are not named correctly
GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_Category_Guid' AND object_id = OBJECT_ID('uCommerce_Category')) BEGIN
DROP INDEX [IX_uCommerce_Category_Guid] 
ON [dbo].[uCommerce_Category] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_Currency_Guid' AND object_id = OBJECT_ID('uCommerce_Currency')) BEGIN
DROP INDEX [IX_uCommerce_Currency_Guid] 
ON [dbo].[uCommerce_Currency] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_DataType_Guid' AND object_id = OBJECT_ID('uCommerce_DataType')) BEGIN
DROP INDEX [IX_uCommerce_DataType_Guid] 
ON [dbo].[uCommerce_DataType] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_DataTypeEnum_Guid' AND object_id = OBJECT_ID('uCommerce_DataTypeEnum')) BEGIN
DROP INDEX [IX_uCommerce_DataTypeEnum_Guid] 
ON [dbo].[uCommerce_DataTypeEnum] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_Definition_Guid' AND object_id = OBJECT_ID('uCommerce_Definition')) BEGIN
DROP INDEX [IX_uCommerce_Definition_Guid] 
ON [dbo].[uCommerce_Definition] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_DefinitionField_Guid' AND object_id = OBJECT_ID('uCommerce_DefinitionField')) BEGIN
DROP INDEX [IX_uCommerce_DefinitionField_Guid] 
ON [dbo].[uCommerce_DefinitionField] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_EmailProfile_Guid' AND object_id = OBJECT_ID('uCommerce_EmailProfile')) BEGIN
DROP INDEX [IX_uCommerce_EmailProfile_Guid] 
ON [dbo].[uCommerce_EmailProfile] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_OrderNumberSerie_Guid' AND object_id = OBJECT_ID('uCommerce_OrderNumberSerie')) BEGIN
DROP INDEX [IX_uCommerce_OrderNumberSerie_Guid] 
ON [dbo].[uCommerce_OrderNumberSerie] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_PriceGroup_Guid' AND object_id = OBJECT_ID('uCommerce_PriceGroup')) BEGIN
DROP INDEX [IX_uCommerce_PriceGroup_Guid] 
ON [dbo].[uCommerce_PriceGroup] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_Product_Guid' AND object_id = OBJECT_ID('uCommerce_Product')) BEGIN
DROP INDEX [IX_uCommerce_Product_Guid] 
ON [dbo].[uCommerce_Product] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_ProductCatalog_Guid' AND object_id = OBJECT_ID('uCommerce_ProductCatalog')) BEGIN
DROP INDEX [IX_uCommerce_ProductCatalog_Guid] 
ON [dbo].[uCommerce_ProductCatalog] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_ProductCatalogGroup_Guid' AND object_id = OBJECT_ID('uCommerce_ProductCatalogGroup')) BEGIN
DROP INDEX [IX_uCommerce_ProductCatalogGroup_Guid] 
ON [dbo].[uCommerce_ProductCatalogGroup] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_ProductDefinition_Guid' AND object_id = OBJECT_ID('uCommerce_ProductDefinition')) BEGIN
DROP INDEX [IX_uCommerce_ProductDefinition_Guid] 
ON [dbo].[uCommerce_ProductDefinition] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_ProductDefinitionField_Guid' AND object_id = OBJECT_ID('uCommerce_ProductDefinitionField')) BEGIN
DROP INDEX [IX_uCommerce_ProductDefinitionField_Guid] 
ON [dbo].[uCommerce_ProductDefinitionField] END

GO
IF EXISTS(SELECT * FROM sys.indexes WHERE [name] = 'IX_uCommerce_PurchaseOrder_Guid' AND object_id = OBJECT_ID('uCommerce_PurchaseOrder')) BEGIN
DROP INDEX [IX_uCommerce_PurchaseOrder_Guid] 
ON [dbo].[uCommerce_PurchaseOrder] END


-- Add Guid column to all Ucommerce tables
GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Address' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Address] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Address_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_AdminPage' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_AdminPage] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_AdminPage_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_AdminTab' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_AdminTab] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_AdminTab_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_AmountOffOrderLinesAward' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_AmountOffOrderLinesAward] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_AmountOffOrderLinesAward_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_AmountOffOrderTotalAward' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_AmountOffOrderTotalAward] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_AmountOffOrderTotalAward_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_AmountOffUnitAward' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_AmountOffUnitAward] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_AmountOffUnitAward_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_AppSystemVersion' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_AppSystemVersion] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_AppSystemVersion_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Award' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Award] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Award_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Campaign' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Campaign] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Campaign_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_CampaignItem' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_CampaignItem] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_CampaignItem_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_CampaignItemProperty' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_CampaignItemProperty] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_CampaignItemProperty_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_CategoryDescription' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_CategoryDescription] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_CategoryDescription_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_CategoryProductRelation' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_CategoryProductRelation] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_CategoryProductRelation_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_CategoryProperty' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_CategoryProperty] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_CategoryProperty_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_CategoryTarget' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_CategoryTarget] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_CategoryTarget_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Country' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Country] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Country_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Customer' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Customer] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Customer_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_DataTypeEnumDescription' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_DataTypeEnumDescription] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_DataTypeEnumDescription_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_DefinitionFieldDescription' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_DefinitionFieldDescription] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_DefinitionFieldDescription_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_DefinitionRelation' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_DefinitionRelation] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_DefinitionRelation_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_DefinitionType' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_DefinitionType] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_DefinitionType_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_DefinitionTypeDescription' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_DefinitionTypeDescription] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_DefinitionTypeDescription_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Discount' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Discount] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Discount_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_DiscountSpecificOrderLineAward' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_DiscountSpecificOrderLineAward] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_DiscountSpecificOrderLineAward_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_DynamicOrderPropertyTarget' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_DynamicOrderPropertyTarget] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_DynamicOrderPropertyTarget_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_EmailContent' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_EmailContent] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_EmailContent_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_EmailParameter' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_EmailParameter] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_EmailParameter_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_EmailProfileInformation' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_EmailProfileInformation] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_EmailProfileInformation_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_EmailType' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_EmailType] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_EmailType_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_EmailTypeParameter' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_EmailTypeParameter] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_EmailTypeParameter_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_EntityUi' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_EntityUi] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_EntityUi_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_EntityUiDescription' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_EntityUiDescription] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_EntityUiDescription_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_FreeGiftAward' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_FreeGiftAward] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_FreeGiftAward_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_OrderAddress' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_OrderAddress] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_OrderAddress_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_OrderAmountTarget' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_OrderAmountTarget] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_OrderAmountTarget_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_OrderLine' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_OrderLine] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_OrderLine_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_OrderLineDiscountRelation' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_OrderLineDiscountRelation] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_OrderLineDiscountRelation_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_OrderProperty' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_OrderProperty] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_OrderProperty_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_OrderStatus' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_OrderStatus] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_OrderStatus_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_OrderStatusAudit' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_OrderStatusAudit] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_OrderStatusAudit_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Payment' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Payment] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Payment_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PaymentMethod' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PaymentMethod] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PaymentMethod_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PaymentMethodCountry' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PaymentMethodCountry] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PaymentMethodCountry_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PaymentMethodDescription' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PaymentMethodDescription] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PaymentMethodDescription_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PaymentMethodFee' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PaymentMethodFee] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PaymentMethodFee_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PaymentMethodProperty' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PaymentMethodProperty] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PaymentMethodProperty_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PaymentProperty' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PaymentProperty] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PaymentProperty_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PaymentStatus' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PaymentStatus] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PaymentStatus_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PercentOffOrderLinesAward' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PercentOffOrderLinesAward] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PercentOffOrderLinesAward_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PercentOffOrderTotalAward' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PercentOffOrderTotalAward] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PercentOffOrderTotalAward_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PercentOffShippingTotalAward' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PercentOffShippingTotalAward] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PercentOffShippingTotalAward_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Permission' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Permission] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Permission_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PriceGroupTarget' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PriceGroupTarget] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PriceGroupTarget_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductCatalogDescription' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductCatalogDescription] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductCatalogDescription_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductCatalogGroupCampaignRelation' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductCatalogGroupCampaignRelation] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductCatalogGroupCampaignRelation_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductCatalogGroupPaymentMethodMap' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductCatalogGroupPaymentMethodMap] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductCatalogGroupPaymentMethodMap_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductCatalogGroupShippingMethodMap' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductCatalogGroupShippingMethodMap] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductCatalogGroupShippingMethodMap_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductCatalogGroupTarget' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductCatalogGroupTarget] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductCatalogGroupTarget_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductCatalogPriceGroupRelation' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductCatalogPriceGroupRelation] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductCatalogPriceGroupRelation_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductCatalogTarget' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductCatalogTarget] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductCatalogTarget_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductDefinitionFieldDescription' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductDefinitionFieldDescription] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductDefinitionFieldDescription_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductDefinitionRelation' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductDefinitionRelation] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductDefinitionRelation_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductDescription' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductDescription] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductDescription_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductDescriptionProperty' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductDescriptionProperty] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductDescriptionProperty_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductProperty' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductProperty] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductProperty_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductRelation' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductRelation] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductRelation_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductRelationType' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductRelationType] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductRelationType_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductReview' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductReview] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductReview_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductReviewComment' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductReviewComment] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductReviewComment_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductReviewStatus' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductReviewStatus] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductReviewStatus_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ProductTarget' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ProductTarget] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ProductTarget_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_PurchaseOrder' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_PurchaseOrder] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_PurchaseOrder_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_QuantityTarget' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_QuantityTarget] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_QuantityTarget_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Role' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Role] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Role_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Shipment' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Shipment] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Shipment_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ShipmentDiscountRelation' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ShipmentDiscountRelation] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ShipmentDiscountRelation_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ShippingMethod' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ShippingMethod] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ShippingMethod_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ShippingMethodCountry' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ShippingMethodCountry] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ShippingMethodCountry_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ShippingMethodDescription' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ShippingMethodDescription] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ShippingMethodDescription_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ShippingMethodPaymentMethods' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ShippingMethodPaymentMethods] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ShippingMethodPaymentMethods_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ShippingMethodPrice' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ShippingMethodPrice] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ShippingMethodPrice_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_ShippingMethodsTarget' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_ShippingMethodsTarget] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_ShippingMethodsTarget_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_SystemVersion' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_SystemVersion] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_SystemVersion_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_Target' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_Target] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_Target_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_User' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_User] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_User_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_UserGroup' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_UserGroup] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_UserGroup_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_UserGroupPermission' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_UserGroupPermission] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_UserGroupPermission_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_UserWidgetSetting' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_UserWidgetSetting] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_UserWidgetSetting_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_UserWidgetSettingProperty' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_UserWidgetSettingProperty] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_UserWidgetSettingProperty_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_VoucherCode' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_VoucherCode] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_VoucherCode_Guid] DEFAULT NEWSEQUENTIALID() END

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'uCommerce_VoucherTarget' AND [COLUMN_NAME] = 'Guid') BEGIN
ALTER TABLE [dbo].[uCommerce_VoucherTarget] ADD Guid UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_uCommerce_VoucherTarget_Guid] DEFAULT NEWSEQUENTIALID() END

-- Create unique index on all tables for Guid column
GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Address]') AND [name] = 'UX_uCommerce_Address_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Address_Guid] ON [dbo].[uCommerce_Address] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AdminPage]') AND [name] = 'UX_uCommerce_AdminPage_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_AdminPage_Guid] ON [dbo].[uCommerce_AdminPage] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AdminTab]') AND [name] = 'UX_uCommerce_AdminTab_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_AdminTab_Guid] ON [dbo].[uCommerce_AdminTab] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AmountOffOrderLinesAward]') AND [name] = 'UX_uCommerce_AmountOffOrderLinesAward_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_AmountOffOrderLinesAward_Guid] ON [dbo].[uCommerce_AmountOffOrderLinesAward] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AmountOffOrderTotalAward]') AND [name] = 'UX_uCommerce_AmountOffOrderTotalAward_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_AmountOffOrderTotalAward_Guid] ON [dbo].[uCommerce_AmountOffOrderTotalAward] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AmountOffUnitAward]') AND [name] = 'UX_uCommerce_AmountOffUnitAward_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_AmountOffUnitAward_Guid] ON [dbo].[uCommerce_AmountOffUnitAward] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_AppSystemVersion]') AND [name] = 'UX_uCommerce_AppSystemVersion_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_AppSystemVersion_Guid] ON [dbo].[uCommerce_AppSystemVersion] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Award]') AND [name] = 'UX_uCommerce_Award_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Award_Guid] ON [dbo].[uCommerce_Award] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Campaign]') AND [name] = 'UX_uCommerce_Campaign_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Campaign_Guid] ON [dbo].[uCommerce_Campaign] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItem]') AND [name] = 'UX_uCommerce_CampaignItem_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_CampaignItem_Guid] ON [dbo].[uCommerce_CampaignItem] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CampaignItemProperty]') AND [name] = 'UX_uCommerce_CampaignItemProperty_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_CampaignItemProperty_Guid] ON [dbo].[uCommerce_CampaignItemProperty] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Category]') AND [name] = 'UX_uCommerce_Category_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Category_Guid] ON [dbo].[uCommerce_Category] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryDescription]') AND [name] = 'UX_uCommerce_CategoryDescription_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_CategoryDescription_Guid] ON [dbo].[uCommerce_CategoryDescription] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryProductRelation]') AND [name] = 'UX_uCommerce_CategoryProductRelation_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_CategoryProductRelation_Guid] ON [dbo].[uCommerce_CategoryProductRelation] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryProperty]') AND [name] = 'UX_uCommerce_CategoryProperty_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_CategoryProperty_Guid] ON [dbo].[uCommerce_CategoryProperty] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_CategoryTarget]') AND [name] = 'UX_uCommerce_CategoryTarget_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_CategoryTarget_Guid] ON [dbo].[uCommerce_CategoryTarget] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Country]') AND [name] = 'UX_uCommerce_Country_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Country_Guid] ON [dbo].[uCommerce_Country] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Currency]') AND [name] = 'UX_uCommerce_Currency_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Currency_Guid] ON [dbo].[uCommerce_Currency] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Customer]') AND [name] = 'UX_uCommerce_Customer_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Customer_Guid] ON [dbo].[uCommerce_Customer] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataType]') AND [name] = 'UX_uCommerce_DataType_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_DataType_Guid] ON [dbo].[uCommerce_DataType] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataTypeEnum]') AND [name] = 'UX_uCommerce_DataTypeEnum_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_DataTypeEnum_Guid] ON [dbo].[uCommerce_DataTypeEnum] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DataTypeEnumDescription]') AND [name] = 'UX_uCommerce_DataTypeEnumDescription_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_DataTypeEnumDescription_Guid] ON [dbo].[uCommerce_DataTypeEnumDescription] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Definition]') AND [name] = 'UX_uCommerce_Definition_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Definition_Guid] ON [dbo].[uCommerce_Definition] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionField]') AND [name] = 'UX_uCommerce_DefinitionField_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_DefinitionField_Guid] ON [dbo].[uCommerce_DefinitionField] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionFieldDescription]') AND [name] = 'UX_uCommerce_DefinitionFieldDescription_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_DefinitionFieldDescription_Guid] ON [dbo].[uCommerce_DefinitionFieldDescription] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionRelation]') AND [name] = 'UX_uCommerce_DefinitionRelation_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_DefinitionRelation_Guid] ON [dbo].[uCommerce_DefinitionRelation] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionType]') AND [name] = 'UX_uCommerce_DefinitionType_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_DefinitionType_Guid] ON [dbo].[uCommerce_DefinitionType] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DefinitionTypeDescription]') AND [name] = 'UX_uCommerce_DefinitionTypeDescription_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_DefinitionTypeDescription_Guid] ON [dbo].[uCommerce_DefinitionTypeDescription] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Discount]') AND [name] = 'UX_uCommerce_Discount_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Discount_Guid] ON [dbo].[uCommerce_Discount] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DiscountSpecificOrderLineAward]') AND [name] = 'UX_uCommerce_DiscountSpecificOrderLineAward_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_DiscountSpecificOrderLineAward_Guid] ON [dbo].[uCommerce_DiscountSpecificOrderLineAward] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_DynamicOrderPropertyTarget]') AND [name] = 'UX_uCommerce_DynamicOrderPropertyTarget_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_DynamicOrderPropertyTarget_Guid] ON [dbo].[uCommerce_DynamicOrderPropertyTarget] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailContent]') AND [name] = 'UX_uCommerce_EmailContent_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_EmailContent_Guid] ON [dbo].[uCommerce_EmailContent] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailParameter]') AND [name] = 'UX_uCommerce_EmailParameter_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_EmailParameter_Guid] ON [dbo].[uCommerce_EmailParameter] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailProfile]') AND [name] = 'UX_uCommerce_EmailProfile_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_EmailProfile_Guid] ON [dbo].[uCommerce_EmailProfile] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailProfileInformation]') AND [name] = 'UX_uCommerce_EmailProfileInformation_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_EmailProfileInformation_Guid] ON [dbo].[uCommerce_EmailProfileInformation] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailType]') AND [name] = 'UX_uCommerce_EmailType_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_EmailType_Guid] ON [dbo].[uCommerce_EmailType] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EmailTypeParameter]') AND [name] = 'UX_uCommerce_EmailTypeParameter_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_EmailTypeParameter_Guid] ON [dbo].[uCommerce_EmailTypeParameter] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EntityProperty]') AND [name] = 'UX_uCommerce_EntityProperty_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_EntityProperty_Guid] ON [dbo].[uCommerce_EntityProperty] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EntityUi]') AND [name] = 'UX_uCommerce_EntityUi_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_EntityUi_Guid] ON [dbo].[uCommerce_EntityUi] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_EntityUiDescription]') AND [name] = 'UX_uCommerce_EntityUiDescription_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_EntityUiDescription_Guid] ON [dbo].[uCommerce_EntityUiDescription] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_FreeGiftAward]') AND [name] = 'UX_uCommerce_FreeGiftAward_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_FreeGiftAward_Guid] ON [dbo].[uCommerce_FreeGiftAward] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderAddress]') AND [name] = 'UX_uCommerce_OrderAddress_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_OrderAddress_Guid] ON [dbo].[uCommerce_OrderAddress] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderAmountTarget]') AND [name] = 'UX_uCommerce_OrderAmountTarget_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_OrderAmountTarget_Guid] ON [dbo].[uCommerce_OrderAmountTarget] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderLine]') AND [name] = 'UX_uCommerce_OrderLine_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_OrderLine_Guid] ON [dbo].[uCommerce_OrderLine] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderLineDiscountRelation]') AND [name] = 'UX_uCommerce_OrderLineDiscountRelation_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_OrderLineDiscountRelation_Guid] ON [dbo].[uCommerce_OrderLineDiscountRelation] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderNumberSerie]') AND [name] = 'UX_uCommerce_OrderNumberSerie_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_OrderNumberSerie_Guid] ON [dbo].[uCommerce_OrderNumberSerie] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderProperty]') AND [name] = 'UX_uCommerce_OrderProperty_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_OrderProperty_Guid] ON [dbo].[uCommerce_OrderProperty] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatus]') AND [name] = 'UX_uCommerce_OrderStatus_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_OrderStatus_Guid] ON [dbo].[uCommerce_OrderStatus] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_OrderStatusAudit]') AND [name] = 'UX_uCommerce_OrderStatusAudit_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_OrderStatusAudit_Guid] ON [dbo].[uCommerce_OrderStatusAudit] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Payment]') AND [name] = 'UX_uCommerce_Payment_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Payment_Guid] ON [dbo].[uCommerce_Payment] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethod]') AND [name] = 'UX_uCommerce_PaymentMethod_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PaymentMethod_Guid] ON [dbo].[uCommerce_PaymentMethod] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodCountry]') AND [name] = 'UX_uCommerce_PaymentMethodCountry_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PaymentMethodCountry_Guid] ON [dbo].[uCommerce_PaymentMethodCountry] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodDescription]') AND [name] = 'UX_uCommerce_PaymentMethodDescription_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PaymentMethodDescription_Guid] ON [dbo].[uCommerce_PaymentMethodDescription] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodFee]') AND [name] = 'UX_uCommerce_PaymentMethodFee_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PaymentMethodFee_Guid] ON [dbo].[uCommerce_PaymentMethodFee] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentMethodProperty]') AND [name] = 'UX_uCommerce_PaymentMethodProperty_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PaymentMethodProperty_Guid] ON [dbo].[uCommerce_PaymentMethodProperty] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentProperty]') AND [name] = 'UX_uCommerce_PaymentProperty_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PaymentProperty_Guid] ON [dbo].[uCommerce_PaymentProperty] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PaymentStatus]') AND [name] = 'UX_uCommerce_PaymentStatus_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PaymentStatus_Guid] ON [dbo].[uCommerce_PaymentStatus] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PercentOffOrderLinesAward]') AND [name] = 'UX_uCommerce_PercentOffOrderLinesAward_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PercentOffOrderLinesAward_Guid] ON [dbo].[uCommerce_PercentOffOrderLinesAward] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PercentOffOrderTotalAward]') AND [name] = 'UX_uCommerce_PercentOffOrderTotalAward_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PercentOffOrderTotalAward_Guid] ON [dbo].[uCommerce_PercentOffOrderTotalAward] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PercentOffShippingTotalAward]') AND [name] = 'UX_uCommerce_PercentOffShippingTotalAward_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PercentOffShippingTotalAward_Guid] ON [dbo].[uCommerce_PercentOffShippingTotalAward] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Permission]') AND [name] = 'UX_uCommerce_Permission_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Permission_Guid] ON [dbo].[uCommerce_Permission] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Price]') AND [name] = 'UX_uCommerce_Price_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Price_Guid] ON [dbo].[uCommerce_Price] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PriceGroup]') AND [name] = 'UX_uCommerce_PriceGroup_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PriceGroup_Guid] ON [dbo].[uCommerce_PriceGroup] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PriceGroupTarget]') AND [name] = 'UX_uCommerce_PriceGroupTarget_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PriceGroupTarget_Guid] ON [dbo].[uCommerce_PriceGroupTarget] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Product]') AND [name] = 'UX_uCommerce_Product_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Product_Guid] ON [dbo].[uCommerce_Product] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalog]') AND [name] = 'UX_uCommerce_ProductCatalog_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalog_Guid] ON [dbo].[uCommerce_ProductCatalog] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogDescription]') AND [name] = 'UX_uCommerce_ProductCatalogDescription_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalogDescription_Guid] ON [dbo].[uCommerce_ProductCatalogDescription] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroup]') AND [name] = 'UX_uCommerce_ProductCatalogGroup_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalogGroup_Guid] ON [dbo].[uCommerce_ProductCatalogGroup] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroupCampaignRelation]') AND [name] = 'UX_uCommerce_ProductCatalogGroupCampaignRelation_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalogGroupCampaignRelation_Guid] ON [dbo].[uCommerce_ProductCatalogGroupCampaignRelation] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroupPaymentMethodMap]') AND [name] = 'UX_uCommerce_ProductCatalogGroupPaymentMethodMap_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalogGroupPaymentMethodMap_Guid] ON [dbo].[uCommerce_ProductCatalogGroupPaymentMethodMap] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroupShippingMethodMap]') AND [name] = 'UX_uCommerce_ProductCatalogGroupShippingMethodMap_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalogGroupShippingMethodMap_Guid] ON [dbo].[uCommerce_ProductCatalogGroupShippingMethodMap] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogGroupTarget]') AND [name] = 'UX_uCommerce_ProductCatalogGroupTarget_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalogGroupTarget_Guid] ON [dbo].[uCommerce_ProductCatalogGroupTarget] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogPriceGroupRelation]') AND [name] = 'UX_uCommerce_ProductCatalogPriceGroupRelation_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalogPriceGroupRelation_Guid] ON [dbo].[uCommerce_ProductCatalogPriceGroupRelation] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductCatalogTarget]') AND [name] = 'UX_uCommerce_ProductCatalogTarget_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductCatalogTarget_Guid] ON [dbo].[uCommerce_ProductCatalogTarget] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinition]') AND [name] = 'UX_uCommerce_ProductDefinition_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductDefinition_Guid] ON [dbo].[uCommerce_ProductDefinition] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionField]') AND [name] = 'UX_uCommerce_ProductDefinitionField_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductDefinitionField_Guid] ON [dbo].[uCommerce_ProductDefinitionField] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionFieldDescription]') AND [name] = 'UX_uCommerce_ProductDefinitionFieldDescription_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductDefinitionFieldDescription_Guid] ON [dbo].[uCommerce_ProductDefinitionFieldDescription] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDefinitionRelation]') AND [name] = 'UX_uCommerce_ProductDefinitionRelation_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductDefinitionRelation_Guid] ON [dbo].[uCommerce_ProductDefinitionRelation] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDescription]') AND [name] = 'UX_uCommerce_ProductDescription_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductDescription_Guid] ON [dbo].[uCommerce_ProductDescription] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductDescriptionProperty]') AND [name] = 'UX_uCommerce_ProductDescriptionProperty_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductDescriptionProperty_Guid] ON [dbo].[uCommerce_ProductDescriptionProperty] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductPrice]') AND [name] = 'UX_uCommerce_ProductPrice_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductPrice_Guid] ON [dbo].[uCommerce_ProductPrice] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductProperty]') AND [name] = 'UX_uCommerce_ProductProperty_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductProperty_Guid] ON [dbo].[uCommerce_ProductProperty] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductRelation]') AND [name] = 'UX_uCommerce_ProductRelation_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductRelation_Guid] ON [dbo].[uCommerce_ProductRelation] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductRelationType]') AND [name] = 'UX_uCommerce_ProductRelationType_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductRelationType_Guid] ON [dbo].[uCommerce_ProductRelationType] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReview]') AND [name] = 'UX_uCommerce_ProductReview_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductReview_Guid] ON [dbo].[uCommerce_ProductReview] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReviewComment]') AND [name] = 'UX_uCommerce_ProductReviewComment_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductReviewComment_Guid] ON [dbo].[uCommerce_ProductReviewComment] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductReviewStatus]') AND [name] = 'UX_uCommerce_ProductReviewStatus_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductReviewStatus_Guid] ON [dbo].[uCommerce_ProductReviewStatus] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ProductTarget]') AND [name] = 'UX_uCommerce_ProductTarget_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ProductTarget_Guid] ON [dbo].[uCommerce_ProductTarget] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_PurchaseOrder]') AND [name] = 'UX_uCommerce_PurchaseOrder_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_PurchaseOrder_Guid] ON [dbo].[uCommerce_PurchaseOrder] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_QuantityTarget]') AND [name] = 'UX_uCommerce_QuantityTarget_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_QuantityTarget_Guid] ON [dbo].[uCommerce_QuantityTarget] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Role]') AND [name] = 'UX_uCommerce_Role_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Role_Guid] ON [dbo].[uCommerce_Role] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Shipment]') AND [name] = 'UX_uCommerce_Shipment_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Shipment_Guid] ON [dbo].[uCommerce_Shipment] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShipmentDiscountRelation]') AND [name] = 'UX_uCommerce_ShipmentDiscountRelation_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ShipmentDiscountRelation_Guid] ON [dbo].[uCommerce_ShipmentDiscountRelation] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethod]') AND [name] = 'UX_uCommerce_ShippingMethod_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ShippingMethod_Guid] ON [dbo].[uCommerce_ShippingMethod] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethodCountry]') AND [name] = 'UX_uCommerce_ShippingMethodCountry_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ShippingMethodCountry_Guid] ON [dbo].[uCommerce_ShippingMethodCountry] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethodDescription]') AND [name] = 'UX_uCommerce_ShippingMethodDescription_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ShippingMethodDescription_Guid] ON [dbo].[uCommerce_ShippingMethodDescription] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethodPaymentMethods]') AND [name] = 'UX_uCommerce_ShippingMethodPaymentMethods_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ShippingMethodPaymentMethods_Guid] ON [dbo].[uCommerce_ShippingMethodPaymentMethods] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethodPrice]') AND [name] = 'UX_uCommerce_ShippingMethodPrice_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ShippingMethodPrice_Guid] ON [dbo].[uCommerce_ShippingMethodPrice] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_ShippingMethodsTarget]') AND [name] = 'UX_uCommerce_ShippingMethodsTarget_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_ShippingMethodsTarget_Guid] ON [dbo].[uCommerce_ShippingMethodsTarget] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_SystemVersion]') AND [name] = 'UX_uCommerce_SystemVersion_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_SystemVersion_Guid] ON [dbo].[uCommerce_SystemVersion] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_Target]') AND [name] = 'UX_uCommerce_Target_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_Target_Guid] ON [dbo].[uCommerce_Target] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_User]') AND [name] = 'UX_uCommerce_User_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_User_Guid] ON [dbo].[uCommerce_User] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_UserGroup]') AND [name] = 'UX_uCommerce_UserGroup_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_UserGroup_Guid] ON [dbo].[uCommerce_UserGroup] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_UserGroupPermission]') AND [name] = 'UX_uCommerce_UserGroupPermission_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_UserGroupPermission_Guid] ON [dbo].[uCommerce_UserGroupPermission] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_UserWidgetSetting]') AND [name] = 'UX_uCommerce_UserWidgetSetting_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_UserWidgetSetting_Guid] ON [dbo].[uCommerce_UserWidgetSetting] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_UserWidgetSettingProperty]') AND [name] = 'UX_uCommerce_UserWidgetSettingProperty_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_UserWidgetSettingProperty_Guid] ON [dbo].[uCommerce_UserWidgetSettingProperty] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_VoucherCode]') AND [name] = 'UX_uCommerce_VoucherCode_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_VoucherCode_Guid] ON [dbo].[uCommerce_VoucherCode] (Guid) END

GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[uCommerce_VoucherTarget]') AND [name] = 'UX_uCommerce_VoucherTarget_Guid') BEGIN
CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_VoucherTarget_Guid] ON [dbo].[uCommerce_VoucherTarget] (Guid) END

