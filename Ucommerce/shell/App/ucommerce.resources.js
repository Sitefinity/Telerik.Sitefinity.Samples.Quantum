// The main list of ucommerce resource services.
// The '_module.js' defines the 'ucommerce.resources' angular module.
// Add new resource services to the end of the list.

// The resource services should only contain code for reading and writing data.
// Use a normal service for any business logic for manipulating the data.

yepnope({

	load: [
		'App/Resources/_module.js',
		'App/Resources/catalog.resources.js',
	    'App/Resources/marketing.resources.js',
	    'App/Resources/settings.resources.js',
		'App/Resources/localization.resources.js',
		constants.webPageBaseUrl + 'Scripts/App/Resources/content.resource.js'
	]
});