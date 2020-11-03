DECLARE @StoreDefinitionId INT
SET @StoreDefinitionId = (SELECT Max([DefinitionTypeId]) FROM [uCommerce_DefinitionType])+1;

IF NOT EXISTS (SELECT * FROM [uCommerce_DefinitionType]
                WHERE [Name] = 'Product Catalog Groups')
BEGIN
	    INSERT INTO [dbo].[uCommerce_DefinitionType] ([DefinitionTypeId], [Name], [Deleted], [SortOrder]) VALUES (@StoreDefinitionId, 'Product Catalog Groups', 0, 2)
END