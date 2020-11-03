function orderListController($scope, $http, $timeout, uCommerceLocalizationService, uCommerceWidgetTableService) {
    $scope.title = "Orders";

    $scope.isSelectedOrderStatus = function (orderStatus) {
        uCommerceWidgetTableService.recalculateTable($scope.elm.find('#orderTable'));
        var index = $scope.selectedOrderStatuses.indexOf(orderStatus);
        if (index > -1) {
            return true;
        } else {
            return false;
        }
    };

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

    $scope.setSelectedOrderStatuses = function (orderStatus) {
        var index = $scope.selectedOrderStatuses.indexOf(orderStatus);
        if (index > -1) {
            $scope.selectedOrderStatuses.splice(index, 1);

        } else {
            $scope.selectedOrderStatuses.push(orderStatus);
        }
        $scope.setPropertyValue('OrderStatus', $scope.selectedOrderStatuses.toString());

    };

    $scope.selectedInterval = $scope.getPropertyValue("Interval");
    if ($scope.getPropertyValue('Interval') == '_')
        $scope.setPropertyValue('Interval', 'Today');

    $scope.loadPurchaseOrders = function () {
        $scope.setPropertyValue('Interval', $scope.selectedInterval);
        $scope.setPropertyValue('OrderStatus', $scope.selectedOrderStatuses.toString());

        var serviceUrl = UcommerceClientMgr.BaseServiceUrl + '/Widgets/Orders/Search';

        var result = $http.post(
			serviceUrl,
			{
			    DateInterval: $scope.getPropertyValue('Interval'),
			    OrderStatusNames: $scope.getPropertyValue('OrderStatus'),
			    Skip: 0,
			    BatchSize: 200
			},
			{
			    dataType: "application/json"
			}
		);

        result.then(function (response) {
            response.data = ConvertDate(response.data);
            $scope.$emit('loaded');
            $scope.orders = response.data;
            uCommerceWidgetTableService.recalculateTable($scope.elm.find('#orderTable'));
        });
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
        });
    }

    $scope.getTranslatedValue = function (input) {
        return uCommerceLocalizationService.getTranslatedStrings('OrderList', input);
    }


    var isLoading = false;
    $scope.loadMore = function () {
        var serviceUrl = UcommerceClientMgr.BaseServiceUrl + '/Widgets/Orders/Search';

        if (!isLoading) {
            var result = $http.post(
				serviceUrl,
				{
				    DateInterval: $scope.intervals.indexOf($scope.selectedInterval),
				    OrderStatusNames: $scope.selectedOrderStatuses,
				    Skip: $scope.orders.length,
				    BatchSize: 300
				},
				{
				    dataType: "application/json"
				}
			);
            isLoading = true;

            result.then(function (response) {
                response.data = ConvertDate(response.data);
                for (i in response.data) {
                    $scope.orders.push(response.data[i]);
                    isLoading = false;
                }
                uCommerceWidgetTableService.recalculateTable($scope.elm.find('#orderTable'));
            });
        }
    }

    $scope.redirectToOrder = function (order) {
        var url = UcommerceClientMgr.BaseUCommerceUrl + 'orders/EditOrder.aspx?id=' + order.OrderId;
        UcommerceClientMgr.contentFrame(url);
    }

    ConvertDate = function (orders) {
        for (var i = 0; i < orders.length; i++) {
            orders[i].CompletedDate = new Date(orders[i].CompletedDate).toLocaleString();
        }
        return orders;
    }

    $scope.predicate = 'CompletedDate';
    $scope.reverse = true;
    $scope.orderTable = function (predicate) {
        $scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
        $scope.predicate = predicate;
        uCommerceWidgetTableService.recalculateTable($scope.elm.find('#orderTable'));
    };

    var initializeLocalizationt = uCommerceLocalizationService.initializeLocalizationService('OrderList');
    initializeLocalizationt.then(function (data) {
        $scope.loadSettings();

        $scope.selectedInterval = $scope.getPropertyValue('Interval');
        if (!$scope.selectedInterval)
            $scope.selectedInterval = uCommerceLocalizationService.getTranslatedStrings('OrderList', 'ThisWeek');

        var propertyValue = $scope.getPropertyValue('OrderStatus');
        if (propertyValue == '_') {
            $scope.selectedOrderStatuses = ['New order'];
        } else {
            $scope.selectedOrderStatuses = propertyValue.split(',');
        }

        $scope.loadPurchaseOrders();
        $scope.NoMatchingPurchaseOrders = uCommerceLocalizationService.getTranslatedStrings('OrderList', 'NoMatchingOrders');
    });
}

angular.module('ucommerce').controller("orderListController", orderListController);