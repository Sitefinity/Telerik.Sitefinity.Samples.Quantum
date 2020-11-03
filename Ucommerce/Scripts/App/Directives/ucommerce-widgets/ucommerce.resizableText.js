function ucommerceResizableText($compile) {
	return {
		restrict: 'E',
		transclude: true,
		replace: true,
		scope: {
			text: '=',
		},
		templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-widgets/resizableText.html',
		controller: uc_widgetResizableController,
		link: function (scope, elm, attrs) {
			scope.elm = elm;
		}
	};
}