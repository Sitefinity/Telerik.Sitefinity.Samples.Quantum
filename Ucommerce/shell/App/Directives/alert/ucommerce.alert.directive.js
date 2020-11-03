var uc_alert = function ($timeout) {
	return {
		restrict: 'E',
		transclude: true,
		replace: true,
		scope: {
			type: '&',
			header: '=',
			close: '&',
			timeout: '@'
		},
		templateUrl: 'App/Directives/alert/ucommerce.alert.html',
		link: function (scope, elm, attrs) {
			scope.closeable = 'close' in attrs;

			if ("timeout" in attrs) {
			    $timeout(function () {
			        $(elm).fadeOut(1500);
				}, attrs.timeout);
			}
		}
	};
}