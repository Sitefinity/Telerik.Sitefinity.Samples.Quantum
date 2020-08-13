var uc_definitionsGraphController = function($scope, definitionsService) {

    $scope.network = null;
    $scope.definitionGraph = {};
    $scope.selectedNode;
    $scope.selectedNodeInheritedFields;
    $scope.colouredNodes;
    $scope.id = /id=(.+)&?/g.exec(window.location.search);
    $scope.id = ($scope.id == null) ? null : $scope.id[1];

    $scope.getVisibility = function() {
        return ($scope.selectedNode != null);
    };

    $scope.handleSelectedEdge = function(id) {
        $scope.selectedNode = null;
        $scope.selectedNodeInheritedFields = null;
        $scope.$apply();
    };

    $scope.findEdgesForNode = function(node) {
        var edgesToReturn = [];
        for (n in $scope.definitionGraph.edges) {
            var edge = $scope.definitionGraph.edges[n];
            if (edge.to == node.id)
                edgesToReturn.push(edge);
        }

        return edgesToReturn;
    };

    $scope.findParentNodesForEdges = function(edges) {
        var nodesToReturn = [];
        for (n in edges) {
            var id = edges[n].from;
            var potentialNode = $scope.getNodeFromId(id);
            if (potentialNode != null)
                nodesToReturn.push(potentialNode);
        }

        return nodesToReturn;
    };

    $scope.getNodeFromId = function(id) {
        for (n in $scope.definitionGraph.nodes) {
            var node = $scope.definitionGraph.nodes[n];
            if (id == node.id) {
                return node;
            }
        }
        return null;
    };

    $scope.getInheritedFieldsFor = function (node) {
        var fields = [];
        var firstEdges = $scope.findEdgesForNode(node);
        var parentsForEdges = $scope.findParentNodesForEdges(firstEdges);

        for (n in parentsForEdges) {
            var parentNode = parentsForEdges[n];
            var parentFields = $scope.getFieldsFor(parentNode);
            for (i in parentFields) {
                fields.push(parentFields[i]);
            }
            var grandParentFields = $scope.getInheritedFieldsFor(parentNode);
            for (x in grandParentFields) {
                fields.push(grandParentFields[x]);
            }
        }

        return fields;
    };

    $scope.getParentsForNodeId = function(id) {
       var source = $scope.getNodeFromId(id);
       var firstEdges = $scope.findEdgesForNode(source);
       return $scope.findParentNodesForEdges(firstEdges);
    };

    $scope.ancestorOrSelfAllreadyColoured = function (self) {
        for (n in $scope.colouredNodes) {
            if (self.id == $scope.colouredNodes[n].id)
                return true;
        }

        $scope.colouredNodes.push(self);

        var parents = $scope.getParentsForNodeId(self.id);

        for (n in parents) {
            if ($scope.ancestorOrSelfAllreadyColoured(parents[n])) {
                return true;
            }
        }

        for (n in $scope.colouredNodes) {
            if (self.id == $scope.colouredNodes[n].id)
                $scope.colouredNodes.splice(2, 1);
        }

        return false;
    };

    $scope.causesCyclicReference = function (data) {

        $scope.colouredNodes = [];
        var target = $scope.getNodeFromId(data.to);
        var parentsForNodes = $scope.getParentsForNodeId(data.from);
        $scope.colouredNodes.push(target);
        for (n in parentsForNodes) {
            var parent = parentsForNodes[n];
            if ($scope.ancestorOrSelfAllreadyColoured(parent)) {
                return true;
            }
        }

        return false;
    };

    $scope.getSelectionClasses = function() {
        if ($scope.selectedNode != null)
            return 'nodeSelected';
        return '';
    };

    $scope.getFieldsFor = function(node) {
        var name = node.label;
        var fields = [];
        for (n in node.fields) {
            fields.push(node.fields[n] + ' (' + name + ')');
        }
        return fields;
    };

    $scope.handleSelectedNode = function(id) {
        var node = $scope.getNodeFromId(id);
        $scope.selectedNode = node;
        $scope.selectedNodeInheritedFields = $scope.getInheritedFieldsFor(node);
        $scope.$apply();
    };
    
    $scope.handleEmptySelection = function() {
        $scope.selectedNode = null;
        $scope.selectedNodeInheritedFields = null;
        $scope.$apply();
    };

    $scope.edgeAlreadyExists = function(data) {
        for (n in $scope.definitionGraph.edges) {
            var existingEdge = $scope.definitionGraph.edges[n];
            if (data.to == existingEdge.to && data.from == existingEdge.from)
                return true;
        }
        return false;
    };

    $scope.addEdge = function(from, to) {
        $scope.definitionGraph.edges.push({
            id: '0',
            from: from,
            to: to
        });
    };

    $scope.removeEdge = function(from, to) {
        for (n in $scope.definitionGraph.edges) {
            var edge = $scope.definitionGraph.edges[n];
            if (edge.from == from && edge.to == to) {
                $scope.definitionGraph.edges.splice(n, 1);
                return;
            }
        }
    };

    $scope.isReferenceToSelf = function(data) {
        return data.from == data.to;
    };

    $scope.handleSelection = function(params) {
        var nodeId = params.nodes;
        var edgeId = params.edges;
        if (nodeId != '') {
            $scope.handleSelectedNode(nodeId);
        }
        else if (edgeId != '') {
            $scope.handleSelectedEdge(edgeId);
        } else {
            $scope.handleEmptySelection();
        }
    };

    definitionsService.getDefinitionGraph($scope.id).then(function (data) {
        $scope.definitionGraph = data;
        window.setTimeout(function () {
            $scope.drawGraph();
        }, 500);
    });

    $scope.drawGraph = function() {
            // create a network
            var container = document.getElementById('container');
            var data = {
                nodes: $scope.definitionGraph.nodes,
                edges: $scope.definitionGraph.edges
            };
            var options = {
                stabilize: false,
                width: '100%',
                height: '100%',
                hierarchicalLayout: {
                	direction: "UD"
            	                },
                dataManipulation: {
                    enabled: false,
                    initiallyVisible: false
                },
                edges: {                   
                    style: 'arrow'
                },
                nodes: {
                    shape: 'box',
                },
                onAdd: function (data, callback) {
                    console.log(data);
                    callback(data);
                },
                onEdit: function (data, callback) {
                    console.log(data);
                    callback(data);
                },
                onDelete: function(data, callback) {
					for (n in $scope.network.edges) {
						var edge = $scope.network.edges[n];
						if (edge.id == data.edges) {
							$scope.removeEdge(edge.fromId, edge.toId);
						}
					}
					callback(data);
                },
                onConnect: function (data, callback) {
                    if ($scope.isReferenceToSelf(data)) {
                    	UcommerceClientMgr.showSpeechBubble('error', 'Illegal operation', 'You cannot add a reference to self');
                    }
                    else if ($scope.causesCyclicReference(data)) {
                    	UcommerceClientMgr.showSpeechBubble('error', 'Illegal operation', 'Adding a reference to : "' + $scope.getNodeFromId(data.to).label + '" would cause a cyclic reference.');
                    }
                    else if ($scope.edgeAlreadyExists(data)) {
                    	UcommerceClientMgr.showSpeechBubble('error', 'Illegal operation', 'Reference to : "' + $scope.getNodeFromId(data.to).label + '" from "' + $scope.getNodeFromId(data.from).label + '" already exists.');
                    }
                    else {
                    	callback(data);
	                    $scope.addEdge(data.from, data.to);
                    }
                }
            };
        
            $scope.network = new vis.Network(container, data, options);

            // add event listeners
            $scope.network.on('select', function (params) {
                //$scope.handleSelection(params);
            });

            $scope.network.on("resize", function (params) { });
    };
}