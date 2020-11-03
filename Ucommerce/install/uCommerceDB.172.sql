DECLARE @DefinitionPickerDefinitionId INT
SET @DefinitionPickerDefinitionId = (SELECT DefinitionId FROM uCommerce_Definition where [GUID] = '37889B09-AC8A-436A-A087-833016ED4A14')

IF NOT EXISTS (SELECT * FROM [uCommerce_DataType] 
                WHERE [TypeName] = 'DataTypeDefinitionPicker')
BEGIN
	INSERT INTO [dbo].[uCommerce_DataType] ([TypeName], [Nullable], [ValidationExpression], [BuiltIn], [DefinitionName], [Deleted], [Guid], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DefinitionId])
	VALUES ('DataTypeDefinitionPicker', 0, '', 1, '', 0, '07C32617-25C2-465A-A9E2-D94B9F6B5C80', GETDATE(), '', GETDATE(), '', @DefinitionPickerDefinitionId)
END