-- Change ActiveTab INT to ActiveTab NVARCHAR(256)
ALTER TABLE uCommerce_AdminPage
DROP CONSTRAINT uCommerce_AdminPage_ActiveTab

ALTER TABLE uCommerce_AdminPage DROP COLUMN ActiveTab

ALTER TABLE uCommerce_AdminPage 
ADD ActiveTab NVARCHAR(256) NOT NULL
CONSTRAINT uCommerce_AdminPage_ActiveTab DEFAULT ''


IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA='dbo' AND CONSTRAINT_NAME='uCommerce_FK_ProductCatalogGroup_ProductCatalogGroup' AND TABLE_NAME='uCommerce_ProductCatalogGroup')
BEGIN	
  ALTER TABLE [uCommerce_ProductCatalogGroup]
  DROP CONSTRAINT [uCommerce_FK_ProductCatalogGroup_ProductCatalogGroup]
END