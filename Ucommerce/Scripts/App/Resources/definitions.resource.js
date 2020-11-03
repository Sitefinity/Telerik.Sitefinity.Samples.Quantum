var uc_definitions_Resource = function($http) {
    var serviceUrl = UcommerceClientMgr.BaseServiceUrl;

    return {
         getDefinitionGraph: function (id) {
            var url = serviceUrl + 'Definitions/Definitiongraph';
            if (id != null) url += '/' + id;
            return $http.get(url).then(function (response) {
                return response.data;
            });
         }
    };
}