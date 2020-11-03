DECLARE @ComponentPickerDefinitionId INT
SET @ComponentPickerDefinitionId = (select DefinitionId from uCommerce_Definition where [Guid] = '96B66456-DB72-435D-9B6F-0D129891B95B')

IF NOT EXISTS (SELECT * FROM [uCommerce_DataType] 
                WHERE [TypeName] = 'ControlFactoryPicker')
BEGIN
	INSERT INTO [dbo].[uCommerce_DataType] ([TypeName], [Nullable], [ValidationExpression], [BuiltIn], [DefinitionName], [Deleted], [Guid], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DefinitionId])
	VALUES ('ControlFactoryPicker', 0, '', 1, '', 0, '2125BD48-9F28-48DB-BA8E-05C00575483E', GETDATE(), '', GETDATE(), '', @ComponentPickerDefinitionId)
END

