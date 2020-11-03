function ucommerceTree($compile) {
	return {
		restrict: 'E',
		scope: {
			tree: '=',
			hasCheckboxFor: '=',
			contentPickerType: '=',
			iconFolder: '=',
			loadOnCompile: '=',
			hasRightClickMenu: '=',
			multiSelect: '=',
			pickertype: '=',
			preSelectedValues: '=',
            enforceCheckboxClick: '=',
			selectedNodeStyle: '=',
			iconFolderOverwrite: '=',
			treeIndetionSize: "="
		},
		templateUrl: UcommerceClientMgr.BaseUCommerceUrl+'scripts/app/directives/ucommerce-tree/ucommerce.tree.html',
		replace: true,
		controller: uc_treeController,
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
			};
		}
	};
}