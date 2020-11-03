// Simple navigation directive, binding to a navigation view.
var uc_navigation = function($compile) {
	return {
		restrict: "E",
		replace: true,
		scope: true,
		templateUrl: 'App/Directives/navigation/ucommerce-navigation.html',
		controller: navigationController,
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

				scope.hasRightClickMenu = iAttr["hasRightClickMenu"];
				scope.hasCheckboxFor = iAttr["hasCheckboxFor"];
				scope.iconFolder = iAttr["iconFolder"];
				scope.iconFolderOverwrite = iAttr["iconFolderOverwrite"];
				var preselectedVals = iAttr["preSelectedValues"];
				if (preselectedVals) {
					scope.preSelectedValues = iAttr["preSelectedValues"].split(',');

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

