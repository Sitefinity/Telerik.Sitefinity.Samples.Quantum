function currencySummary() {
    return {
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: {

        },
        templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'Apps/Widgets/TurnoverByCurrency/TurnoverByCurrency.html',
        controller: currencySummaryController,
        link: function (scope, elm, attrs) {
	        scope.elm = elm;
        }
    };
}

angular.module('ucommerce.directives').directive("currencySummary", currencySummary);