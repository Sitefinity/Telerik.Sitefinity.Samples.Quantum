function ordersByDates() {
    return {
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: true,
        templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'Apps/Widgets/OrdersByDates/OrdersByDatesView.html',
        controller: ordersByDatesController,
        link: function (scope, elm, attrs) {
	        scope.elm = elm;
        }
    };
}

angular.module('ucommerce.directives').directive("ordersByDates", ordersByDates);