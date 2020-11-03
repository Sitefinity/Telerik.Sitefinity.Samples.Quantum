function AlertController($scope) {
	$scope.alerts = [];

	$scope.$on('addAlert', function (event, args) {
		$scope.alerts.push(args);
		$scope.$apply();
	});

	$scope.closeAlert = function (index) {
		$scope.alerts.splice(index, 1);
	};

	$scope.alertType = function (type) {
		var typeClass = 'alert';

		if (type) {
			switch (type) {
				case "save":
					typeClass += ' alert-success';
					break;
				case "danger":
					typeClass += ' alert-danger';
					break;
				default:
					typeClass += ' alert-success';
					break;
			}
		}

		return typeClass;
	};
}

window.addAlert = function (type, header, body) {
	angular.element('#AlertControllerContainer').css('display', 'block');
	angular.element('#AlertControllerContainer').scope().$broadcast('addAlert', { type: type, header: header, body: body });
};

angular.module('ucommerce').controller("AlertController", AlertController);