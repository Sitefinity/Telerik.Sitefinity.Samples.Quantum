function marketingResource($http) {
    var serviceUrl = constants.serviceBaseUrl + 'Marketing/';

    return {
		deleteCampaign: function(id) {
			return $http["delete"](serviceUrl + 'Campaign/' + id + '/delete');
		},
        
		deleteCampaignItem: function (id) {
			return $http["delete"](serviceUrl + 'CampaignItem/' + id + '/delete');
		}
    };
}

