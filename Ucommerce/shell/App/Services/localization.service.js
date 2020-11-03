angular.module('ucommerce.services')
	.factory('localizationService', function(localizationResource) {

		var localizationServiceObject = {};

		var ressourceFileName = 'Admin';

		localizationServiceObject.SetRessourceFile = function(newRessourceFileName) {
			ressourceFileName = newRessourceFileName;
		}
		
		localizationServiceObject.getTranslatedStrings = function (key) {
			if (!localizationServiceObject.resourceObjects) {
				var response = localizationResource.getTranslatedStrings(ressourceFileName);
				response.then(function(data) {
					localizationServiceObject.resourceObjects = data.data;
				});
			}
			if (key == '')
				return '';
			return localizationServiceObject.resourceObjects[key];
		};
		
		return localizationServiceObject;
	});