function siteFinityContentTreeController($scope, $rootScope, $window, $location, $q, propertyService, $timeout, $element) {

    if ($element.attr('data-property-name') == null || $element.attr('data-property-name') === '') {
        alert('you need to set the "data-property-name" on the controller element to properly set the property value.');
    }

    $scope.propertyName = $element.attr('data-property-name');

    $scope.property = null;

    propertyService.get().then(function (data) {
        data.Items.forEach(function (element, index) {
            if (element.PropertyName.toLowerCase() === $scope.propertyName.toLowerCase()) {
                $scope.property = element;

                $timeout(function () {
                        $scope.$broadcast('setPreselectedValuesFromList', $scope.property.PropertyValue);

                    },
                    250);
            }
        });
    });

    $scope.$on('preSelectedValuesChanged',
        function (event, data) {
            $scope.property.PropertyValue = data.map(function (e) { return e.id }).join(',');
            propertyService.save(0, [$scope.property]);
        });
}