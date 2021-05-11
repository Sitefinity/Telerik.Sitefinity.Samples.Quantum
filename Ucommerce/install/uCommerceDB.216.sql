BEGIN
	DROP INDEX IF EXISTS [UX_uCommerce_Role_ProductCatalogId_CultureCode_PriceGroupId_RoleType] ON [uCommerce_Role]
	CREATE UNIQUE INDEX [UX_uCommerce_Role_ProductCatalogId_CultureCode_PriceGroupId_RoleType]
    ON uCommerce_Role 
        ([ProductCatalogGroupId]
        ,[ProductCatalogId]
        ,[CultureCode]
        ,[PriceGroupId]
        ,[RoleType]);

    DROP INDEX IF EXISTS [UX_uCommerce_UserGroupPermission_UserGroupId_RoleId] ON [uCommerce_UserGroupPermission]
    CREATE UNIQUE NONCLUSTERED INDEX [UX_uCommerce_UserGroupPermission_UserGroupId_RoleId]
    ON [dbo].[uCommerce_UserGroupPermission]
        ([UserGroupId] ASC
        , [RoleId] ASC);
END
