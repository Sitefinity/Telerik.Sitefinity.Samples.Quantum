DECLARE @DataTypeId INT
SET @DataTypeId = (SELECT DataTypeId FROM uCommerce_DataType WHERE [Guid] = '0DD761D4-B1D2-4DBE-AB5A-9ADD2639CF9F')

DECLARE @DefinitionPickerDefinitionId INT
SET @DefinitionPickerDefinitionId = (SELECT DefinitionId from uCommerce_Definition where [Guid] = '37889B09-AC8A-436A-A087-833016ED4A14')

IF NOT EXISTS (SELECT * FROM [uCommerce_DefinitionField] 
                WHERE [Name] = 'Definition Type')
BEGIN
	INSERT INTO [dbo].[uCommerce_DefinitionField] ([DataTypeId], [DefinitionId], [Name], [DisplayOnSite], [Multilingual], [RenderInEditor], [Searchable], [SortOrder], [Deleted], [BuiltIn], [DefaultValue], [Guid])
	VALUES (@DataTypeId, @DefinitionPickerDefinitionId, 'Definition Type', 1, 0, 1, 0, 1, 0, 1, '5', '94220441-758D-46E9-AF89-B6D2C8C2A2C1') 

	DECLARE @DefinitionFieldId INT
	SET @DefinitionFieldId = SCOPE_IDENTITY()

	INSERT INTO [dbo].[uCommerce_DefinitionFieldDescription] ([CultureCode],[DisplayName],[Description],[DefinitionFieldId])
	VALUES ('en-US', 'Definition Type', 'The type of definition which this data type can pick among.', @DefinitionFieldId)
	INSERT INTO [dbo].[uCommerce_DefinitionFieldDescription] ([CultureCode],[DisplayName],[Description],[DefinitionFieldId])
	VALUES ('en-GB', 'Definition Type', 'The type of definition which this data type can pick among.', @DefinitionFieldId)
END