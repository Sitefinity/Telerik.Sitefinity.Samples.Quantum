function analyticsDataChartController($scope, $http, $timeout) {
	if (window.gapi == null) {
		(function (w, d, s, g, js, fs) {
			g = w.gapi || (w.gapi = {}); g.analytics = { q: [], ready: function (f) { this.q.push(f); } };
			js = d.createElement(s); fs = d.getElementsByTagName(s)[0];
			js.src = 'https://apis.google.com/js/platform.js';
			fs.parentNode.insertBefore(js, fs); js.onload = function () { g.load('analytics'); };
		}(window, document, 'script'));
	}

	$scope.chartTypes =
	[
		'PIE',
		'LINE',
		'GEO'
	];

	$scope.metrics =
	[
		'ga:sessions',
		'ga:transactions'
	];

	$scope.dimensions =
	[
		'ga:date',
		'ga:operatingSystem',
		'ga:country',
		'ga:region',
		'ga:city'
	];

	$scope.errorDescriptions = [];
	$scope.error = false;
	$scope.setError = function (description) {
		$scope.error = true;
		$scope.errorDescriptions.push(description);
		$timeout(function () {
			$scope.$emit('loaded');
		});
	}

	$scope.findProperty = function (properties, key) {
		for (n in properties) {
			if (properties[n].key === key)
				if (properties[n].value !== "_")
					return properties[n].value;
		}

		return null;
	}

	if (!$scope.findProperty($scope.widget.properties, 'googleAnalyticsKey')) {
		$scope.setError('You need to supply google analytics key in the widget configuration.');
	}

	if (!$scope.findProperty($scope.widget.properties, 'dimensions')) {
		$scope.setError('You need to supply dimensions in the widget configuration.');
	}

	if (!$scope.findProperty($scope.widget.properties, 'metrics')) {
		$scope.setError('You need to supply metrics in the widget configuration.');
	}

	if (!$scope.findProperty($scope.widget.properties, 'chartType')) {
		$scope.setError('You need to supply chartType in the widget configuration.');
	}

	if (!$scope.error) {
		setTimeout(function () {

			try {
				if (!gapi.analytics.auth.isAuthorized()) {
					gapi.analytics.auth.authorize({
						container: 'embed-api-auth-container-' + $scope.widget.userWidgetSettings.userWidgetSettingId,
						clientid: $scope.findProperty($scope.widget.properties, 'googleAnalyticsKey')
					});
				}
			}
			finally {
				setTimeout(function () {
					var viewSelector = new gapi.analytics.ViewSelector({
						container: 'view-selector-container-' + $scope.widget.userWidgetSettings.userWidgetSettingId
					});

					viewSelector.execute();

					var dataChart = new gapi.analytics.googleCharts.DataChart({
						query: {
							metrics: $scope.findProperty($scope.widget.properties, 'metrics'),
							dimensions: $scope.findProperty($scope.widget.properties, 'dimensions'),
							'start-date': '30daysAgo',
							'end-date': 'yesterday'
						},
						chart: {
							container: 'chart-container-' + $scope.widget.userWidgetSettings.userWidgetSettingId,
							type: $scope.findProperty($scope.widget.properties, 'chartType'),
							options: {
								width: '100%',
								height: '100%'
							}
						}
					});

					dataChart.on('success', function (response) {
						$timeout(function () {
							$scope.$emit('loaded');
						});
					});

					dataChart.on('error', function (response) {
						$scope.setError(response.error.message);
					});

					viewSelector.on('change', function (ids) {
						dataChart.set({ query: { ids: ids } }).execute();
					});
				}, 500);
			}
		}, 1000);
	}
}

angular.module('ucommerce').controller("analyticsDataChartController", analyticsDataChartController);