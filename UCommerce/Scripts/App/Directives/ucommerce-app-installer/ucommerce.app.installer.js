function ucommerceAppInstaller($compile) {
	return {
		restrict: 'E',
		templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-app-installer/InstallApp.html',
		controller: uc_appInstallerController
	};
}