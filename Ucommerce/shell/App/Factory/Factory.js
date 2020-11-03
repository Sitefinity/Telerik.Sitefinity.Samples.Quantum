/*
	Responsible for registering all needed components for the angular app in our uCommerce shell. 
	Things should be loaded from here and registered as an individual components. If not. Do so. 
*/
angular.module('ucommerce.resources').factory('localizationResource', localizationResource);
angular.module('ucommerce.resources').factory('marketingResource', marketingResource);
angular.module('ucommerce.resources').factory('settingsResource', settingsResource);
angular.module('ucommerce.resources').factory('catalogResource', catalogResource);

angular.module('ucommerce.resources').factory('treeResource', uc_content_resource);
angular.module('ucommerce.resources').factory('uCommerceContentResource', uc_content_resource);

angular.module('ucommerce.services').factory('treeService', uc_tree_service);
angular.module('ucommerce.services').factory('uCommerceContentService', uc_content_picker_service);

angular.module('ucommerce').controller("NavigationController", navigationController);
angular.module('ucommerce').controller("shellController", shellController);

angular.module('ucommerce.directives').directive("ucommerceSplitter", uc_splitter);
angular.module('ucommerce.directives').directive("rightClick", uc_rightClick);
angular.module('ucommerce.directives').directive("resize", uc_resize);
angular.module('ucommerce.directives').directive("ucommerceNavigation", uc_navigation);
angular.module('ucommerce.directives').directive("ucommerceModalIframe", uc_modal_iframe);
angular.module('ucommerce.directives').directive("ucommerceAlert", uc_alert);
angular.module('ucommerce.directives').directive("ucommerceIframe", uc_Iframe);
angular.module('ucommerce.directives').directive('ucommerceTree', ucommerceTree);
angular.module('ucommerce.directives').directive('ucommerceShell', uc_shell);