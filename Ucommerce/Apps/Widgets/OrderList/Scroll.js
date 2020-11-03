function scrol() {
	return {
		restrict: 'A',
		link: function (scope, element, attrs) {
			var raw = element[0];
			element.bind('scroll', function () {
				if (raw.scrollTop + raw.offsetHeight >= raw.scrollHeight - 1000) {
					scope.$apply(attrs.scrol);
				}
			});
		}
	};
}

angular.module('ucommerce.directives').directive("scrol", scrol);
