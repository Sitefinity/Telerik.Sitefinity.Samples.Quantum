function ordersCount() {
	return {
		restrict: 'E',
		transclude: true,
		replace: true,
		scope: true,
		templateUrl: UCommerceClientMgr.BaseUCommerceUrl + 'Apps/Widgets/OrdersCount/OrdersCount.html',
		controller: ordersCountController,
		link: function (scope, elm, attrs) {
			scope.elm = elm;
		}
	};
}

angular.module('ucommerce.directives').directive("ordersCount", ordersCount);