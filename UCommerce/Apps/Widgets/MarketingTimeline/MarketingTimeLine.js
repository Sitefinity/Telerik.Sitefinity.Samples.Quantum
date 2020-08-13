function marketingTimeline() {
    return {
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: {

        },
        templateUrl: UcommerceClientMgr.BaseUCommerceUrl + 'Apps/Widgets/MarketingTimeLine/marketingView.html',
        controller: marketingTimelineController,
        link: function (scope, elm, attrs) {
        	scope.elm = elm;
        	scope.loadTimeLine();
        }
    };
}

angular.module('ucommerce.directives').directive("marketingTimeline", marketingTimeline);