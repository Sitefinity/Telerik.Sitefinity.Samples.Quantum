angular.module('designer').factory('uCommerceContentResource', uc_content_resource);
angular.module('designer').factory('uCommerceContentService', uc_content_picker_service);
angular.module('designer').factory('uCommerceTreeNodeIconService', uc_tree_node_icon_service);

angular.module('designer').controller("ucPreselectedValuesListController", uc_preselectedValuesListController);
angular.module('designer').controller("treeController", uc_treeController);
angular.module('designer').controller("siteFinityContentTreeController", siteFinityContentTreeController);
angular.module('designer').controller("catalogSearchController", uc_catalogSearchController);
angular.module('designer').controller("multiPickerController", uc_multiPickerController);

angular.module('designer').directive('ucommerceTree', ucommerceTree);
angular.module('designer').directive('ucommerceContentTree', ucommerceContentTree);
angular.module('designer').directive('ucommerceCatalogSearch', ucommerceCatalogSearch);
angular.module('designer').directive('ucommercePreselectedValuesList', ucommercePreselectedValuesList);
angular.module('designer').directive('ucommerceMultiPicker', ucommerceMultiPicker);
