function contentPickerController($scope, uCommerceContentService) {

	$scope.pictureLoad = pictureLoad;
	$scope.closeContainer = closeContainer;
	$scope.SavePicture = savePicture;
	$scope.setSelectedId = setSelectedId;
	$scope.setSelectedImagePreviewUrl = setSelectedImagePreviewUrl;
    $scope.launcherId = '';
	$scope.ImageUrl = '';
	$scope.ImageClasses = '';
	$scope.ImagePicker = '';
	$scope.imagePreviewUrl = '';
	$scope.selectedId = '';
	$scope.selectedInputValueName = '';
	$scope.inputValueName = '';
	$scope.inputValue = '';
	$scope.selectButtonText = '';
	$scope.hasPreview = '';
	$scope.removeButtonText = '';
	$scope.showImage = showImage;
	$scope.contentStyle = contentStyle;
	$scope.showImagePreview = showImagePreview;

	$scope.modalStyle = function () {
		return {
			width: $scope.width + 'px',
			height: $scope.height + 'px',
			padding: 0
		};
	};
	
	$scope.modalStyleOffset = function (offset) {
		return {
			width: $scope.width + 'px',
			height: ($scope.height - offset) + 'px',
			padding: 0,
			'overflow-y': 'none',
			'max-height': $scope.height + 'px'
		};
	};

	$scope.getContentPickerType = function () {
		return $scope.contentPickerType;
	};

	$scope.$on('nodeSelected', function (event, data) {
        var node = data;
        if (node.nodeType.toLowerCase() !== "content") {
            setSelectedImagePreviewUrl(node);
        }
		setSelectedId(node.id);
		setSelectedName(node.name);
	});

	$scope.shouldShowPreSelectedValues = function () {
	    if ($scope.multiSelect)
	        return $scope.multiSelect.toLowerCase() == 'true';
	}

    $scope.$on('sortOrderChanged', function(event, data) {
        var newNodesOrder = [];
        for (n in $scope.selectedNodes) {
            newNodesOrder.splice(data.indexOf($scope.selectedNodes[n].id), 0, $scope.selectedNodes[n]);
        }
        $scope.selectedNodes = newNodesOrder;
        $scope.updatePreselectedValues();

    });

	$scope.updatePreselectedValues = function () {
	    var preselectedValues = '';
	    var first = true;

	    for (n in $scope.selectedNodes) {
	        if (first) {
	            first = false;
	            preselectedValues += $scope.selectedNodes[n].id;
	        } else {
	            preselectedValues += ',';
	            preselectedValues += $scope.selectedNodes[n].id;
	        }
	    }
	    $scope.preSelectedValues = preselectedValues;
	}

	$scope.$on('preSelectedValuesChanged', function (event, data) {

	    var preselectedValues = '';
	    var first = true;

	    for (n in data) {
	        if (first) {
	            first = false;
	            preselectedValues += data[n].id;
	        } else {
	            preselectedValues += ',';
	            preselectedValues += data[n].id;
	        }
	    }

	    $scope.preSelectedValues = preselectedValues;
	});

	$scope.loadPreselectedNodes = function () {
	    uCommerceContentService.getNodes($scope.hasCheckboxFor, $scope.preSelectedValues).then(function (response) {
	        $scope.selectedNodes = [];
	        var data = response.data;
	        for (n in data) {
	            $scope.selectedNodes.push({
	                id: data[n].id,
	                name: data[n].name,
	                nodeType: data[n].nodeType,
	                icon: data[n].icon
	            });
	        }
	        $scope.updatePreselectedValues();
	    });
	}
	
	$scope.$on('toggleSelectedNode', function (event, node) {
	    for (n in $scope.selectedNodes) {
	        var selectedNode = $scope.selectedNodes[n];
	        if (selectedNode.id == node.id && selectedNode.nodeType == node.nodeType) {
	            $scope.selectedNodes.splice(n, 1);
	            $scope.updatePreselectedValues();
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

	    $scope.updatePreselectedValues();
	    $scope.$broadcast('preSelectedValuesChanged', $scope.selectedNodes);

	});

	function setSelectedName(name) {
		$scope.selectedInputValueName = name;
	}

	function showImage() {
	    var show = $scope.ImageUrl != '' && $scope.hasPreview === 'true';
		return show;
	}
	
	function showImagePreview() {
		var show = $scope.imagePreviewUrl != '' && $scope.hasPreview === 'true';
		return show;
	}

	function contentStyle() {
        if ($scope.hasPreview == "false") {
            return { 'min-width': '100%' };
        }
	}

	function setSelectedId(id) {
		$scope.selectedId = id;
	}
	
	function setSelectedImagePreviewUrl(node) {
		if (node.url != '' && node.url != null) {
		    $scope.imagePreviewUrl = node.url;
		    $scope.currentNodeElement.find('#selectedImagePreview').show();
		} else {
		    uCommerceContentService.getImageUrl(node.id).then(
		    function (data) {
		        $scope.imagePreviewUrl = data;
		        $scope.currentNodeElement.find('#selectedImagePreview').show();
		    });
		}
	}
	
	function closeContainer(event) {
	    event.stopPropagation();

	    if (event.WasHandled) { return; }
	    event.WasHandled = true;

	    UCommerceClientMgr.closeModalWindow();
	}

	function findRelevantFrame() {
		var frames = parent.$.find('iframe');
		if (frames.length) {
			for (var index = 0; index < frames.length; index++) {
				var frame = frames[index];
				// Find the potential launcher.
				var launchers = frame.contentWindow.$(escapeCssSpecificCharactersInId($scope.launcherId));
				if (launchers.length && launchers.length > 0) { //launcher is located in frame
					return frame;
				}
			}
		}
		return null;
	}

	function findRelevantScopeForContentPicker(frame, id) {
		var formattedId = escapeCssSpecificCharactersInId(id);
		return frame.contentWindow.angular.element(formattedId).isolateScope();
	}

	function escapeCssSpecificCharactersInId(id) {
		return "#" + id.replace(/(:|\.|\[|\]|,|=|@)/g, "\\$1");
	}


	function savePicture(event) {

		event.stopPropagation();

	    if (event.WasHandled) { return; }
	    event.WasHandled = true;

		var contentToSave = {
			contentToSave: ''
		};

		if ($scope.multiSelect && $scope.multiSelect.toLowerCase() == 'true') { // multi select is enabled and checkboxes are shown for specific nodes in the tree. 
		    contentToSave.selectedValue = $scope.preSelectedValues;
	    } 
	    else {
	        contentToSave.selectedValue = $scope.selectedId; //a single array of an object with the selected id. Id is only used in the save method.
	    }

	    var frame = findRelevantFrame();
	    var launcherScope = findRelevantScopeForContentPicker(frame, $scope.launcherId);

		launcherScope.saveContent(contentToSave);

	    UCommerceClientMgr.closeModalWindow();
	    return;

	}

	function pictureLoad(id, classes, imagePicker, type) {
		$scope.contentPickerType = type;
		$scope.ImageClasses = classes;
		$scope.ImagePicker = imagePicker;
		$scope.inputValue = id;
		uCommerceContentService.getImageUrl(id).then(
		function (data) {
			$scope.ImageUrl = data;
			$scope.imagePreviewUrl = data;
		});
	}
}