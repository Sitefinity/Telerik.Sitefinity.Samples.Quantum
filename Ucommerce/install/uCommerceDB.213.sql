IF EXISTS (SELECT 1 FROM uCommerce_UserWidgetSetting WHERE WidgetName = 'Catalog search')
BEGIN
  DELETE FROM uCommerce_UserWidgetSetting WHERE WidgetName = 'Catalog search'
END