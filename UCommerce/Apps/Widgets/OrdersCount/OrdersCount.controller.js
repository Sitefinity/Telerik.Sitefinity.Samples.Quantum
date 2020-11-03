function ordersCountController($scope, $http, $timeout, uCommerceLocalizationService) {

    $scope.getPropertyValue = function (key) {
        for (n in $scope.widget.properties) {
            if ($scope.widget.properties[n].key == key) {
                return $scope.widget.properties[n].value;
            }
        }
    }

    $scope.setPropertyValue = function (key, val) {
        for (n in $scope.widget.properties) {
            if ($scope.widget.properties[n].key == key) {
                $scope.widget.properties[n].value = val;
                return;
            }
        }
    }

    $scope.selectedInterval = $scope.getPropertyValue("Interval");
    if ($scope.getPropertyValue('Interval') == '_')
        $scope.setPropertyValue('Interval', 'Today');


    $scope.selectedOrderStatuses = $scope.getPropertyValue("OrderStatus");
    if ($scope.getPropertyValue('OrderStatus') == '_')
        $scope.selectedOrderStatuses = ['New order'];

    $scope.loadOrderCount = function () {
        var serviceUrl = UcommerceClientMgr.BaseServiceUrl + '/Widgets/Orders/Count';

        $scope.setPropertyValue('Interval', $scope.selectedInterval);
        $scope.setPropertyValue('OrderStatus', $scope.selectedOrderStatuses.toString());

        var result = $http.post(
			serviceUrl,
			{
			    DateInterval: $scope.getPropertyValue('Interval'),
			    OrderStatusNames: $scope.getPropertyValue('OrderStatus')
			},
			{
			    dataType: "application/json"
			}
		);

        result.then(function (response) {
            for (var i = 0; i < response.data.length; i++) {
                response.data[i].orderCount = response.data[i].orderCount.toLocaleString();
            }
            $scope.OrderCountSummary = response.data;

            $timeout(function () {
                $scope.$emit('loaded');
            });
        });
    }

    $scope.findRowHeight = function () {
        return {
            height: (100 / $scope.OrderCountSummary.length) + '%'
        }
    }

    $scope.loadSettings = function () {
        $scope.intervals = [
			'Today',
			'ThisWeek',
			'ThisMonth',
			'ThisYear'
        ];

        $http.get(UcommerceClientMgr.BaseServiceUrl + '/Widgets/Orders/OrderStatuses/all').then(function (response) {
            $scope.orderStatuses = response.data;
            $scope.loadOrderCount();
        });
    }

    $scope.getTranslatedValue = function (input) {
        return uCommerceLocalizationService.getTranslatedStrings('OrdersCount', input);
    }

    $scope.isSelectedOrderStatus = function (orderStatus) {
        var index = $scope.selectedOrderStatuses.indexOf(orderStatus);
        if (index > -1) {
            return true;
        } else {
            return false;
        }
    };

    $scope.setSelectedOrderStatuses = function (orderStatus) {
        var index = $scope.selectedOrderStatuses.indexOf(orderStatus);
        if (index > -1) {
            $scope.selectedOrderStatuses.splice(index, 1);

        } else {
            $scope.selectedOrderStatuses.push(orderStatus);
        }
        $scope.setPropertyValue('OrderStatus', $scope.selectedOrderStatuses.toString());
    };

    var initializeLocalizationt = uCommerceLocalizationService.initializeLocalizationService('OrdersCount');
    initializeLocalizationt.then(function (data) {
        $scope.loadSettings();

        var propertyValueInterval = $scope.getPropertyValue('Interval');
        if (!propertyValueInterval || propertyValueInterval == '_')
            $scope.selectedInterval = uCommerceLocalizationService.getTranslatedStrings('OrderList', 'ThisWeek');

        var propertyValue = $scope.getPropertyValue('OrderStatus');
        if (!propertyValue || propertyValue == '_') {
            $scope.selectedOrderStatuses = ['New order'];
        } else {
            $scope.selectedOrderStatuses = propertyValue.split(',');
        }
    });
}

angular.module('ucommerce').controller("ordersCountController", ordersCountController);
