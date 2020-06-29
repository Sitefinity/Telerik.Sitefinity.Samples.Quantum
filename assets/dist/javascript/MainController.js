function mainController($scope, $http, BasketService, SearchService, $timeout) {
    $scope.basketService = BasketService;
    $scope.searchService = SearchService;

    $(document.body).on('keyup', function (evt) {
        $timeout(function () {
            if (evt.keyCode === 27) {
                if ($scope.searchService.showSearchBar)
                    $scope.searchService.toggleSearchBar();

                if ($scope.searchService.showFilter)
                    $scope.searchService.toggleFilter();

                if ($scope.basketService.showSidebarBasket)
                    $scope.basketService.toggleSideBarBasket();
            }
        });
    });

    BasketService.loadBasket();
}

angular.module('app').controller("mainController", mainController);