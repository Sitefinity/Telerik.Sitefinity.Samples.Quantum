BEGIN TRANSACTION DeleteDuplicateRoles
    BEGIN TRY
        IF ((
				-- check if any duplicate roles
                select TOP 1 COUNT(*) as count
                from uCommerce_Role
                group by ProductCatalogGroupId, ProductCatalogId, CultureCode, PriceGroupId, RoleType
				ORDER BY count desc) > 1)
            BEGIN
                -- remove temp tables if they were previously created
                drop table if exists #role
				drop table if exists #permission
				drop table if exists #grouppermission
				
				-- add all roles to temporary table with reference to parents
                select 
				role.RoleId, role.Name, role.ProductCatalogGroupId, role.ProductCatalogID, role.CultureCode, role.PriceGroupId, role.RoleType, null as ParentRoleId, role.Guid,
				parent.ProductCatalogGroupId as paProductCatalogGroupId, parent.ProductCatalogId as paProductCatalogId, parent.CultureCode as paCultureCode, parent.PriceGroupId as paPriceGroupId, parent.RoleType as paRoleType
                INTO #role
				FROM uCommerce_Role role
				LEFT JOIN
				uCommerce_Role parent
				ON role.ParentRoleId = parent.RoleId

				-- delete duplicates from temporary table
				DELETE x FROM (
				SELECT *, rn=row_number() over (partition by ProductCatalogGroupId, ProductCatalogId, CultureCode, PriceGroupId, RoleType order by RoleId)
				FROM #role
				) x
				WHERE rn > 1;

				-- add all permissions to temporary table with reference to roles
				select perm.PermissionId, perm.UserId, perm.Guid,
				role.ProductCatalogGroupId as roleProductCatalogGroupId, role.ProductCatalogId as roleProductCatalogId, role.CultureCode as roleCultureCode, role.PriceGroupId as rolePriceGroupId, role.RoleType as roleRoleType
                INTO #permission
                FROM uCommerce_Permission perm
				LEFT JOIN
				uCommerce_Role role
				ON perm.RoleId = role.RoleId

				-- delete duplicates from temporary table
				DELETE x FROM (
				SELECT *, rn=row_number() over (partition by UserId, roleProductCatalogGroupId, roleProductCatalogId, roleCultureCode, rolePriceGroupId, roleRoleType order by UserId)
				FROM #permission
				) x
				WHERE rn > 1;

				-- add all group permissions to temporary table with reference to roles
				select perm.PermissionId, perm.UserGroupId, perm.Guid,
				role.ProductCatalogGroupId as roleProductCatalogGroupId, role.ProductCatalogId as roleProductCatalogId, role.CultureCode as roleCultureCode, role.PriceGroupId as rolePriceGroupId, role.RoleType as roleRoleType
                INTO #grouppermission
                FROM uCommerce_UserGroupPermission perm
				LEFT JOIN
				ucommerce_Role role
				ON perm.RoleId = role.RoleId

				-- delete duplicates from temporary table
				DELETE x FROM (
				SELECT *, rn=row_number() over (partition by UserGroupId, roleProductCatalogGroupId, roleProductCatalogId, roleCultureCode, rolePriceGroupId, roleRoleType order by UserGroupId)
				FROM #grouppermission
				) x
				WHERE rn > 1;

				-- delete old tables
				DELETE FROM uCommerce_Permission
				DELETE FROM uCommerce_UserGroupPermission
				DELETE FROM uCommerce_Role

				-- insert roles without ParentRoleId
				INSERT INTO uCommerce_Role(Name, ProductCatalogGroupId, ProductCatalogId, CultureCode, PriceGroupId, RoleType, Guid)
				SELECT Name, ProductCatalogGroupId, ProductCatalogId, CultureCode, PriceGroupId, RoleType, Guid
				FROM #role

				-- update ParentRoleId to match
				UPDATE r1
				SET r1.ParentRoleId = r3.RoleId
				FROM uCommerce_Role as r1
				LEFT JOIN
				#role as r2
				ON concat(r1.ProductCatalogGroupId,'+',r1.ProductCatalogId,'+',r1.CultureCode,'+',r1.PriceGroupId,'+',r1.RoleType)
				= concat(r2.ProductCatalogGroupId,'+',r2.ProductCatalogId,'+',r2.CultureCode,'+',r2.PriceGroupId,'+',r2.RoleType)
				LEFT JOIN
				uCommerce_Role as r3
				ON concat(r2.paProductCatalogGroupId,'+',r2.paProductCatalogId,'+',r2.paCultureCode,'+',r2.paPriceGroupId,'+',r2.paRoleType)
				= concat(r3.ProductCatalogGroupId,'+',r3.ProductCatalogId,'+',r3.CultureCode,'+',r3.PriceGroupId,'+',r3.RoleType)

				-- insert permissions with RoleId matching new table
				INSERT INTO uCommerce_Permission(UserId, RoleId, Guid)
				SELECT perm.UserId, role.RoleId, perm.Guid
				FROM #permission perm
				LEFT JOIN
				uCommerce_Role role
				ON concat(perm.roleProductCatalogGroupId,'+',perm.roleProductCatalogId,'+',perm.roleCultureCode,'+',perm.rolePriceGroupId,'+',perm.roleRoleType)
				= concat(role.ProductCatalogGroupId,'+',role.ProductCatalogId,'+',role.CultureCode,'+',role.PriceGroupId,'+',role.RoleType)
				
				-- insert group permissions with RoleId matching new table
				INSERT INTO uCommerce_UserGroupPermission(UserGroupId, RoleId, Guid)
				SELECT perm.UserGroupId, role.RoleId, perm.Guid
				FROM #grouppermission perm
				LEFT JOIN
				uCommerce_Role role
				ON concat(perm.roleProductCatalogGroupId,'+',perm.roleProductCatalogId,'+',perm.roleCultureCode,'+',perm.rolePriceGroupId,'+',perm.roleRoleType)
				= concat(role.ProductCatalogGroupId,'+',role.ProductCatalogId,'+',role.CultureCode,'+',role.PriceGroupId,'+',role.RoleType)

				-- clean up
                drop table #role
				drop table #permission
				drop table #grouppermission
                COMMIT TRANSACTION DeleteDuplicateRoles
            END
        ELSE
            BEGIN
                ROLLBACK TRANSACTION DeleteDuplicateRoles
            END
    END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION DeleteDuplicateRoles
	END CATCH

