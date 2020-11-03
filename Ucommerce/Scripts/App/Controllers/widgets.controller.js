function uc_widgetsController($scope, uCommerceWidgetService, $timeout, $http) {
	$scope.hasAddedHandles = false;
	$scope.hasLoaded = false;
	$scope.grid;
	$scope.widgets = [];
	$scope.availableWidgets = [];
	$scope.editMode = false;
	$scope.lockBackgroundClick = false;
    
	$scope.$on('refresh', function (event, data) {
		$scope.refreshInternal(data, false);
	});

	$scope.refreshInternal = function (data, force) {
		if (data.enableReload || force) {
			var temp = data.view;
			data.view = '';

			$timeout(function () {
				data.view = temp;
			});
		}
	}

	$scope.widgetsNotEmpty = function () {
		return $scope.widgets.length > 0;
	}

	$scope.showEmpty = function () {
		return $scope.widgets.length == 0 && !$scope.editMode;
	}

	$scope.$on('removeWidget', function (event, data) {
		uCommerceWidgetService.removeWidget(data);
		for (n in $scope.widgets) {
			var widget = $scope.widgets[n];
			if (data.userWidgetSettings.userWidgetSettingId == widget.userWidgetSettings.userWidgetSettingId) {
				$scope.widgets.splice(n, 1);
			}
		}
		$scope.grid.remove_widget($('#' + data.userWidgetSettings.userWidgetSettingId));
	});

	$scope.findWidgetFromId = function (id) {
		for (n in $scope.widgets) {
			var widget = $scope.widgets[n];
			if (id == widget.userWidgetSettings.userWidgetSettingId) {
				return $scope.widgets[n];
			}
		}
		return null;
	}

	$scope.notEditMode = function () {
		return !$scope.editMode;
	}

	$scope.toggleEditMode = function () {
		$scope.editMode = !$scope.editMode;

		if ($scope.editMode) {
			$scope.grid.enable();
			$scope.grid.enable_resize();
			$timeout(function () {
				$scope.currentNodeElement.find('.addWidgetToDashboard ul').show();
				$scope.currentNodeElement.find('.addWidgetToDashboard').css('margin-top', ($scope.currentNodeElement.find('.addWidgetToDashboard').height() + 32) * -1);
				$scope.currentNodeElement.find('.addWidgetToDashboard ul').css('opacity', 1);
			});
		} else {
			$scope.grid.disable();
			$scope.grid.disable_resize();
			$scope.currentNodeElement.find('.addWidgetToDashboard ul').hide();
			$scope.currentNodeElement.find('.addWidgetToDashboard').css('margin-top', 0);
			$scope.currentNodeElement.find('.addWidgetToDashboard ul').css('opacity', 0);
			$scope.updateAllWidgets();
			$scope.reloadAllWidgets();
		}
		$scope.$broadcast('toggleEditing', $scope.editMode);

	}

	$scope.reloadAllWidgets = function () {
		$scope.$broadcast('reloading');
		for (n in $scope.widgets) {
			$scope.refreshInternal($scope.widgets[n], true);
		}
	}

	$scope.getClasses = function () {
		if ($scope.editMode) {
			return 'fa fa-check editButton';
		}

		return 'fa fa-pencil editButton';
	}

	$scope.updateAllWidgets = function () {
		var widgetDomElements = $scope.currentNodeElement.find('li.widget');

		widgetDomElements.each(function () {
			$scope.updateWidgetInteral($(this));
		});
	}

	$scope.updateWidgetInteral = function (widgetDomElement) {
		var sizeX = widgetDomElement.attr('data-sizex');
		var sizeY = widgetDomElement.attr('data-sizey');
		var row = widgetDomElement.attr('data-row');
		var col = widgetDomElement.attr('data-col');
		var id = widgetDomElement.attr('id');

		var widgetToUpdate = $scope.findWidgetFromId(id);
		widgetToUpdate.userWidgetSettings.userHeight = sizeY;
		widgetToUpdate.userWidgetSettings.userWidth = sizeX;
		widgetToUpdate.userWidgetSettings.userPositionX = col;
		widgetToUpdate.userWidgetSettings.userPositionY = row;

		uCommerceWidgetService.updateWidget(widgetToUpdate);
	}

	$scope.findWidgetWidth = function () {

		return 100;

		var columns = parseInt($scope.columns);
		var width = $scope.currentNodeElement.width() - 10;
		var marginSize = 20;
		var baseWidth = parseInt(width / (columns));
		var widgetWidth = baseWidth - marginSize;
		return widgetWidth;
	}

	$scope.availableWidgetsClasses = function () {

	}

	$scope.findWidgetHeight = function () {

		return 100;

		var rows = parseInt($scope.rows);
		var height = $('.ucommerce-dashboard').height() - $('.ucommerce-dashboard .editDashBoard').height() - 20;
		//		var marginSize = rows * 10;
		var marginSize = 20;
		var baseHeight = parseInt(height / (rows));
		var widgetHeight = baseHeight - marginSize;
		return widgetHeight;
	}

	$scope.addWidget = function (widget) {
		for (n in $scope.availableWidgets) {
			if ($scope.availableWidgets[n].name == widget.name) {
				$scope.addWidgetInertal($scope.availableWidgets[n]);
			}
		}
	}

	$scope.addWidgetInertal = function (widget) {

		uCommerceWidgetService.addWidget({
			section: $scope.section,
			widgetName: widget.name
		})
		.then(function (data) {

			var propertiesToAdd = [];

			for (n in widget.properties) {
				propertiesToAdd.push({
					key: widget.properties[n].key,
					value: widget.properties[n].value
				});
			}

			var widgetToAdd = {
				name: widget.name,
				view: widget.view,
				editView: widget.editView,
				showLoadingCover: widget.showLoadingCover,
				enableReload: widget.enableReload,
				properties: propertiesToAdd,
				userWidgetSettings: {
					displayName: widget.name,
                    userWidgetSettingId: data.data.UserWidgetSettingId,
					userWidth: widget.defaultWidth,
					userHeight: widget.defaultHeight,
					userPositionX: 1,
					userPositionY: 2
				}
			}

			$scope.widgets.push(widgetToAdd);
			$scope.refreshInternal(widgetToAdd, true);

			$scope.initGridster(true);
			$timeout(function () {
				$scope.$broadcast('toggleEditing', true);
			});
		});
	}

	$scope.findSuitableNumberOfColumns = function () {
		var width = $scope.currentNodeElement.width();
		var columns = Math.floor(width / 120);
		$scope.currentNodeElement.css('width', columns * 120 + 10);
		return columns;
	}

	$scope.getVisibility = function (availableWidget) {
		for (n in $scope.widgets) {
			if ($scope.widgets[n].name == availableWidget.name) {
				return {
					'visibility': 'visible'
				};
			}
		}

		return {
			'visibility': 'hidden'
		};
	}

	$scope.initGridster = function (editMode) {
	    $('body').addClass('ucommerce-dashboard');
		if ($scope.grid) {
			$scope.grid.destroy();
		}

		var columns = $scope.findSuitableNumberOfColumns();

		var widgetWidth = $scope.findWidgetWidth();
		var widgetHeight = $scope.findWidgetHeight();

		setTimeout(function () {
			$scope.grid = $(".gridster ul").gridster(
			{
				widget_margins: [8, 8],
				widget_base_dimensions: [widgetWidth, widgetHeight], //width, height
				resize: {
					enabled: true,
					stop: function (e, ui, widgetDomElement) {
						$scope.$broadcast('widgetsResized');
					}
				},
				draggable: {
					stop: function (event, ui) {
					}
				},
				min_cols: columns,
				max_cols: columns,
				avoid_overlapped_widgets: true,
			}).data('gridster');
			if (!editMode) {
				$scope.grid.disable();
				$scope.grid.disable_resize();
			}
		}, 10);
	}

	$scope.loadWidgets = function () {
		uCommerceWidgetService.loadWidgets($scope.section).then(function (data) {
			for (widget in data) {
				$scope.widgets.push($scope.decorateViewWithBaseUrl(data[widget]));
			}

			$scope.initGridster(false);
		});
	};

	$scope.decorateViewWithBaseUrl = function (widget) {
		widget.view = UcommerceClientMgr.BaseUCommerceUrl + widget.view;

		if (widget.editView != null && widget.editView != '') {
			widget.editView = UcommerceClientMgr.BaseUCommerceUrl + widget.editView;
		}
		return widget;
	}

	$scope.loadAvailableWidgets = function () {
		uCommerceWidgetService.getAllWidgets().then(function (data) {
			for (widget in data) {
				$scope.availableWidgets.push($scope.decorateViewWithBaseUrl(data[widget]));
			}
		});
	};
}

