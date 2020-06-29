function ucommerceAppsInstalled($compile) {
	return {
		restrict: 'E',
		templateUrl: UCommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-apps-installed/InstalledApps.html',
		controller: uc_appsInstalledController
	};
}