// This is the main entry point for loading the js and angular scripts.
// This script is referenced from the index.html page, in order to
// setup the uCommerce angular application.
yepnope({

	load: [
		'App/arrayExtentions.js',
		'Scripts/jquery/jquery-1.8.3.min.js',
		'Scripts/angular-1.0.7/angular.js',
		'Scripts/bootstrap/bootstrap.js',
		'App/constants.js',
		'App/app.js',
		'App/ucommerce.resources.js',
		'App/ucommerce.services.js',
		'App/ucommerce.directives.js',
		'App/ucommerce.controllers.js',
		'App/Factory/Factory.js',
		'App/routes.js'
	],

	complete: function () {
		jQuery(document).ready(function () {
			angular.bootstrap(document, ['ucommerce']);
		});

	}
});