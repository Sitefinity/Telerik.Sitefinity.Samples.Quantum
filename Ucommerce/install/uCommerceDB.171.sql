DECLARE @EditorFieldId INT
SET @EditorFieldId = (SELECT DefinitionFieldId from uCommerce_DefinitionField where [GUID] = '9D777EE6-1DCD-4004-876C-D42CC2E7D368')

IF NOT EXISTS (SELECT * FROM [uCommerce_DefinitionFieldDescription]
                WHERE [DefinitionFieldId] = @EditorFieldId )
BEGIN
	INSERT INTO [dbo].[uCommerce_DefinitionFieldDescription] ([CultureCode],[DisplayName],[Description],[DefinitionFieldId])
	VALUES ('en-US', 'Editor', 'Points at the control factory for this data type.', @EditorFieldId)
	INSERT INTO [dbo].[uCommerce_DefinitionFieldDescription] ([CultureCode],[DisplayName],[Description],[DefinitionFieldId])
	VALUES ('en-GB', 'Editor', 'Points at the control factory for this data type.', @EditorFieldId)
END
