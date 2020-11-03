function catalogResource($http) {
	// Notice that this data matches the data for my 'Avenue Clothing' store. Thus making the iFrame work as POC.
    // Also note the still hardcoded base url in the tree controller.

    var serviceUrl = constants.serviceBaseUrl + 'ProductCatalog/';

	return {
		deleteCatalogGroup: function(id) {
			return $http["delete"](serviceUrl + 'CatalogGroup/' + id + '/delete');
		},
		
		deleteCatalog: function(id) {
			return $http["delete"](serviceUrl + 'Catalog/' + id + '/delete');
		},
		
		deleteCategory: function(id) {
			return $http["delete"](serviceUrl + 'Category/' + id + '/delete');
		},
		deleteProduct: function(id) {
			return $http["delete"](serviceUrl + 'Category/Product/' + id + '/delete');
		}
	};
}

