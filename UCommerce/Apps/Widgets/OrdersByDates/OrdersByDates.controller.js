function ordersByDatesController($scope, $http,$timeout) {
	$scope.title = 'Orders placed per day';
	$scope.loadTimeLine = function() {

	    $http.get(UCommerceClientMgr.BaseServiceUrl + '/Widgets/Orders/OrdersByDates/all').then(function (response) {

			var now = new Date();
			var monthAgo = new Date();
			monthAgo.setMonth(now.getMonth() - 1);

			var container = $($scope.elm.find('#ordersByDatesWidget')).get(0);
			var items = response.data;
			var options = {
				style: 'bar',
				barChart: { width: 50, align: 'center' }, // align: left, center, right
				drawPoints: false,
				orientation: 'top',
				autoResize: true,
				height: '100%',
				start: $scope.getPrettyDateTime(monthAgo),
				end: $scope.getPrettyDateTime(now),
				dataAxis: {
					left: {
						range: {
							min: 0
						}
					},
				}
			};

			var graph2d = new vis.Graph2d(container, items, options);
			
			$timeout(function() {
				$scope.$emit('loaded');
			});
		});
	}

	$scope.getPrettyDateTime = function(date) {

		var dd = date.getDate();
		var mm = date.getMonth() + 1; //January is 0!
		var yyyy = date.getFullYear();

		if (dd < 10) {
			dd = '0' + dd;
		}

		if (mm < 10) {
			mm = '0' + mm;
		}

		var now = yyyy + '-' + mm + '-' + dd;
		return now;
	}

	$scope.loadTimeLine();
}

angular.module('ucommerce').controller("ordersByDatesController", ordersByDatesController);