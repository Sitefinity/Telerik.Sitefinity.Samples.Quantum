function uc_appPreviewController($scope, $rootScope, uCommerceLocalizationService) {
	$scope.showCloseIcon = false;

	var initializeLocalizationt = uCommerceLocalizationService.initializeLocalizationService('Admin');
	initializeLocalizationt.then(function (data) {
		$scope.descriptionHeader = uCommerceLocalizationService.getTranslatedStrings('Admin', 'Description');
		$scope.changeLogHeader = uCommerceLocalizationService.getTranslatedStrings('Admin', 'ChangeLog');
		$scope.supportText = uCommerceLocalizationService.getTranslatedStrings('Admin', 'supportText');
		$scope.documentationText = uCommerceLocalizationService.getTranslatedStrings('Admin', 'documentationText');
	});

	$scope.$on("appManifest", function (event, subject) {
		$scope.manifest = subject;
		$scope.manifest.supportUrl = "http://eureka.ucommerce.net/#!/tags/app/" + subject.id;
		if ($scope.manifest.documentationUrl) {
			$scope.manifest.documentationUrl = "../../ucommerce/../apps/"+ subject.id + "/Documentation/index.html";
		}
	});

	$scope.action = function (){
		$rootScope.$emit($scope.actionListener, $scope.manifest.id);
	}

	if ($scope.closeListener != null || $scope.closeListener == "") {
		$scope.showCloseIcon = true;
	}

	$scope.closePreviewAction = function () {
		$rootScope.$emit($scope.closeListener, $scope.manifest.id);
	}
}