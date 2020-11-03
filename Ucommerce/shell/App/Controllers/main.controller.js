function MainController($scope, $rootScope, $route, $location, $timeout, userService, iframeUrlUpdateService, uCommerceContentService, localizationService) {

    angular.element("#mainframe").load(function () {
        // Hide the background cover when the document is finished loading.
        // This is to avoid massive black background when
        // changing view.
    });

	localizationService.getTranslatedStrings('');
	$scope.user = '';
	
	var authData = userService.isAuthenticated();
	$scope.user = authData.data;

	var closedState = 'treeItemClosed';
	
	var rootData = uCommerceContentService.getRootNode('tree');

	if (!$rootScope.treeNodesCollection) {
		$rootScope.treeNodesCollection = [];
	}

	$scope.hideOptions = function() {
		for (n in $rootScope.openTreeNodes) {
			var node = $rootScope.openTreeNodes[n];
			node.showOptions = false;
		}

		$rootScope.openTreeNodes = [];
	}

	$rootScope.reloadNodes = function (keyVal) {

		var collection = $rootScope.treeNodesCollection;
		
		for (n in keyVal) {
			var id = keyVal[n].id;
			var nodeType = keyVal[n].nodeType;
			var found = false;
			var m = 0;
			while (!found && m < collection.length) {
				if (collection[m].id == id && collection[m].nodeType == nodeType) {
					angular.element('.tree').scope().reloadChildNodes(collection[m]);
					found = true;
				} else {
					m++;
				}
			}
		}
	};

	$scope.reloadNodes = function(keyVal) {
		$rootScope.reloadNodes(keyVal);
	};
	
	$rootScope.addNodeToCollection = function addNodesToCollection(node) {
		var collection = $rootScope.treeNodesCollection;
		var found = false;
		for (var n in collection) {
			var currentNode = collection[n];
			if ((node.id == currentNode.id) && (node.nodeType == currentNode.nodeType)) {
				collection[n] = node;
				found = true;
			}
		}
		
		if (!found) {
			collection.push(node);
		}

		$rootScope.treeNodesCollection = collection;
	};

	$scope.getAllNodes = function() {
		return $rootScope.treeNodesCollection;
	};

	rootData.then(function (rootNode) {

		var node = {
			name: rootNode.name,
			nodeType: rootNode.nodeType,
			url: rootNode.url,
			icon: rootNode.icon,
			id: rootNode.id,
			hasChildren: rootNode.hasChildren,
			showOptions: false,
			loaded: false,
			selected: false,
			autoload: rootNode.autoload,
			toggleState: closedState,
			nodes: [],
			options: rootNode.options
		};
		
		$rootScope.data = node;
		$rootScope.addNodeToCollection(node);
	});

    $scope.findAndSelectNode = function (nodeId) {
	    setTimeout(function () {
	        var node = $rootScope.findNode(nodeId);
	        var ucommerceTreeScope = angular.element('#ucommerceTree').scope();

	        ucommerceTreeScope.$apply(function (scope) {

	            var selectedNode = $rootScope.selectedNode;

	            if (selectedNode) {
	                selectedNode.selected = false;
	            }

	            if (node) {
	                node.selected = true;
	            }

	            $rootScope.selectedNode = node;
	        });
	    }, 1500);

	}

    $scope.updateSelectedNodeText = function (text) {
        var selectedNode = $rootScope.selectedNode;
        var ucommerceTreeScope = angular.element('#ucommerceTree').scope();

        ucommerceTreeScope.$apply(function () {
            selectedNode.name = text;
        });
    };

	// Listen for changes to the route.	
	$scope.$on('$routeChangeSuccess', function () {
		var url = $location.url();

		var broadcastUrl;
		if (url == '/about:blank') {
			broadcastUrl = 'about:blank';
		} else {
			broadcastUrl = constants.baseurl + url;
		}

		// Broadcast the new url.
		// The event causes the iFrame with the 
		// ucommerce-iframe directive to update its source.
		iframeUrlUpdateService.broadcastUrl(broadcastUrl);

        angular.element(".background").show();
	});

	$scope.refreshSelectedNodeParent = function () {
		var selectedNode = $rootScope.selectedNode;
		var ucommerceTreeScope = angular.element('#ucommerceTree').scope();

		if (selectedNode && selectedNode.parent) {
			ucommerceTreeScope.$apply(function (scope) {
				scope.reloadChildNodes(selectedNode.parent, true);
			});
		}
	};

	$scope.updateSelectedNodeSiblings = function () {
	    var selectedNode = $rootScope.selectedNode;
	    var ucommerceTreeScope = angular.element('#ucommerceTree').scope();
		if (selectedNode) {
			if (selectedNode.parent) {
				ucommerceTreeScope.$apply(function(scope) {
					scope.updateChildNodes(selectedNode.parent);
				});
			}
		}
	};
    
	$scope.updateSelectedNodeChildren = function () {
		var selectedNode = $rootScope.selectedNode;
		var ucommerceTreeScope = angular.element('#ucommerceTree').scope();
		if (selectedNode) {
		    ucommerceTreeScope.$apply(function (scope) {
				scope.updateChildNodes(selectedNode);
			});
		}
	};

	$scope.getCurrentNodeId = function () {
		return $rootScope.selectedNode.nodeType + '_' + $rootScope.selectedNode.id;
	};

	$scope.getErrorDescription = function() {
		return $rootScope.selectedNode.description;
	};
}

window.redirectToUrl = function (url) {
	var frame = angular.element('#mainframe');

	frame.scope().$apply(function (scope) {
		scope.setUrl(url);
	});
};

window.updateSelectedNodeChildren = function() {
    angular.element('#MainControllerContainer').scope().updateSelectedNodeChildren();
};

window.updateSelectedNodeSiblings = function () {
    angular.element('#MainControllerContainer').scope().updateSelectedNodeSiblings();
};

window.getErrorDescription = function() {
	return angular.element('#MainControllerContainer').scope().getErrorDescription();
};

window.refreshSelectedNodeParent = function () {
	angular.element("#MainControllerContainer").scope().refreshSelectedNodeParent();
};

window.updateSelectedNodeText = function (text) {
	angular.element("#MainControllerContainer").scope().updateSelectedNodeText(text);
};

window.getCurrentNodeId = function () {
	return angular.element("#MainControllerContainer").scope().getCurrentNodeId();
};

window.bringShellToFront = function () {
    if (parent.scWin) {
        parent.scWin.getManager().bringToFront(parent.name);
    }
};

window.findAndSelectNode = function(nodeId) {
    angular.element("#MainControllerContainer").scope().findAndSelectNode(nodeId);
}

window.reloadNodes = function(keyVal) {
	angular.element("#MainControllerContainer").scope().reloadNodes(keyVal);
};

window.getAllNodes = function() {
	return angular.element("#MainControllerContainer").scope().getAllNodes();
};

angular.element('#ucommerceMainPageBody').click(function () { window.bringShellToFront(); });

//register it
angular.module('ucommerce').controller("MainController", MainController);

