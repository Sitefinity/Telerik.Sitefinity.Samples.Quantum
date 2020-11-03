function contentPickerLauncherController($scope, uCommerceContentService, uCommerceTreeNodeIconService, $timeout) {

    $scope.pictureLoad = pictureLoad;
    $scope.launchTreePicker = launchTreePicker;
    $scope.removeContent = removeContent;
    $scope.ImageUrl = '';
    $scope.ImageClasses = '';
    $scope.inputValueName = '';
    $scope.selectButtonText = '';
    $scope.removeButtonText = '';
    $scope.showImage = showImage;
    $scope.selectedItemEmpty = selectedItemEmpty;
    $scope.urlConfiguration = [];
    $scope.firstSelectedNode;
    $scope.$on('saveContent', function (event, data) {
        $scope.saveContent(data);
    });
    $scope.nodeIconClasses = function () {
        if ($scope.firstSelectedNode) {
            var nodeIconRequest = {
                icon: $scope.firstSelectedNode.icon,
                shell: UcommerceClientMgr.Shell,
                iconFolder: $scope.iconFolder,
                iconFolderOverwrite: $scope.iconFolderOverwrite,
                baseIconUrl: UcommerceClientMgr.BaseUCommerceUrl
            }

            return uCommerceTreeNodeIconService.getNodeIconClasses(nodeIconRequest);
        }

        return '';
    }

    $scope.getNodeIconStyle = function () {
        if ($scope.firstSelectedNode) {
            var nodeIconRequest = {
                icon: $scope.firstSelectedNode.icon,
                shell: UcommerceClientMgr.Shell,
                iconFolder: $scope.iconFolder,
                iconFolderOverwrite: $scope.iconFolderOverwrite,
                baseIconUrl: UcommerceClientMgr.BaseUCommerceUrl
            }

            return uCommerceTreeNodeIconService.getNodeIconStyle(nodeIconRequest);
        }

        return {};
    }

    $scope.saveContent = function (content) {
        if ($scope.currentNodeElement)
            $scope.currentNodeElement.next().val(content.selectedValue); //value is set on hidden field.
        $scope.inputValue = content.selectedValue;

        setSelectedInformation();
    }

    function setSelectedInformation() {
        if ($scope.inputValue) {
            var arrayOfSelectedValues = $scope.inputValue.toString().split(',');
            var firstSelectedId = arrayOfSelectedValues[0]; //force into same datatype as can both be array and simple string. toString will comma seperate all values.

            uCommerceContentService.getNodes($scope.hasCheckboxFor, firstSelectedId).then(function (response) {
                var data = response.data;
                for (n in data) {
                    var firstSelectedNode = data[n]; //Always only one, but return type can contain more
                    $scope.firstSelectedNode = firstSelectedNode;
                    $scope.inputValueName = firstSelectedNode.name;

                    if ($scope.multiSelect && arrayOfSelectedValues.length > 1)
                        $scope.inputValueName += (' '
                            + $scope.andText
                            + ' '
                            + (arrayOfSelectedValues.length - 1)
                            + ' '
                            + $scope.moreText);
                }
            });

            loadImageOnId(firstSelectedId);
        } else {
            $timeout(function() {
                $scope.inputValueName = '';
                removeContent();
            });
        }
    }

    function selectedItemEmpty() {
        return $scope.inputValue != '';
    }

    function showImage() {
        var show = $scope.ImageUrl != '' && $scope.hasPreview === 'true';
        return show;
    }

    function launchTreePicker() {
        $scope.urlConfiguration['preSelectedValues'] = $scope.inputValue; //update preselectedvalues before launching to keep new selected values up-to-date. 
        var contentPickerUrl = UcommerceClientMgr.BaseUCommerceUrl + "ContentTree.aspx?";

        for (name in $scope.urlConfiguration) {
            contentPickerUrl += name + '=' + $scope.urlConfiguration[name] + '&';
        }

        contentPickerUrl += 'launcherelementid=' + $scope.id;

        var pickerWidth = ($scope.hasPreview == "true") ? 1024 : 700;

        UcommerceClientMgr.openModal(contentPickerUrl, "ContentPicker", pickerWidth, 500);
    };

    function removeContent() {
        $scope.inputValue = '';
        $scope.ImageUrl = '';
        $scope.inputValueName = '';
        $scope.firstSelectedNode = null;
        if ($scope.currentNodeElement)
            $scope.currentNodeElement.next().val('');
    }

    function loadImageOnId(id) {
        if ($scope.hasPreview == "true" && id && id != '') {
            if (id) {
                uCommerceContentService.getImageUrl(id).then(
                    function (data) {
                        $scope.ImageUrl = data;
                        $scope.imagePreviewUrl = data;
                    });
            }
        }
    }

    function pictureLoad(id, classes, imagePicker, type) {
        $scope.contentPickerType = type;
        $scope.ImageClasses = classes;
        $scope.ImagePicker = imagePicker;
        $scope.inputValue = id;
        setSelectedInformation();
    }
}

angular.module('ucommerce').controller("contentPickerLauncherController", contentPickerLauncherController);