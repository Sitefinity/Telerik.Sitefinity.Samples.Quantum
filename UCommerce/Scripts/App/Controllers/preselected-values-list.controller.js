var uc_preselectedValuesListController = function (uCommerceContentService, $scope, $rootScope, $window, $location, $q, uCommerceTreeNodeIconService) {

    $scope.getPreSelectedValuesString = function () {

        if ($scope.preSelectedValues instanceof Array) {
            var preselectedValues = '';
            var first = true;

            for (n in $scope.preSelectedValues) {
                if (first) {
                    first = false;
                    preselectedValues += $scope.preSelectedValues[n];
                } else {
                    preselectedValues += ',';
                    preselectedValues += $scope.preSelectedValues[n];
                }
            }

            return preselectedValues;
        }

        return $scope.preSelectedValues;
    }

    $scope.getDeleteImageIcon = function () {
        return UcommerceClientMgr.BaseUCommerceUrl + 'images/deleteCross.png';
    }

    $scope.sortable = function (elm) {
        $(elm).sortable({
            stop: function (event, ui) {
                var newSortOrder = [];
                var children = event.target.children;
                for (var i = 0; i < children.length; i++) {
                    var id = children[i].attributes['data-node-id'].value;
                    newSortOrder.push(id);
                }

                $scope.$emit('sortOrderChanged', newSortOrder);
            }
        });
    };

    $scope.getNodeIconClasses = function(icon) {
        var nodeIconRequest = {
            icon: icon,
            shell: UcommerceClientMgr.Shell,
            iconFolder: $scope.iconFolder,
            baseIconUrl: UcommerceClientMgr.BaseUCommerceUrl
        }

        return uCommerceTreeNodeIconService.getNodeIconClasses(nodeIconRequest);
    }

    $scope.getNodeIconStyle = function(icon) {
        var nodeIconRequest = {
            icon: icon,
            shell: UcommerceClientMgr.Shell,
            iconFolder: $scope.iconFolder,
            baseIconUrl: UcommerceClientMgr.BaseUCommerceUrl
        }

        return uCommerceTreeNodeIconService.getNodeIconStyle(nodeIconRequest);
    }

    $scope.removeNodeClick = function (node) {
        $scope.updatePreselectedValues(node);
    }

    $scope.updatePreselectedValues = function (node) {
        $scope.$emit('toggleSelectedNode', node);
    }
}