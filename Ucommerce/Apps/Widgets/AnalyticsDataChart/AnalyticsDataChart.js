function analyticsDataChart() {
	return {
		restrict: 'E',
		transclude: true,
		replace: true,
		scope: true,
		templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'Apps/Widgets/analyticsDataChart/analyticsDataChart.html',
		controller: analyticsDataChartController,
		link: function (scope, elm, attrs) {
			scope.elm = elm;
		}
	};
}

angular.module('ucommerce.directives').directive("analyticsDataChart", analyticsDataChart);