function uc_treeController($scope, $rootScope, $window, $location, $q, uCommerceContentService, $timeout) {

	if (!$rootScope.treeNodesCollection) {
		$rootScope.treeNodesCollection = [];
	}

    $rootScope.findNode = function(nodeId) {
        var collection = $rootScope.treeNodesCollection;
        var nodeIdentifier = nodeId.split('_');
        for (var n in collection) {
            var tempNode = collection[n];
            if (tempNode.id == nodeIdentifier[1] && tempNode.nodeType == nodeIdentifier[0])
                return tempNode;
        }

        return null;
    }

	$rootScope.reloadNodes = function (keyVal) {

		var collection = $rootScope.treeNodesCollection;

		for (var n in keyVal) {
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

	$scope.$on('toggleSelectedNode', function (event, node) {

		if (!$scope.selectedNodes) {
			$scope.selectedNodes = [];
		}

        for (var n in $scope.selectedNodes) {
			var selectedNode = $scope.selectedNodes[n];
			if (selectedNode.id == node.id && selectedNode.nodeType == node.nodeType) {
				$scope.selectedNodes.splice(n, 1);
				$scope.$broadcast('preSelectedValuesChanged', $scope.selectedNodes);
				return;
			}
		}

		$scope.selectedNodes.push({
			id: node.id,
			name: node.name,
			nodeType: node.nodeType,
			icon: node.icon
		});

		$scope.$broadcast('preSelectedValuesChanged', $scope.selectedNodes);

    });

	$scope.getPaddingStyle = function(node) {

		if ($scope.treeIndetionSize) {
		    var multiplier = $scope.treeIndetionSize;
			// Parent node is the title for speak apps. 
			// Therefore, is it the second node which should indent.
		    // Remarks - padding can't be less than 0px
		    var leftPadding = multiplier * ($scope.getNodeDepth(node) - 1);
		    return {
				'padding-left': (leftPadding)
			}
		}

		return {};
	}
	
	$scope.iconIsIconFont = function(node) {
		if (node == null)
			return false;

		if (node.icon == null)
			return false;

		if (UCommerceClientMgr.Shell === 'Umbraco8' && node.icon.indexOf('icon-') > -1) {
			return true;
		}
		
		return node.icon.indexOf('fa-') > -1;
	}

	$scope.getNodeDepth = function(node) {
		if (node == null || node.parent == null)
			return 0;

		var depth = 0;
		var parent = node.parent;
		while (parent != null) {
			depth++;
			parent = parent.parent;
		}

		return depth;
	}

	$scope.nodeIconClasses = function (icon) {
      if (UCommerceClientMgr.Shell === 'Umbraco7') {
			if (icon === '.sprTreeFolder') {
				icon = 'icon-folder';
			}
			return 'treeNodeIcon icon umb-tree-icon ' + icon;
		} else {
			return 'treeNodeIcon';
		}
	}

	$scope.reloadNodes = function (keyVal) {
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

	$scope.getAllNodes = function () {
		return $rootScope.treeNodesCollection;
	};


	// Note: This way of handling the open/closed state is only here for a POC. A smarter way must be found.
	var closedState = 'treeItemClosed';
	var openState = 'treeItemOpen';
	var hiddenState = 'treeItemHidden';

	// Expose the node functions.
	$scope.toggleChildNodes = toggleChildNodes;
	$scope.reloadChildNodes = reloadChildNodes;
	$scope.updateChildNodes = updateChildNodes;
	$scope.toggleOptions = toggleOptions;
	$scope.hideOptions = hideOptions;
	$scope.handleAction = handleAction;
	$scope.getNodeIconStyle = getNodeIconStyle;
	$scope.treeSetSelected = treeSetSelected;
	$scope.treeNodeOptionMenuStyle = treeNodeOptionMenuStyle;
	$scope.treeNodeLinkClasses = treeNodeLinkClasses;
	$rootScope.openTreeNodes = [];
	$scope.loadContentTree = loadContentTree;
	$scope.itemExpandClasses = itemExpandClasses;
	$scope.removeIfNameIsUndefinded = removeIfNameIsUndefinded;
	$scope.loadContentTree();

	$scope.$watch('tree', function () {
		if ($scope.tree) {
			if ($scope.tree.autoload) {
				toggleChildNodes($scope.tree);
			}
		}
	});

	$scope.getPreSelectedValues = function () {
		return $scope.preSelectedValues;
	};

	$scope.isSelectedCheckbox = function (node) {
		if (node) {
			if ($scope.preSelectedValues) {
				var val = "," + $scope.preSelectedValues + ",";
				return val.indexOf("," + node.id + ",") > -1 && $scope.showCheckBoxForNode(node);
			}
		}
		return false;
	};
    
	$scope.checkboxClicked = function (node) {
		if ($scope.enforceCheckboxClick == 'true') {
			$scope.toggleCheckBoxSelected(node);
		}
	}

	$scope.isSelectedNode = function (node) {
		if ($rootScope.selectedNode == node) {
			return 'selectedChild';
		} else {
			return '';
		}
	}

	$scope.toggleCheckBoxSelected = function (node) {
	    this.$emit('toggleSelectedNode', node);
		var inputField = $scope.currentNodeElement.find('input').first();
		if (inputField.attr('checked') == 'checked') {
			inputField.removeAttr('checked', '');
		} else {
			inputField.attr('checked', 'checked');
		}

		return false;
	};

	$scope.showCheckBoxForNode = function (node) {
	    var showCheckboxForNode = false;
	    if (node) {
			if ($scope.hasCheckboxFor && node.nodeType != null && node.nodeType != '') {
				var checkBoxTypes = $scope.hasCheckboxFor.split(",");
				var nodeTypes = node.nodeType.split(",");

			    nodeTypes.forEach(function(outerElement, outerIndex) {
			        checkBoxTypes.forEach(function(innerElement, index) {
			            if (innerElement.toLowerCase() === outerElement.toLowerCase()) {
			                showCheckboxForNode = true;
			            }
			        });
			    });
			}
		}
        return showCheckboxForNode;
	};

	function loadContentTree() {
		if ($scope.contentPickerType) {
			if (!$scope.tree) {
				uCommerceContentService.getRootNode($scope.contentPickerType).then(function (rootNode) {
					$scope.tree = {
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
				});
			}
		}
	}

	function treeNodeLinkClasses(node) {
		var classes = [];
		if (node !== undefined) {
			if (node.selected) {
				classes.push('nodeSelected');

				if ($scope.selectedNodeStyle !== 'none') {
					classes.push('nodeSelectedStyle');
				}
			}
			if (node.showOptions) {
				classes.push('showingOptions');				
			}

			if (node.dimNode)
				classes.push('dimNode');
		}

		return classes;
	}

	function treeNodeOptionMenuStyle(icon) {
		if (icon) {
			if ($scope.iconIsIconFont({ icon: icon })) {
				return {};
			}
			var backgroundImage = 'url("' + UCommerceClientMgr.BaseUCommerceUrl + 'Images/ui/' + icon + '")';
			return {
				'background-image': backgroundImage
			};
		}
	}

	$scope.$on('treeSetSelected', function (event, data) {
		treeSetSelected(data);
	});

	function treeSetSelected(node) {
	    $timeout(function() {
	        if ($scope.multiSelect && $scope.pickertype) {
	            var nodeTypes = node.nodeType.toLowerCase().split(",");

	            if (nodeTypes.indexOf($scope.pickertype.toLowerCase()) == -1) {
	                return;
	            }

	            if ($scope.multiSelect == "false" && nodeTypes.indexOf($scope.pickertype.toLowerCase()) > 0) {
	                swapSelectedNode(node);
	                $scope.$emit('nodeSelected', node);
	                return;
	            }
	        }

	        if (node && $scope.showCheckBoxForNode(node) && $scope.enforceCheckboxClick != 'true') {
	            $scope.toggleCheckBoxSelected(node);
	        }

	        swapSelectedNode(node);
	        $scope.$emit('nodeSelected', node);
	    });
	}

	function swapSelectedNode(node) {
		var previousNode = $rootScope.selectedNode;
		if (previousNode && previousNode.selected) {
			previousNode.selected = false;
		}
		node.selected = true;
		$rootScope.selectedNode = node;

	}

	function handleAction(option, node) {
		if (option.optionType.toLowerCase() == 'refresh') {
			reloadChildNodes(node);
        }
        if (option.optionType.toLowerCase() == 'export') {
            var http = new XMLHttpRequest();
            var url = '//' + window.location.hostname + option.actionUrl;
            http.open('GET', url, true);
            http.send();
		}
		this.$emit('handleAction',
			{
				node: node,
				option: option
			});
	}

	function getNodeIconStyle(icon, nodeName) {
		if ($scope.iconIsIconFont({ icon: icon })) {
			return {}
		}
		if ($scope.iconFolderOverwrite) {
			return $scope.iconFolderOverwrite + icon;
		}
		if (icon) {
			if (icon.indexOf('~') == 0) {
				var newUrl = icon.replace('~', '');
				return {
					'background-image': 'url("' + newUrl + '")'
				};
			}

			if (UCommerceClientMgr.Shell == 'Sitefinity') {
					if ($scope.iconFolder == 'uCommerce') {
							if (icon.indexOf("/Apps/") > -1) {
									var object = {
											'background-image': 'url("' + UCommerceClientMgr.BaseUCommerceUrl + icon + '")'
									};
									return object;
							} else {
									var object = {
											'background-image': 'url("' + UCommerceClientMgr.BaseUCommerceUrl + 'shell/content/images/ui/' + icon + '")'
									};
									return object;
							}
					} else {
							return {
									'background-image': 'url("' + icon + '")'
							};
					}
			}

			if (UCommerceClientMgr.Shell === 'Sitecore' || UCommerceClientMgr.Shell === 'Kentico') {
			    if ($scope.iconFolder === 'uCommerce') {
					if (icon.indexOf("/Apps/") > -1) {
						var object = {
							'background-image': 'url("' + UCommerceClientMgr.BaseUCommerceUrl + icon + '")'
						};
						return object;
					} else {
						var object = {
						'background-image': 'url("' + UCommerceClientMgr.BaseUCommerceUrl + 'shell/content/images/ui/' + icon + '")'
						};
						return object;
					}
				} else {
					return {
						'background-image': 'url("' + icon + '")'
					};
				}
			}
			if (UCommerceClientMgr.Shell === 'Umbraco7') {
				var lowerCaseIcon = icon.toLowerCase();
				if ($scope.iconFolder === 'uCommerce') {
					return {
						'background-image': 'url("/umbraco/uCommerce/images/ui/' + icon + '")',
						'background-repeat': 'no-repeat',
						'padding-left': '16px'
					};
				}
				if ((lowerCaseIcon.indexOf('.png') !== -1) ||
				(lowerCaseIcon.indexOf('.gif') !== -1) ||
				(lowerCaseIcon.indexOf('.jpg') !== -1)) {
					return {
						'background-image': 'url("/umbraco/images/umbraco/' + icon + '")',
						'background-repeat': 'no-repeat',
						'padding-left': '16px'
					};
				}
			}
			if (UCommerceClientMgr.Shell == 'Umbraco8') {
				return { 'display': "inline", "color": "#1b264f" }; 
			}
			
			if (UCommerceClientMgr.Shell == 'Umbraco') {
				if ($scope.iconFolder == 'uCommerce') {
					return {
						'background-image': 'url("/umbraco/uCommerce/images/ui/' + icon + '")',
						'background-repeat': 'no-repeat',
						'padding-left': '16px'
					};
				}
			}
		}
	}

	function toggleOptions(node, e) {
		$timeout(function(){
			if ($scope.hasRightClickMenu && $scope.hasRightClickMenu.toLowerCase() == 'true' && node.options.length > 0) {
				for (var i = 0; i < $rootScope.openTreeNodes.length; i++) {
					$rootScope.openTreeNodes[i].showOptions = false;
				}
				$rootScope.openTreeNodes = [];
				$rootScope.openTreeNodes.push(node);
				node.showOptions = !node.showOptions;
			}
		});
		if (e) {
			e.preventDefault();
			e.stopPropagation();
		}
	}

	function removeIfNameIsUndefinded(name) {
		if (name === undefined) {
			return { 'display': 'none' };
		}
	}

	function itemExpandClasses(node) {
		if (node) {
			if (node.hasChildren) {
				var toggleState = node.toggleState;
        if (UCommerceClientMgr.Shell === 'Umbraco7') {
					switch (toggleState) {
						case 'treeItemClosed':
							return ['icon-navigation-right'];
						case 'treeItemOpen':
							return ['icon-navigation-down'];
					}
				} else {
					return [toggleState, 'treeItemExpand'];
				}
			} else {
				return "invisible";
			}
		}
	}

	function hideOptions(node) {
		if (node.showOptions)
			node.showOptions = false;
	}

	function loadChildNodes(node) {
		var i = 0;
		var children = uCommerceContentService.getChildren($scope.contentPickerType, node.nodeType, node.id);
		addSpinnerNode(node);
		children.then(
			function (success) { //function called after succesfully calling the function
				// Must clear child nodes to prevent double insertion of elements if network is lagging.
				clearChildNodes(node);
				for (i = 0; i < success.length; i++) {
					addChildNode(success[i], node);
				}
				node.loaded = true;
				node.toggleState = openState;
				if (node.autoload) {
					node.toggleState = hiddenState;
				}
			},
			function (error) { //function called when request ended with an error.
				// Must clear child nodes to prevent double insertion of elements if network is lagging.
				var data = error.data;
				clearChildNodes(node);
				addErrorNodes(data, node);
			}
		);
	}

	$scope.$on('updateChildNodes', function (event, data) {
		updateChildNodes(data);
	});

	function updateChildNodes(node) {
		var newNodes = uCommerceContentService.getChildren($scope.contentPickerType, node.nodeType, node.id);
		newNodes.then(function (newNodeData) {
			if (newNodeData.length != node.nodes.length) {
				// new node created, reloading children instead
				clearChildNodes(node);

				for (var i in newNodeData) {
					addChildNode(newNodeData[i], node);
				}

				treeSetSelected(node.nodes[node.nodes.length - 1]);
				node.hasChildren = true;
				node.loaded = true;
				node.toggleState = openState;
				if (node.autoload) {
					node.toggleState = hiddenState;
				}
			} else {
				// no new nodes, updating node names
				for (var i in newNodeData) {
					var oldNode = node.nodes[i];

					if (oldNode && oldNode.id == newNodeData[i].id)
						oldNode.name = newNodeData[i].name;
				}
			}
		});
	}

	function reloadChildNodes(node) {
		clearChildNodes(node);
		loadChildNodes(node);
	}

	function toggleChildNodes(node, e) {
		if (e) {
			e.stopPropagation();
		}
		if (!node.loaded) {
			loadChildNodes(node);
			node.loaded = true;
			node.toggleState = openState;
		} else {
			clearChildNodes(node);
			node.loaded = false;
			node.toggleState = closedState;
		}

		if (node.autoload) {
			node.toggleState = hiddenState;
		}
	}

	function clearChildNodes(node) {
		if (node.nodes)
			node.nodes.length = 0;
		else
			node.nodes = [];
	}

	// used in Tree to add a node with error message when updating childnodes causes error.
	function addErrorNodes(data, node) {
		node.nodes.push({
			name: 'Error',
			nodeType: 'Error',
			url: 'ucommerce/information/Error.html/',
			nodes: [],
			icon: 'cross.png',
			id: -1,
			description: 'Status ' + data.status + ' ' + data.data.ResponseStatus.ErrorCode + ' ' + data.data.ResponseStatus.Message + ' ' + data.data.ResponseStatus.StackTrace
		});
	}

	// Used in Tree to add placeholder with loading indicator while childnodes are loading.
	function addSpinnerNode(node) {
		var nodeSpinner = UCommerceClientMgr.BaseUCommerceUrl + 'Images/ui/ajax-loader.gif';

		if (UCommerceClientMgr.Shell === 'Umbraco7') {
			if ($scope.iconFolder == 'uCommerce') {
				nodeSpinner = "ajax-loader.gif";

			} else {
				nodeSpinner = 'icon-node-spinner';
			}
		}

		if (UCommerceClientMgr.Shell === 'Umbraco8') {
			if ($scope.iconFolder == 'uCommerce') {
				nodeSpinner = "ajax-loader.gif";

			} else {
				nodeSpinner = 'icon-node-spinner';
			}
		}

		if (UCommerceClientMgr.Shell === 'Umbraco') {
			nodeSpinner = "ajax-loader.gif";
		}

		if (UCommerceClientMgr.Shell === 'Sitecore') {
			if ($scope.iconFolder == 'uCommerce') {
				nodeSpinner = "ajax-loader.gif";
			}
        }

	    if (UCommerceClientMgr.Shell === 'Kentico') {
	        if ($scope.iconFolder == 'uCommerce') {
	            nodeSpinner = "ajax-loader.gif";
            }
        }

        if (UCommerceClientMgr.Shell === "Sitefinity") {
            if ($scope.iconFolder == 'uCommerce') {
                nodeSpinner = "ajax-loader.gif";
            }
        }

		node.nodes.push(
		{
			name: 'loading',
			icon: nodeSpinner,
			nodes: [],
			parent: node,
			id: -1,
		});
	}

	function addChildNode(childData, parentNode) {
		var node = {
			name: childData.name,
			nodeType: childData.nodeType,
			url: childData.url,
			icon: childData.icon,
			id: childData.id,
			parentId: parentNode.id,
			parent: parentNode,
			hasChildren: childData.hasChildren,
			showOptions: false,
			loaded: false,
			selected: false,
			autoload: childData.autoload,
			dimNode: childData.dimNode,
			toggleState: closedState,
			nodes: [],
			options: childData.options
		};
		node.selected = nodeIsSelectedNode(node);
		$rootScope.addNodeToCollection(node);
		parentNode.nodes.push(node);
	}

	function nodeIsSelectedNode(node) {
		if (!$rootScope.selectedNode)
			return false;

		if (($rootScope.selectedNode.nodeType == node.nodeType) && ($rootScope.selectedNode.id == node.id)) {
			$rootScope.selectedNode = node;
			return true;
		}
		return false;
	}
}