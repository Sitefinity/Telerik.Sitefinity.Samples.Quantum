// List of ucommerce controllers. Add new controllers to this list, to load them for use in angular. 
yepnope({

	load: [
		'App/Controllers/shell.controller.js',
		'App/Controllers/main.controller.js',
	    'App/Controllers/alert.controller.js',
		'App/Controllers/modal.controller.js',
		'App/Controllers/navigation.controller.js',
		constants.webPageBaseUrl + 'Scripts/App/controllers/content-tree.controller.js'

	]
});