//// Simple navigation directive, binding to a navigation view.
function ucommerceContentPickerLauncher() {
    return {
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: {
            id: "@"
        },
        templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'scripts/app/directives/ucommerce-content-picker-launcher/ucommerce.content-picker-launcher.html',
        controller: contentPickerLauncherController,
        link: function (scope, elm, attrs) {
            scope.dialogHeaderText = attrs["dialogHeaderText"];
            scope.dialogHeaderTinyText = attrs["dialogHeaderTinyText"];
            scope.saveText = attrs["saveText"];
            scope.saveOrText = attrs["saveOrText"];
            scope.cancelText = attrs["cancelText"];
            scope.hasPreview = attrs["hasPreview"];
	        scope.hasCheckboxFor = attrs["hasCheckboxFor"];
	        scope.inputValueName = attrs["inputValueName"];
            scope.selectButtonText = attrs["selectButtonText"];
            scope.removeButtonText = attrs["removeButtonText"];
            scope.multiSelect = attrs["multiSelect"];
            scope.enforceCheckboxClick = attrs["enforceCheckboxClick"];
            scope.andText = attrs["andText"];
            scope.moreText = attrs["moreText"];

            scope.urlConfiguration = [];

            for (n in attrs.$attr) {
		        scope.urlConfiguration[n] = attrs[n];
	        }

            scope.pictureLoad(attrs["preSelectedValues"], attrs["imageClasses"], elm, attrs["contentPickerType"]);
            scope.currentNodeElement = elm;
        }
    };
}

