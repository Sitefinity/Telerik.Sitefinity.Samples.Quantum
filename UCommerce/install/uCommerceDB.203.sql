BEGIN TRANSACTION MigrateRoles
    BEGIN TRY
        IF ((
                select
                TOP (1)
                COUNT(*) as count
                from uCommerce_Role role
                where RoleType = 80
                group by role.PriceGroupId
                order by count desc) > 1)
            BEGIN

                -- Migrate Language roles and permissions from store specific to global roles
                select role.RoleID, role.Name, role.ProductCatalogGroupId, role.PriceGroupId, perm.UserId
                INTO #t
                FROM ucommerce_Role role
                         LEFT JOIN uCommerce_Permission perm ON
                    role.RoleId = perm.RoleId
                where role.RoleType = 80

                select role.RoleID, role.Name, role.ProductCatalogGroupId, role.PriceGroupId, perm.UserGroupId
                INTO #ugt
                FROM ucommerce_Role role
                         LEFT JOIN uCommerce_UserGroupPermission perm ON
                    role.RoleId = perm.RoleId
                where role.RoleType = 80

                /* clean out old stuff */
                DELETE FROM uCommerce_Permission where RoleId in (SELECT RoleID from #t)
                DELETE FROM uCommerce_UserGroupPermission where RoleId in (SELECT RoleID from #ugt)
                DELETE FROM uCommerce_Role where RoleId in (SELECT RoleID from #t)

                /* recreate roles */
                INSERT INTO uCommerce_Role (Name, PriceGroupId, RoleType)
                SELECT DISTINCT t.Name, t.PriceGroupId, 80 As RoleType
                FROM #t AS t

                /* recreate permissions */
                INSERT INTO uCommerce_Permission (UserId, RoleId)
                SELECT DISTINCT t.UserId, role.RoleID
                FROM #t AS t
                         INNER JOIN uCommerce_Role role
                                    ON role.RoleType = 80
                                        AND role.PriceGroupId = t.PriceGroupId

                INSERT INTO uCommerce_UserGroupPermission (UserGroupId, RoleId)
                SELECT DISTINCT ugt.UserGroupId, role.RoleID
                FROM #ugt AS ugt
                         INNER JOIN uCommerce_Role role
                                    ON role.RoleType = 80
                                        AND role.PriceGroupId = ugt.PriceGroupId

                drop table #t
                drop table #ugt
                COMMIT TRANSACTION MigrateRoles
            END
        ELSE
            BEGIN
                ROLLBACK TRANSACTION MigrateRoles
            END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION MigrateRoles
    end catch

