var uc_resize = function($window) {
	return function (scope, element) {
		// setting default height
		var treeHeaderHeight = parseInt(angular.element('.ucommerce-tree-header').css('height'));
		var height = angular.element('.article-tree').innerHeight() - parseInt(element.css('margin-top'));
		element.css('height', height - treeHeaderHeight);

		angular.element($window).bind('resize', function (event) {
			height = angular.element('.article-tree').innerHeight() - parseInt(element.css('margin-top'));
			element.css('height', height - treeHeaderHeight);
		});
	};
}

