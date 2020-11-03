BEGIN TRANSACTION MigrateRoles
    BEGIN TRY
        IF ((
                select
                TOP (1)
                COUNT(*) as count
                from uCommerce_Role role
                where RoleType = 70
                group by role.CultureCode
                order by count desc) > 1)
            BEGIN

                -- Migrate Language roles and permissions from store specific to global roles
                select role.RoleID, role.Name, role.ProductCatalogGroupId, role.CultureCode, perm.UserId
                INTO #t
                FROM ucommerce_Role role
                         LEFT JOIN uCommerce_Permission perm ON
                    role.RoleId = perm.RoleId
                where role.RoleType = 70

                select role.RoleID, role.Name, role.ProductCatalogGroupId, role.CultureCode, perm.UserGroupId
                INTO #ugt
                FROM ucommerce_Role role
                         LEFT JOIN uCommerce_UserGroupPermission perm ON
                    role.RoleId = perm.RoleId
                where role.RoleType = 70

/* clean out old stuff */
                DELETE FROM uCommerce_Permission where RoleId in (SELECT RoleID from #t)
                DELETE FROM uCommerce_UserGroupPermission where RoleId in (SELECT RoleID from #ugt)
                DELETE FROM uCommerce_Role where RoleId in (SELECT RoleID from #t)

/* recreate roles */
                INSERT INTO uCommerce_Role (Name, CultureCode, RoleType)
                SELECT DISTINCT t.Name, t.CultureCode, 70 As RoleType
                FROM #t AS t

/* recreate permissions */
                INSERT INTO uCommerce_Permission (UserId, RoleId)
                SELECT DISTINCT t.UserId, role.RoleID
                FROM #t AS t
                         INNER JOIN uCommerce_Role role
                                    ON role.RoleType = 70
                                        AND role.CultureCode = t.CultureCode

                INSERT INTO uCommerce_UserGroupPermission (UserGroupId, RoleId)
                SELECT DISTINCT ugt.UserGroupId, role.RoleID
                FROM #ugt AS ugt
                         INNER JOIN uCommerce_Role role
                                    ON role.RoleType = 70
                                        AND role.CultureCode = ugt.CultureCode

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