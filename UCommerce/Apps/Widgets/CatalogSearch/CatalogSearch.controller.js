function catalogSearchController($scope, $http, $timeout, uCommerceTreeNodeIconService, uCommerceLocalizationService, localStorageService) {

    $scope.result;

    $scope.noResults = function () {
        if (!$scope.result) return false;

        return true;
    }

    $scope.searchResultNotEmpty = function () {
        if (!$scope.result)
            return false;
        if (!$scope.result.result)
            return false;

        return $scope.result.result.length > 0;
    }

    $scope.loadInitially = function () {
        var searchTermFromLocalStorage = localStorageService.get($scope.widget.userWidgetSettings.userWidgetSettingId + "-selectedSearchTerm");
        if (searchTermFromLocalStorage && searchTermFromLocalStorage != '') {
            $scope.elm.find('#catalogSearchInput').val(searchTermFromLocalStorage);
            $scope.search(searchTermFromLocalStorage);
        }
    }

    $scope.availableSuggestions = function () {
        if (!$scope.result) return false;

        if (!$scope.result.suggestions) return false;

        return $scope.result.suggestions.length > 0;
    }

    $scope.searchAgain = function (searchTerm) {
        $scope.elm.find('#catalogSearchInput').val(searchTerm);
        $scope.search(searchTerm);
    }

    $scope.errorInSearch = false;

    $scope.editItem = function (item) {
        var url = UCommerceClientMgr.BaseUCommerceUrl + item.url;
        UCommerceClientMgr.contentFrame(url);
    }

    $scope.search = function (input) {
        if (input != null && input != '' && input.trim() != '') {
            localStorageService.set($scope.widget.userWidgetSettings.userWidgetSettingId + "-selectedSearchTerm", input);
            $scope.$emit('reloading');
            var serviceUrl = UCommerceClientMgr.BaseServiceUrl + '/Widgets/Catalog/Search';
            var result = $http.post(
				serviceUrl,
				{
				    SearchTerm: input
				},
				{
				    dataType: "application/json"
				}
			);

            result.then(function (response) {
                $scope.$emit('loaded');
                $scope.result = response.data;
                $scope.errorInSearch = false;
                for (n in $scope.result.result) {
                    var icon = $scope.result.result[n].icon;
                    $scope.result.result[n].icon = uCommerceTreeNodeIconService.getNodeIconStyle({
                        icon: icon,
                        shell: UCommerceClientMgr.Shell,
                        iconFolder: 'uCommerce'
                    });
                }
                if ($scope.result.result.length > 0)
                    recalculateResultListHeight();


                var searchResult = uCommerceLocalizationService.getTranslatedStrings('CatalogSearch', 'SearchResult');
                $scope.searchResult = searchResult.replace("{0}", $scope.result.result.length);
                $scope.searchResult += ' in ' + $scope.result.executionTime + ' ms.';
            }, function (data) { //error handling
                $scope.$emit('loaded');
                $scope.errorInSearch = true;
                $scope.error = {
                    message: data.data.ResponseStatus.Message
                }
            });
        }
    }

    $scope.elm.find('#catalogSearchInput').keydown(function (event) {
        if (event.altKey || event.keyCode == 226) {
            return;
        }

        if (event.keyCode == 38 || event.keyCode == 40 || event.keyCode == 13)
            return;

        clearTimeout($scope.timeOutFunction);

        $scope.timeOutFunction = setTimeout(function () {

            $scope.search($scope.elm.find('#catalogSearchInput').val());
        }, 700);
    });

    var recalculateResultListHeight = function () {
        var contentHeight = $scope.elm.find('.widgetContent').height();
        var searchBarHeight = $scope.elm.find('.searchInput').outerHeight();

        $('.catalogSearchScroll').css('height', contentHeight - searchBarHeight);
    }

    var initializeLocalizationt = uCommerceLocalizationService.initializeLocalizationService('CatalogSearch');
    initializeLocalizationt.then(function (data) {

        $scope.suggestions = uCommerceLocalizationService.getTranslatedStrings('CatalogSearch', 'Suggestions');
        $scope.forgotIndexing = uCommerceLocalizationService.getTranslatedStrings('CatalogSearch', 'ForgotIndexing');
        $scope.typeToSearch = uCommerceLocalizationService.getTranslatedStrings('CatalogSearch', 'TypeToSearch');

    });


    $scope.$emit('loaded'); //no initial load, just remove imidietly.
}

angular.module('ucommerce').controller("catalogSearchController", catalogSearchController);