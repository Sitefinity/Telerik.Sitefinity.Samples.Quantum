function ucommerceCatalogSearch($compile) {
    return {
        restrict: 'E',
        scope: {
            hasCheckboxFor: '=',
            contentPickerType: '=',
            loadOnCompile: '=',
            hasRightClickMenu: '=',
            multiSelect: '=',
            pickertype: '=',
            preSelectedValues: '=',
            enforceCheckboxClick: '=',
            selectedNodeStyle: '=',
        },
        templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-catalog-search/ucommerce.catalog.search.html',
        replace: true,
        controller: uc_catalogSearchController,
        compile: function (tElement, tAttr) {
            var contents = tElement.contents().remove();
            var compiledContents;
            return function (scope, iElement, iAttr) {
                scope.currentNodeElement = iElement;

                if (!compiledContents) {
                    compiledContents = $compile(contents);
                }
                compiledContents(scope, function (clone, scope) {
                    iElement.append(clone);
                });
            };
        }
    };
}