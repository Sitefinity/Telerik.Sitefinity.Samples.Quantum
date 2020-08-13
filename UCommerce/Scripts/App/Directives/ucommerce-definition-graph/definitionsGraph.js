function ucommerceDefinitionsGraph($compile) {
    return {
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: {
            type: '&',
            header: '=',
            close: '&',
            timeout: '@',
        },
        templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-definition-graph/view.html',
        controller: uc_definitionsGraphController,
        link: function (scope, elm, attrs) {
        }
    };
}