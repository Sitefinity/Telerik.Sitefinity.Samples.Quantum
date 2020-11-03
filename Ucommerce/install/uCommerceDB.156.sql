IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME = 'UX_CategoryProperty_CategoryId_CultureCode_DefinitionFieldId')
BEGIN
	ALTER TABLE [dbo].[uCommerce_CategoryProperty] ADD Constraint UX_CategoryProperty_CategoryId_CultureCode_DefinitionFieldId UNIQUE NONCLUSTERED (CategoryId, CultureCode, DefinitionFieldId)
END