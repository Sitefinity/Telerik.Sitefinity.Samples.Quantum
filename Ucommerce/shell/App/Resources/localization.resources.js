function localizationResource($http) {
	var serviceUrl = constants.serviceBaseUrl + 'Localization/TranslatedStrings';// + top.location.search;

	return {
		getTranslatedStrings: function (ressource) {
			return $http.post(
				serviceUrl,
				{
					RessourceName: ressource
				},
				{
					dataType: "application/json"
				}
			);
		}
	};
}

