function uc_appsInstalledController($scope, $http, $rootScope, uCommerceLocalizationService, $location,$timeout) {
	$scope.previewMode = false;
	$scope.uninstalling = false;

	var initializeLocalizationt = uCommerceLocalizationService.initializeLocalizationService('Admin');
	initializeLocalizationt.then(function (data) {
		$scope.installAppHeader = uCommerceLocalizationService.getTranslatedStrings('Admin', 'InstallAppHeader');
		$scope.uninstallButtonText = uCommerceLocalizationService.getTranslatedStrings('Admin', 'UninstallButton');
		$scope.noInstalledAppsText = uCommerceLocalizationService.getTranslatedStrings('Admin', 'NoInstalledApps');
		$scope.redirectToAppsStoreText = uCommerceLocalizationService.getTranslatedStrings('Admin', 'RedirectToAppsStore');
	});

	$http.get(UcommerceClientMgr.BaseServiceUrl + '/Apps/installedapps').then(function (response) {
		$scope.manifests = response.data;
	});

	$scope.previewManifest = function (manifest) {
		$scope.previewMode = true;
		$rootScope.$broadcast("appManifest", manifest);
		addPageToBrowserHistory();
	}

	$scope.$on("uninstallApp", function(event, subject) {
	    var serviceUrl = UcommerceClientMgr.BaseServiceUrl + '/Apps/uninstallapp';
		$scope.uninstalling = true;

		var result = $http.post(
			serviceUrl,
			{ AppName: subject },
			{
				dataType: "application/json"
			}
		);

		result.then(function (response) {
			$scope.loadingText = uCommerceLocalizationService.getTranslatedStrings('Admin', 'LoadingText');
			window.setTimeout(function () {//Making the experiance in IE better for the user. 
				top.location.reload();
			}, 2000);
		});
	});

	var addPageToBrowserHistory = function () {
		var stateObj = { foo: "bar" };
		history.pushState(stateObj, "page 2", $location.absUrl());
	}

	window.addEventListener('popstate', function (event) {
		$timeout(function() {
			$scope.previewMode = !$scope.previewMode;
		});
	});
}
