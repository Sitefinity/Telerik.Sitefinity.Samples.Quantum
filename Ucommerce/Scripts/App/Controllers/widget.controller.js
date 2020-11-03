function uc_widgetController($scope, uCommerceWidgetService, $timeout) {

	$scope.loaded = false;
	$scope.editing = false;
    $scope.refreshWidget = function(widget) {
    	$scope.loaded = false;
	    $scope.$emit('refresh', widget);
    }

	$scope.showEdit = function() {
		return !$scope.editing;
	}

	$scope.$on('loaded', function () {
		$timeout(function () {
			$scope.loaded = true;
			$scope.$apply();
		});
	});

	$scope.$on('reloading', function () {
		$timeout(function() {
			$scope.loaded = false;
			$scope.$apply();
		});
	});

	$scope.getEditingClasses = function() {
		if ($scope.editing)
			return 'editMode';

		return '';
	}

	$scope.getEditingStyles = function() {
		if ($scope.editing) return 'disableDropDown';

		return '';
	}

    $scope.calculateFontSize = function() {
        var element = $('#' + $scope.widget.userWidgetSettings.userWidgetSettingId.UserWidgetSettingId);

    	var height = element.height() / 1.3;
    	var width = element.width() / 1.3;

    	var properFontSize = Math.min(height, width) - 20; // Make it a little smaller than the actual size of the container.

        var loadingElement = $('#' + $scope.widget.userWidgetSettings.userWidgetSettingId.UserWidgetSettingId + ' .widgetLoading i');
    	loadingElement.css('font-size', properFontSize);
    	loadingElement.css('margin-top', (properFontSize/2)*-1);
    }

	$scope.removeWidget = function(widget) {
		$scope.$emit('removeWidget', widget);
	}

	$scope.$on('toggleEditing', function(event, data) {
		$scope.editing = data;
	});
 
	$scope.customEditViewDefined = function(widget) {
		return widget.editView != null && widget.editView != '';
	}

	$scope.setOverLayStyles = function() {
        if ($scope.loaded || !$scope.widget.showLoadingCover || $scope.editing) {
            return {
                'display': 'none'
            };
        } else {
        	$scope.calculateFontSize();
        	return {
                'display': 'table'
            };
        }
    };
}

