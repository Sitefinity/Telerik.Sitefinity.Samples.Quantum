angular.module('ucommerce.services')
	.factory('userService', function() {

		return {
			// TODO: Call a web service to get the currently authenticated user.
			isAuthenticated: function() {
				return {data: 'UCommerceUser', authenticated: true};
			}
		};

	});