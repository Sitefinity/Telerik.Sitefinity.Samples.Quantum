function ucommerceWidgets($compile) {
	return {
		restrict: 'E',
		transclude: true,
		replace: true,
		scope: {
			type: '&',
			header: '=',
			close: '&',
			timeout: '@'
		},
		templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-widgets/widgets.html',
		controller: uc_widgetsController,
		compile: function (tElement, tAttr) {
		    var contents = tElement.contents().remove();
		    var compiledContents;

		    return function (scope, iElement, iAttr) {
		        scope.currentNodeElement = iElement;

		        if (!compiledContents) {
		            compiledContents = $compile(contents);
		        }
		        compiledContents(scope, function (clone, scope) {
		            iElement.append(clone);
		        });

		        scope.section = iAttr['section'];
		        scope.columns = iAttr['columns'];
				if (!scope.columns) {
					scope.columns = 6;
				}
		        scope.rows = iAttr['columns'];
				if (!scope.rows) {
					scope.rows = 6;
				}
		        scope.loadWidgets();
			    scope.loadAvailableWidgets();
		    };
		}
	};
}