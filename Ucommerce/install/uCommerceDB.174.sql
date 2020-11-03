DECLARE @DataTypeDefinitionId INT
SET @DataTypeDefinitionId = (SELECT DefinitionId from uCommerce_Definition where [Guid] = '28877FD4-A790-47A5-9D85-8A08BB8C46FC')

IF NOT EXISTS (SELECT * FROM [uCommerce_DataType] 
                WHERE [TypeName] = 'DefinitionPicker')
BEGIN
	INSERT INTO [dbo].[uCommerce_DataType] ([TypeName], [Nullable], [ValidationExpression], [BuiltIn], [DefinitionName], [Deleted], [Guid], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DefinitionId])
	VALUES ('DefinitionPicker', 0, '', 1, '', 0, '0DD761D4-B1D2-4DBE-AB5A-9ADD2639CF9F', GETDATE(), '', GETDATE(), '', @DataTypeDefinitionId)
END

