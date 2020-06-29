function ucommerceWidget($compile) {
    return {
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: {
            widget: '='
        },
        templateUrl: UCommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-widgets/widget.html',
        controller: uc_widgetController,
        link: function (scope, elm, attrs) {
	        scope.elm = elm;
        }
    };
}