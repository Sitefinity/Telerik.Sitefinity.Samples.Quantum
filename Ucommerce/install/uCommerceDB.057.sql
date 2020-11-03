/*********************************/
/*** Common upgrade Query List for uCommerce 3 ***/
/*********************************/

/* Updates the fullname for uCommerce_AdminPage */
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'umbraco_','')
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'ASP.ucommerce_catalog_','')
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'dialogs_','')
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'ASP.ucommerce_orders_','')
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'ASP.ucommerce_analytics_','')
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'ASP.ucommerce_settings_orders_','')
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'ASP.ucommerce_settings_catalog_','')
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'ASP.ucommerce_settings_definitions_','')
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'ASP.ucommerce_settings_email_','')
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'ASP.ucommerce_marketing_','')
UPDATE uCommerce_AdminPage SET FullName = REPLACE(FullName,'ASP.ucommerce_settings_security_','')

/* Change MediaId into a nvarchar to support Umbraco 5 HiveIds **/
ALTER TABLE uCommerce_Category ALTER COLUMN ImageMediaId nvarchar(100)
ALTER TABLE uCommerce_Product ALTER COLUMN ThumbnailImageMediaId nvarchar(100)
ALTER TABLE uCommerce_Product ALTER COLUMN PrimaryImageMediaId nvarchar(100)

/* Change foreign keys for Umbraco to strings to accommodate HiveIds */
ALTER TABLE uCommerce_ProductCatalogGroup ALTER COLUMN UmbracoDomainId NVARCHAR(255)
ALTER TABLE uCommerce_ProductCatalogGroup ALTER COLUMN UmbracoMemberGroupId NVARCHAR(255)
ALTER TABLE uCommerce_ProductCatalogGroup ALTER COLUMN UmbracoMemberTypeId NVARCHAR(255)
ALTER TABLE uCommerce_Customer ALTER COLUMN UmbracoMemberId NVARCHAR(255)
ALTER TABLE uCommerce_EmailContent ALTER COLUMN ContentId NVARCHAR(255)

/* Remove Umbraco reference from column names */
EXEC sp_rename 'uCommerce_ProductCatalogGroup.UmbracoMemberGroupId', 'MemberGroupId', 'COLUMN'
EXEC sp_rename 'uCommerce_ProductCatalogGroup.UmbracoDomainId', 'DomainId', 'COLUMN'
EXEC sp_rename 'uCommerce_ProductCatalogGroup.UmbracoMemberTypeId', 'MemberTypeId', 'COLUMN'
EXEC sp_rename 'uCommerce_Customer.UmbracoMemberId', 'MemberId', 'COLUMN'