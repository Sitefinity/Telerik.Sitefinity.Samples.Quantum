function currencySummaryController($scope, $http,$timeout) {

	$scope.currencySummary = [];

	$scope.loadSummary = function () {

	    $http.get(UcommerceClientMgr.BaseServiceUrl + '/Widgets/orders/CurrencySummaryToday/all').then(function (response) {

			$scope.currencySummary = response.data;
			
			$timeout(function() {
				$scope.$emit('loaded');
			});

		});
	}

	$scope.findRowHeight = function () {
		return {
			height: (100 / $scope.currencySummary.length) + '%'
		}
	}
	
	$scope.loadSummary();
}

angular.module('ucommerce').controller("currencySummaryController", currencySummaryController);