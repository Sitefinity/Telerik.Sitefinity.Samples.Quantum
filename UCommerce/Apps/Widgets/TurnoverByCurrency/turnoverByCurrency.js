function currencySummary() {
    return {
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: {

        },
        templateUrl: UCommerceClientMgr.BaseUCommerceUrl + 'Apps/Widgets/TurnoverByCurrency/TurnoverByCurrency.html',
        controller: currencySummaryController,
        link: function (scope, elm, attrs) {
	        scope.elm = elm;
        }
    };
}

angular.module('ucommerce.directives').directive("currencySummary", currencySummary);