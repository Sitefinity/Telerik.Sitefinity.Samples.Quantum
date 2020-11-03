DECLARE @ShortTextDataType INT
SET @ShortTextDataType = (SELECT DataTypeId FROM uCommerce_DataType WHERE TypeName = 'ShortText')

DECLARE @ComponentPickerDefinitionId INT
SET @ComponentPickerDefinitionId = (SELECT DefinitionId FROM uCommerce_Definition WHERE [Guid] = '96B66456-DB72-435D-9B6F-0D129891B95B')

IF NOT EXISTS (SELECT * FROM [uCommerce_DefinitionField] 
                WHERE [Name] = 'Service')
BEGIN
	INSERT INTO [dbo].[uCommerce_DefinitionField] ([DataTypeId], [DefinitionId], [Name], [DisplayOnSite], [Multilingual], [RenderInEditor], [Searchable], [SortOrder], [Deleted], [BuiltIn], [DefaultValue], [Guid])
	VALUES (@ShortTextDataType, @ComponentPickerDefinitionId, 'Service', 1, 0, 1, 0, 1, 0, 1, '', 'D8199A19-D798-4B5D-B650-54901F12AAE2') 

	DECLARE @ServiceFieldId INT
	SET @ServiceFieldId = SCOPE_IDENTITY()

	INSERT INTO [dbo].[uCommerce_DefinitionFieldDescription] ([CultureCode],[DisplayName],[Description],[DefinitionFieldId])
	VALUES ('en-US', 'Service', 'The type of services which this data type can pick among.', @ServiceFieldId)
	INSERT INTO [dbo].[uCommerce_DefinitionFieldDescription] ([CultureCode],[DisplayName],[Description],[DefinitionFieldId])
	VALUES ('en-GB', 'Service', 'The type of services which this data type can pick among.', @ServiceFieldId)
END