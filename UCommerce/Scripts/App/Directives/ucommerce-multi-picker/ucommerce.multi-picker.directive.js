function ucommerceMultiPicker ($compile) {
  return {
    restrict: 'E',
    scope: true,
    templateUrl: UcommerceClientMgr.BaseUCommerceUrl +
      'scripts/app/directives/ucommerce-multi-picker/ucommerce.multi-picker.directive.html',
    replace: false,
    controller: uc_multiPickerController,
    compile: function (tElement, tAttr) {
      var contents = tElement.contents().remove()
      var compiledContents
      return function (scope, iElement, iAttr) {
        scope.loadOnCompile = iAttr['loadOnCompile']
        scope.currentNodeElement = iElement
        if (!scope.contentPickerType) {
          scope.contentPickerType = iAttr['contentPickerType']
        }

        if (!scope.selectedNodeStyle) {
          scope.selectedNodeStyle = iAttr['selectedNodeStyle']
        }

        if (!scope.hasCheckboxFor) {
          scope.hasCheckboxFor = iAttr['hasCheckboxFor']
        }

        scope.hasRightClickMenu = iAttr['hasRightClickMenu']
        scope.multiSelect = iAttr['multiSelect']
        scope.showSelectedNodes = true
        if (iAttr['multiSelect'] == 'false') {
          scope.showSelectedNodes = false
        }

        scope.pickertype = iAttr['pickertype']
        scope.iconFolder = iAttr['iconFolder']

        if (!scope.preSelectedValues) {
          var preselectedVals = iAttr['preSelectedValues']
          if (preselectedVals) {
            scope.preSelectedValues = iAttr['preSelectedValues'].split(',')
          }
                    else if (scope.preSelectedValues == null ||
                        scope.preSelectedValues == '' ||
                        scope.preSelectedValues.length == 0) {
                        scope.preSelectedValues = [];
                    } 
        }

        if (!scope.formName) {
          scope.formName = iAttr['formName']
        }

        if (!compiledContents) {
          compiledContents = $compile(contents)
        }
          compiledContents(scope,
              function(clone, scope) {
                  iElement.append(clone);
              });

          scope.loadPreselectedNodes();
      }
    }
  }
}
