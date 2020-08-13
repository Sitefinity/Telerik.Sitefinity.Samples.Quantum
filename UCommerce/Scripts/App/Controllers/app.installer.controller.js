function uc_appInstallerController($scope, $http, $rootScope, uCommerceLocalizationService) {
	$scope.files = [];
	$scope.installationMode = false;
	$scope.installing = false;
	var maxRequestLength = 0;

	var initializeLocalizationt = uCommerceLocalizationService.initializeLocalizationService('Admin');
	initializeLocalizationt.then(function (data) {
		$scope.installAppHeader = uCommerceLocalizationService.getTranslatedStrings('Admin', 'InstallAppHeader');
		$scope.chooseAFile = uCommerceLocalizationService.getTranslatedStrings('Admin', 'ChooseAFile');
		$scope.uploadAppButton = uCommerceLocalizationService.getTranslatedStrings('Admin', 'UploadAppButton');
		$scope.buttonText = uCommerceLocalizationService.getTranslatedStrings('Admin', 'InstallAppButton');
	});

	$scope.fileNameChanged = function (element) {
		$scope.files = element.files;
		for (var i = 0; i < element.files.length; i++) {
			$scope.files = [];
			$scope.files.push({
				file: element.files[i]
			});
		}

		validateFile();
		$scope.$apply();
	}

	var validateFile = function () {
		var isValid = true;
		$scope.errorTexts = [];

		if (maxRequestLength == 0){
			getMaxRequestLength().then(function (response) {
				maxRequestLength = response.data;
				validateFile();
			});
			return false;
		}

		for (var i = 0; i < $scope.files.length; i++) {
			var file = $scope.files[i].file;

			if (maxRequestLength < bytesToKB(file.size)) {
				$scope.errorTexts.push(uCommerceLocalizationService.getTranslatedStrings('Admin', 'FileIsToLarge').replace("{0}", maxRequestLength));
				isValid = false;
			}

			var extension = ".nupkg";
			if (file.name.substring(file.name.length - extension.length, file.name.length) != extension) {
				$scope.errorTexts.push(uCommerceLocalizationService.getTranslatedStrings('Admin', 'NotSupportedFileType') + ' ' + extension);
				isValid = false;
			}
		}

		return isValid;
	};

	function bytesToKB(bytes) {
		return Math.ceil((bytes / 1024).toFixed(1));
	};

	var getMaxRequestLength = function() {
	    return $http.get(UcommerceClientMgr.BaseServiceUrl + '/Apps/requestLength').then(function (response) {
			maxRequestLength = response.data;
		});
	}

	getMaxRequestLength();

	$scope.uploadFiles = function () {
		var fileReader = new FileReader();

		if ($scope.files[0] == null) return;

		fileReader.onload = (function (file) {
			return function (e) {
				StartUploading({ name: file.name, value: this.result });
			};
		})($scope.files[0].file);

		if (validateFile())
			fileReader.readAsDataURL($scope.files[0].file);
	}

	var StartUploading = function (file) {
		var serviceUrl = '/ucommerceApi/Apps/uploadapp';
		var result = $http.post(
			serviceUrl,
			{ App: file },
			{
				dataType: "application/json"
			}
		);

		result.then(function (response) {
			$scope.installationMode = true;
			$rootScope.$broadcast("appManifest", response.data);
		});
	}

	$scope.$on("installApp", function (event, subject) {
	    var serviceUrl = UcommerceClientMgr.BaseServiceUrl + '/Apps/installapp';

		$scope.installing = true;

		var result = $http.post(
			serviceUrl,
			{
				AppName: subject,
				FileName: $scope.files[0].file.name
			},
			{
				dataType: "application/json"
			}
		);

		result.then(function (response) {
			$scope.loadingText = uCommerceLocalizationService.getTranslatedStrings('Admin', 'LoadingText');
			window.setTimeout(function () {//Making the experiance in IE better for the user. 
				top.location.reload();
			}, 2000);
		});
	});

}