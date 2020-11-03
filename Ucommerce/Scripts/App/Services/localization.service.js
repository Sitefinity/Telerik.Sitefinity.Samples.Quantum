var uc_localization_service = function (uCommerceLocalizationResource) {

	var localizationServiceObject = {};

	localizationServiceObject.initializeLocalizationService = function (ressourceFileName) {
		var response = uCommerceLocalizationResource.getTranslatedStrings(ressourceFileName);
		response.then(function (data) {
			localizationServiceObject[ressourceFileName] = data.data;
		});
		return response;
	}

	localizationServiceObject.getTranslatedStrings = function (resourceName,key) {
		if (key == '')
			return '';
		return localizationServiceObject[resourceName][key];
	};

	return localizationServiceObject;
};