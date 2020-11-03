UPDATE uCommerce_AdminTab SET SortOrder = 7 WHERE VirtualPath = 'EditProductDescription.ascx'
UPDATE uCommerce_AdminTab SET SortOrder = 6 WHERE VirtualPath = 'EditProductRelations.ascx' 

UPDATE uCommerce_AdminPage SET ActiveTab = 3 WHERE FullName = 'ASP.umbraco_ucommerce_catalog_editcategory_aspx'


INSERT INTO uCommerce_AdminPage (FullName, ActiveTab) VALUES ( 'ASP.umbraco_uCommerce_catalog_searchproduct_aspx', 0);
DECLARE @PageId INT;
SET @PageId = SCOPE_IDENTITY();


INSERT INTO uCommerce_AdminTab 
	(VirtualPath, AdminPageId, SortOrder, MultiLingual, ResouceKey, HasSaveButton, HasDeleteButton, Enabled)
	VALUES
	('SearchProducts.ascx', @PageId, 1, 0, 'Search', 0, 0, 1)