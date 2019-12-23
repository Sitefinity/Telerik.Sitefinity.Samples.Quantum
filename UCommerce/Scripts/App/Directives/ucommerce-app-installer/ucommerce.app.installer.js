function ucommerceAppInstaller($compile) {
	return {
		restrict: 'E',
		templateUrl: UCommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-app-installer/InstallApp.html',
		controller: uc_appInstallerController
	};
}