function marketingTimelineController($scope, $http, $timeout) {

    $scope.loadTimeLine = function () {
        var container = $scope.elm.find('#marketingTimeLineWidget')[0];
        $http.get(UCommerceClientMgr.BaseServiceUrl + '/Widgets/Marketing/MarketingTimelineRequest/all').then(function (response) {

            var items = response.data;

            // Configuration for the Timeline
            var options = {
                autoResize: true,
                height: '100%'
            };

            // Create a Timeline
            var timeline = new vis.Timeline(container, items, options);

            $timeout(function () {
                $scope.$emit('loaded');
            });
        });
    }
}

angular.module('ucommerce').controller("marketingTimelineController", marketingTimelineController);