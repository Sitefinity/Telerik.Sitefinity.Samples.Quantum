IF NOT EXISTS (SELECT * FROM sys.columns
  WHERE  object_id = OBJECT_ID(N'[dbo].[uCommerce_ProductCatalogGroup]') 
         AND name = 'DefinitionId'
)
BEGIN
	ALTER TABLE uCommerce_ProductCatalogGroup
    ADD DefinitionId int,
    FOREIGN KEY(DefinitionId) REFERENCES uCommerce_Definition(DefinitionId);
 END

DECLARE @ControlFactoryPicker INT
SET @ControlFactoryPicker = (SELECT DataTypeId FROM uCommerce_DataType WHERE [GUID] = '2125BD48-9F28-48DB-BA8E-05C00575483E')

DECLARE @DataTypeDefinitionId INT
SET @DataTypeDefinitionId = (SELECT DefinitionId FROM uCommerce_Definition WHERE [GUID] = '28877FD4-A790-47A5-9D85-8A08BB8C46FC')

IF NOT EXISTS (SELECT * FROM [uCommerce_DefinitionField] 
                WHERE [Name] = 'Editor')
BEGIN
	INSERT INTO [dbo].[uCommerce_DefinitionField] ([DataTypeId], [DefinitionId], [Name], [DisplayOnSite], [Multilingual], [RenderInEditor], [Searchable], [SortOrder], [Deleted], [BuiltIn], [DefaultValue], [Guid])
	VALUES (@ControlFactoryPicker, @DataTypeDefinitionId, 'Editor', 1, 0, 1, 0, 0, 0, 1, 'ShortText', '9D777EE6-1DCD-4004-876C-D42CC2E7D368') 
END