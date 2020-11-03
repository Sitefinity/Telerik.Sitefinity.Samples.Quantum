function ucommerceAppsInstalled($compile) {
	return {
		restrict: 'E',
		templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-apps-installed/InstalledApps.html',
		controller: uc_appsInstalledController
	};
}