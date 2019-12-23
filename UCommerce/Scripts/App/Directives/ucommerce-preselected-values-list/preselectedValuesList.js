function ucommercePreselectedValuesList($compile) {
    return {
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: true,
        templateUrl: UCommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-preselected-values-list/view.html',
        controller: uc_preselectedValuesListController,
        link: function (scope, elm, attrs) {
            scope.sortable(elm);
        }
    };
}