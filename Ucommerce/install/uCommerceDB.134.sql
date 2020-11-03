CREATE NONCLUSTERED INDEX [IX_uCommerce_CategoryProperty_CategoryId] ON [dbo].[uCommerce_CategoryProperty] (CategoryId) 
include ([CategoryPropertyId], [Value], [DefinitionFieldId], [CultureCode])