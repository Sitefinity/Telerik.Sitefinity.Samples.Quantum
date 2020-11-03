function navigationController($scope, $rootScope, $route, $location, userService, iframeUrlUpdateService, uCommerceContentService, localizationService, treeService) {
	localizationService.getTranslatedStrings('');
	$scope.$on('handleAction', function (event, data) {
		var option = data.option;
		var node = data.node;
		switch (option.optionType) {
			case 'New':
				// Adding temp node before the new node is created.
				var tempNode = { parent: node };
				treeSetSelected(tempNode);

				$location.path(option.actionUrl);
				break;
			case 'Delete':
				deleteItem(node);
				break;
			case 'Sort':
				$location.path(option.actionUrl);
				break;
		}
	});

	$scope.$on('nodeSelected', function (event, data) {
		var node = data;
		if (node.url && node.url != '') {
			$location.path(node.url);
		}
	});

	$scope.updateChildNodes = function(node) {
		$scope.$broadcast('updateChildNodes', node);
	}

	$scope.reloadChildNodes = function(node) {
	}

	function treeSetSelected(node) {
		$scope.$broadcast('treeSetSelected',node);
	}

	function deleteItem(node) {
		var confirmDelete = localizationService.getTranslatedStrings('ConfirmDelete');
		var remove = confirm(confirmDelete);
		if (remove) {
			treeService.deleteItem(node).then(function () {
				angular.element($scope.currentNodeElement.find('#'+node.nodeType+'_'+node.id)).hide('fade', function () {
					node.parent.nodes.splice(node.parent.nodes.indexOf(node), 1);

					if (node.parent.nodes.length < 1)
						node.parent.hasChildren = false;
				});
			});
		}
	}

};

