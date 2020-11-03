angular.module('ucommerce.services')
	.factory('iframeUrlUpdateService', function ($rootScope) {
		var sharedService = {};

		sharedService.message = '';

		sharedService.broadcastUrl = function (url) {
			this.message = url;
			this.broadcastItem();
		};

		sharedService.broadcastItem = function () {
			$rootScope.$broadcast('updateIFrameUrlEventFired');
		};

		return sharedService;
	});