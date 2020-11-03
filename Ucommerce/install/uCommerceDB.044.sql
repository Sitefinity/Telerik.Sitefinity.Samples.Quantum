-- Pages where moved this changing the admin page FullName. 
-- Rename to match new structure.
BEGIN TRAN

UPDATE uCommerce_AdminPage 
SET		FullName = 'ASP.umbraco_ucommerce_settings_definitions_editproductdefinition_aspx' 
WHERE	FullName = 'ASP.umbraco_uCommerce_settings_catalog_editproductdefinition_aspx'

UPDATE uCommerce_AdminPage 
SET		FullName = 'ASP.umbraco_ucommerce_settings_definitions_editproductdefinitionfield_aspx' 
WHERE	FullName = 'ASP.umbraco_uCommerce_settings_catalog_editproductdefinitionfield_aspx'

UPDATE uCommerce_AdminPage
SET		FullName = 'ASP.umbraco_ucommerce_settings_definitions_editdatatype_aspx' 
WHERE	FullName = 'ASP.umbraco_uCommerce_settings_catalog_editdatatype_aspx'

UPDATE uCommerce_AdminPage 
SET		FullName = 'ASP.umbraco_ucommerce_settings_definitions_editdatatypeenum_aspx' 
WHERE	FullName = 'ASP.umbraco_uCommerce_settings_catalog_editdatatypeenum_aspx'

UPDATE uCommerce_AdminPage 
SET		FullName = 'ASP.umbraco_ucommerce_settings_definitions_editdefinition_aspx'
WHERE	FullName = 'ASP.umbraco_uCommerce_settings_catalog_editdefinition_aspx'

UPDATE uCommerce_AdminPage 
SET		FullName = 'ASP.umbraco_ucommerce_settings_definitions_editdefinitionfield_aspx' 
WHERE	FullName = 'ASP.umbraco_uCommerce_settings_catalog_editdefinitionfield_aspx'

-- FIX multilingual tab for definition field base properties
UPDATE uCommerce_AdminTab
SET		Multilingual = 0
WHERE	VirtualPath = 'EditDefinitionBaseProperties.ascx'

-- Create new pages for marketing
DECLARE @pageid INT
INSERT INTO uCommerce_AdminPage (FullName) VALUES ('ASP.umbraco_uCommerce_marketing_editcampaign_aspx')
SELECT @pageid = SCOPE_IDENTITY()
INSERT INTO uCommerce_AdminTab (VirtualPath, AdminPageId, SortOrder, MultiLingual, ResouceKey, HasSaveButton, HasDeleteButton, [Enabled])
VALUES ('EditCampaignOverview.ascx', @pageid, 1, 0, 'Common', 1, 0, 1)


INSERT INTO uCommerce_AdminPage (FullName) VALUES ('ASP.umbraco_uCommerce_marketing_editcampaignitem_aspx')
SELECT @pageid = SCOPE_IDENTITY()
INSERT INTO uCommerce_AdminTab (VirtualPath, AdminPageId, SortOrder, MultiLingual, ResouceKey, HasSaveButton, HasDeleteButton, [Enabled])
VALUES ('EditCampaignItemOverview.ascx', @pageid, 1, 0, 'Common', 1, 0, 1)
INSERT INTO uCommerce_AdminTab (VirtualPath, AdminPageId, SortOrder, MultiLingual, ResouceKey, HasSaveButton, HasDeleteButton, [Enabled])
VALUES ('EditCampaignItemAd.ascx', @pageid, 2, 0, 'Ad', 1, 0, 1)
INSERT INTO uCommerce_AdminTab (VirtualPath, AdminPageId, SortOrder, MultiLingual, ResouceKey, HasSaveButton, HasDeleteButton, [Enabled])
VALUES ('EditCampaignItemMultilingualAd.ascx', @pageid, 3, 1, 'Ad', 1, 0, 1)


-- Create new tab for discounts on orders
INSERT INTO uCommerce_AdminTab (VirtualPath, AdminPageId, SortOrder, MultiLingual, ResouceKey, HasSaveButton, HasDeleteButton, [Enabled])
VALUES ('EditOrderDiscounts.ascx', 5, 1, 0, 'Discounts', 1, 0, 1)

COMMIT