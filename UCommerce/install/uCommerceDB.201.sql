UPDATE uCommerce_Role 
SET ProductCatalogGroupId = NULL, ProductCatalogId = NULL, ParentRoleId = NULL
WHERE RoleType = 70 OR RoleType = 80
