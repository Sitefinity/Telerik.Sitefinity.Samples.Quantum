/*
	Responsible for registering all needed components for the angular app in native uCommerce editors.
	Things should be loaded from here and registered as an individual components. If not. Do so. 
*/

/* Resources */
angular.module('ucommerce.resources').factory('uCommerceDefinitionsResource', uc_definitions_Resource);
angular.module('ucommerce.resources').factory('uCommerceWidgetResource', uc_widgetResource);
angular.module('ucommerce.resources').factory('uCommerceContentResource', uc_content_resource);
angular.module('ucommerce.resources').factory('uCommerceLocalizationResource', uc_localization_resource);

/* Services */
angular.module('ucommerce.services').factory('definitionsService', uc_definitions_service);
angular.module('ucommerce.services').factory('uCommerceWidgetService', uc_widget_service);
angular.module('ucommerce.services').factory('uCommerceWidgetTableService', uc_widget_table_service);
angular.module('ucommerce.services').factory('uCommerceContentService', uc_content_picker_service);
angular.module('ucommerce.services').factory('uCommerceTreeNodeIconService', uc_tree_node_icon_service);
angular.module('ucommerce.services').factory('uCommerceLocalizationService', uc_localization_service);

angular.module('ucommerce').controller("definitionGraphsController", uc_definitionsGraphController);
angular.module('ucommerce').controller("treeController", uc_treeController);
angular.module('ucommerce').controller("contentTreeController", contentTreeController);
angular.module('ucommerce').controller("multiPickerController", uc_multiPickerController);
angular.module('ucommerce').controller("preselectedValuesListController", uc_preselectedValuesListController);
angular.module('ucommerce').controller("widgetController", uc_widgetController);
angular.module('ucommerce').controller("widgetsController", uc_widgetsController);
angular.module('ucommerce').controller("widgetsController", uc_widgetResizableController);
angular.module('ucommerce').controller("appPreviewController", uc_appPreviewController);
angular.module('ucommerce').controller("appInstallerController", uc_appInstallerController);
angular.module('ucommerce').controller("appsInstalledController", uc_appsInstalledController);
angular.module('ucommerce').controller("contentPickerController", contentPickerController);
angular.module('ucommerce').controller("catalogSearchController", uc_catalogSearchController);

angular.module('ucommerce.directives').directive("rightClick", uc_rightClick);
angular.module('ucommerce.directives').directive("ucommerceCatalogSearch", ucommerceCatalogSearch);
angular.module('ucommerce.directives').directive('ucommerceDefinitionsGraph', ucommerceDefinitionsGraph);
angular.module('ucommerce.directives').directive('ucommerceTree', ucommerceTree);
angular.module('ucommerce.directives').directive('ucommerceContentTree', ucommerceContentTree);
angular.module('ucommerce.directives').directive("ucommerceContentPicker", ucommerceContentPicker);
angular.module('ucommerce.directives').directive("ucommerceContentPickerLauncher", ucommerceContentPickerLauncher);
angular.module('ucommerce.directives').directive("ucommerceMultiPicker", ucommerceMultiPicker);
angular.module('ucommerce.directives').directive("ucommercePreselectedValuesList", ucommercePreselectedValuesList);
angular.module('ucommerce.directives').directive("ucommerceWidget", ucommerceWidget);
angular.module('ucommerce.directives').directive("ucommerceWidgets", ucommerceWidgets);
angular.module('ucommerce.directives').directive("ucommerceResizableText", ucommerceResizableText);
angular.module('ucommerce.directives').directive("ucommerceAppInstaller", ucommerceAppInstaller);
angular.module('ucommerce.directives').directive("ucommerceAppPreview", ucommerceAppPreview);
angular.module('ucommerce.directives').directive("ucommerceAppsInstalled", ucommerceAppsInstalled);
