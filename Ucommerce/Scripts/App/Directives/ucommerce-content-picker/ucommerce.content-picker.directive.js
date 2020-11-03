// Simple navigation directive, binding to a navigation view.
function ucommerceContentPicker($compile) {
	return {
		restrict: 'E',
		transclude: true,
		replace: true,
		scope: {
			type: '&',
			header: '=',
			close: '&',
			timeout: '@',
		},
		template:
		        '<div class="imagePicker {{contentPickerType}}">' +
				    '<div class="sectionGroupHeader">' +
					    '<input id="uc-headline" type=text disabled="disabled" class="entityName uc-headline readOnly" value="{{dialogHeaderText}}">' +
					    '<p class="guiDialogTiny">{{dialogHeaderTinyText}}</p>' +
						'<a class="modal-close" onclick="UcommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>' +
				    '</div>' +
				    '<div class="imagePickerContainer propertyPane">' +
					    '<div class="imagePickerContainerBody propertyItem">' +
						    '<div class="contentTree imagePickerContainerTreeContainer propertyItemContent" ng-style="contentStyle()">' +
							    '<ucommerce-tree class="tree" has-checkbox-for="hasCheckboxFor" multi-select="multiSelect" icon-folder="iconFolder" pickertype="hasCheckboxFor" enforce-checkbox-click="enforceCheckboxClick" pre-selected-values="preSelectedValues" content-picker-type="contentPickerType" load-on-compile="true" tree="data"></ucommerce-tree>' +
						    '</div>' +
						    '<div class="imagePickerContainerPreview" data-ng-show="showImagePreview()">' +
							    '<img ng-src="{{imagePreviewUrl}}" class="imagePreview" id="selectedImagePreview" />' +
						    '</div>' +
					    '</div>' +
                        '<div class="preselectedValues multiPicker" ng-show="shouldShowPreSelectedValues()">' +
                            '<ucommerce-preselected-values-list content-picker-type="hasCheckboxFor" icon-folder="iconFolder" pre-selected-values="preSelectedValues"></ucommerce-preselected-values-list>' +
                        '</div>' +
				    '</div>' +
					'<div class="propertyPane dialog-actions">' +
						'<div class="footerOkCancel"><input data-ng-click="SavePicture($event)" type="button" class="dialog-saveButton" value="{{saveText}}" /><em style="margin: 10px;">{{orText}}</em><a data-ng-click="closeContainer($event)" Class="dialog-cancelButton">{{cancelText}}</a></div>' +
					'</div>'+
					'<img ng-src="{{ImageUrl}}" data-ng-show="showImage()" class="{{ImageClasses}}" id="selectedImage"/>' +
		        '</div>',
		controller: contentPickerController,
		compile: function (tElement, tAttr) {
			return {

				pre: function preLink(scope, tElement, tAttr) {

					var contents = tElement.contents().remove();
					var compiledContents;
					var attrs = tAttr;

					if (!compiledContents) {
						compiledContents = $compile(contents);
					}
					compiledContents(scope, function (clone, scope1) {
						tElement.append(clone);
					});

					var contentPickerType = attrs["contentpickertype"];
					scope.contentPickerType = contentPickerType;

					var preview = attrs["haspreview"];
					var dialogHeaderText = attrs["dialogheadertext"];
					var dialogHeaderTinyText = attrs["dialogheadertinytext"];
					var saveText = attrs["savetext"];
					var saveOrText = attrs["saveortext"];
					var cancelText = attrs["canceltext"];

					if (attrs["preselectedvalues"]) {
					    scope.preSelectedValues = attrs["preselectedvalues"];
					} else {
					    scope.preSelectedValues = [];
					}
					scope.selectedNodeStyle = attrs["selectednodestyle"];
					scope.enforceCheckboxClick = attrs["enforcecheckboxclick"];
					scope.multiSelect = attrs["multiselect"];
                    if (scope.multiSelect && scope.multiSelect.toLowerCase() === "true")
					    scope.hasCheckboxFor = attrs["hascheckboxfor"];
					scope.iconFolder = attrs["iconfolder"];
					scope.dialogHeaderTinyText = dialogHeaderTinyText;
					scope.dialogHeaderText = dialogHeaderText;
					scope.saveText = saveText;
					scope.orText = saveOrText;
					scope.cancelText = cancelText;
					scope.hasPreview = preview;
					scope.launcherId = attrs["launcherelementid"];
					scope.currentNodeElement = tElement;

				},

				post: function postLink(scope,elem, attrs)
				{
				    scope.loadPreselectedNodes();
				}
			};
		},

	};
}




