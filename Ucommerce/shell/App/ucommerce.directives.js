// The list of ucommerce directives. The _module.js script defines the 'ucommerce.directives' module.
// Add new directives to the end of the list.
yepnope({

	load: [
		'App/Directives/_module.js',
		'App/Directives/alert/ucommerce.alert.directive.js',
		'App/Directives/navigation/ucommerce.navigation.directive.js',
		'App/Directives/iframe/ucommerce.iframe.directive.js',
        'App/Directives/modal-iframe/ucommerce.iframe.modal.directive.js',
		'App/Directives/resize/ucommerce.resize.directive.js',
		'App/Directives/rightclick/ucommerce.rightclick.directive.js',
		'App/Directives/ucommerce-splitter/ucommerce.splitter.directive.js',
		'App/Directives/shell/ucommerce.shell.directive.js',
		constants.webPageBaseUrl + 'Scripts/App/Directives/ucommerce-tree/ucommerce.tree.directive.js'
	]
});