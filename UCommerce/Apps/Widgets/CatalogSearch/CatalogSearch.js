function catalogSearch() {
    return {
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: true,
        templateUrl: UCommerceClientMgr.BaseUCommerceUrl + 'Apps/Widgets/CatalogSearch/CatalogSearch.html',
        controller: catalogSearchController,
        link: function (scope, elm, attrs) {
        	scope.elm = elm;

	        scope.loadInitially();
        }
    };
}

angular.module('ucommerce.directives').directive("catalogSearch", catalogSearch);