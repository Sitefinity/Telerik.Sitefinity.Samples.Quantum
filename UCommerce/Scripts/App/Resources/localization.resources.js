function uc_localization_resource($http) {
    var serviceUrl = UcommerceClientMgr.BaseServiceUrl + '/Localization/TranslatedStrings';// + top.location.search;

	return {
		getTranslatedStrings: function (resource) {
			return $http.post(
				serviceUrl,
				{
					RessourceName: resource
				},
				{
					dataType: "application/json"
				}
			);
		}
	};
}

