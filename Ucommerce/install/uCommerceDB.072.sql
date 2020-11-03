-- Remove Umbraco reference
EXEC sp_rename 'uCommerce_ProductCatalogGroup.CreateCustomersAsUmbracoMembers', 'CreateCustomersAsMembers', 'COLUMN'