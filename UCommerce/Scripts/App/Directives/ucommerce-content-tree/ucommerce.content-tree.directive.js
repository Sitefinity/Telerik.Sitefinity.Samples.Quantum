function ucommerceContentTree($compile) {
	return {
		restrict: 'E',
		scope: true,
		templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-content-tree/ucommerce.content-tree.html',
		replace: false,
		controller: contentTreeController,
		compile: function (tElement, tAttr) {
			var contents = tElement.contents().remove();
			var compiledContents;
			return function (scope, iElement, iAttr) {
				scope.loadOnCompile = iAttr["loadOnCompile"];
				scope.currentNodeElement = iElement;
				if (!scope.contentPickerType) {
					scope.contentPickerType = iAttr["contentPickerType"];
				}

				if (!scope.selectedNodeStyle) {
					scope.selectedNodeStyle = iAttr["selectedNodeStyle"];
				}

				if (!scope.hasCheckboxFor) {
				    scope.hasCheckboxFor = iAttr["hasCheckboxFor"];
				}

                if (!scope.enforceCheckboxClick) {
                    scope.enforceCheckboxClick = iAttr["enforceCheckboxClick"];
                }

				scope.hasRightClickMenu = iAttr["hasRightClickMenu"];
				scope.iconFolder = iAttr["iconFolder"];

				if (!scope.preSelectedValues) {
					var preselectedVals = iAttr["preSelectedValues"];
					if (preselectedVals) {
						scope.preSelectedValues = iAttr["preSelectedValues"].split(',');
					}
				}

				scope.formName = iAttr["formName"];
				
				if (!compiledContents) {
					compiledContents = $compile(contents);
				}
				compiledContents(scope, function (clone, scope) {
					iElement.append(clone);
				});
			};
		}
	};
}