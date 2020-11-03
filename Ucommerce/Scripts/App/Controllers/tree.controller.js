function contentTreeController($scope, $rootScope, $window, $location, $q) {

	$scope.getPreSelectedValues = function () {

		if ($scope.preSelectedValues) {
			return $scope.preSelectedValues.toString();
		}
		return '';
	};

	$scope.$on('toggleSelectedNode', function (event, node) {

		var identifier = node.id;
		
		if ($scope.preSelectedValues) {
			if ($scope.preSelectedValues.indexOf(identifier) == -1) {
				$scope.preSelectedValues.push(identifier);
			} else {
				var index = $scope.preSelectedValues.indexOf(identifier);
				$scope.preSelectedValues.splice(index, 1);
			}
		} else {
			$scope.preSelectedValues = [];
			$scope.preSelectedValues.push(identifier);
		}

		$scope.$broadcast('preSelectedValuesChanged', $scope.preSelectedValues);
    });
}