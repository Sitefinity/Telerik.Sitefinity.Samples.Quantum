function ucommerceAppPreview($compile) {
	return {
		restrict: 'E',
		scope: {
			actionText: '=actiontext',
			actionListener: '=actionlistener'
		},
		templateUrl: UCommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-app-preview/PreviewApp.html',
		controller: uc_appPreviewController
	};
}