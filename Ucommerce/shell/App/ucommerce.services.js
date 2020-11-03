// The main list of ucommerce services.
// The '_module.js' defines the 'ucommerce.services' angular module.
// Add new services to the end of the list.

// The services should contain any business logic to be performed on the objects.
// Use a resource service for the reading and writing og data.

yepnope({

	load: [
		'App/Services/_module.js',
		'App/Services/tree.service.js',
		'App/Services/user.service.js',
		'App/Services/localization.service.js',
		'App/Services/iframe.url.service.js',
		constants.webPageBaseUrl + 'Scripts/App/Services/content-picker.service.js'

	]
});