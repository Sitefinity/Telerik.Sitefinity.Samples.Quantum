function orderList() {
	return {
		restrict: 'E',
		transclude: true,
		replace: true,
		scope: true,
		templateUrl: UCommerceClientMgr.BaseUCommerceUrl + 'Apps/Widgets/OrderList/OrderList.html',
		controller: orderListController,
		link: function (scope, elm, attrs) {
			scope.elm = elm;
		}
	};
}

angular.module('ucommerce.directives').directive("orderList", orderList);