var uc_Iframe = function() {
	function updateFrameSource(frameUrl, frameid) {

		var frame = angular.element("#" + frameid);
        
	    var currentSource = frame.attr('src');
	    if (currentSource.indexOf("detectIEDuplicateRequest=") >= 0 && currentSource === frameUrl) {
	        return;
	    }
		angular.element("#mainframe").contents().find("html").hide();

	    frame.attr('src', frameUrl);
	};

	return {
		restrict: 'A',
		replace: false,
		controller: function($scope, $attrs, iframeUrlUpdateService) {
			// The iframeUrlService is injected.

			$scope.setUrl = function(url) {
				iframeUrlUpdateService.broadcastUrl(url);
			};

			$scope.$on('updateIFrameUrlEventFired', function() {
				// Whenever the "IFrame Url Updated" event is triggered, the src for the iframe is updated.
			    // The new url is taken from the iframeUrlUpdateService.
			    
			    updateFrameSource(iframeUrlUpdateService.message, $attrs.id);
			    
			});
		}
	};
}