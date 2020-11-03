function settingsResource($http) {
    var serviceUrl = constants.serviceBaseUrl + 'Settings/';

    return {
        // Catalog
		deleteCatalogPriceGroup: function(id) {
			return $http["delete"](serviceUrl + 'Catalog/PriceGroup/' + id + '/delete');
		},
        
		deleteCatalogProductRelation: function(id) {
			return $http["delete"](serviceUrl + 'Catalog/ProductRelation/' + id + '/delete');
		},
        
        // Orders
        deleteShippingMethod: function (id) {
        	return $http["delete"](serviceUrl + 'Orders/ShippingMethod/' + id + '/delete');
        },
        
        deletePaymentMethod: function (id) {
        	return $http["delete"](serviceUrl + 'Orders/PaymentMethod/' + id + '/delete');
        },
        
        deleteCountry: function (id) {
        	return $http["delete"](serviceUrl + 'Orders/Country/' + id + '/delete');
        },
        
        deleteCurrency: function (id) {
        	return $http["delete"](serviceUrl + 'Orders/Currency/' + id + '/delete');
        },
        
        deleteOrderNumber: function (id) {
        	return $http["delete"](serviceUrl + 'Orders/OrderNumber/' + id + '/delete');
        },
        
        // Email
        deleteEmailProfile: function(id) {
        	return $http["delete"](serviceUrl + 'Email/Profile/' + id + '/delete');
        },
        
        deleteEmailType: function(id) {
        	return $http["delete"](serviceUrl + 'Email/Type/' + id + '/delete');
        },
        
        // Definitions
        deleteProductDefinition: function (definitionId) {
        	return $http["delete"](serviceUrl + 'Definitions/ProductDefinition/' + definitionId + '/delete');
        },
        
        deleteProductDefinitionField: function (definitionFieldId) {
        	return $http["delete"](serviceUrl + 'Definitions/ProductDefinitionField/' + definitionFieldId + '/delete');
        },
        
        deleteDynamicDefinition: function (definitionId) {
        	return $http["delete"](serviceUrl + 'Definitions/DynamicDefinition/' + definitionId + '/delete');
        },
        
        deleteDynamicDefinitionField: function (definitionFieldId) {
        	return $http["delete"](serviceUrl + 'Definitions/DynamicDefinitionField/' + definitionFieldId + '/delete');
        },
        
        deleteDataType: function (dataTypeId) {
        	return $http["delete"](serviceUrl + 'Definitions/DataType/' + dataTypeId + '/delete');
        },
        
        deleteDataTypeEnum: function (dataTypeEnumId) {
        	return $http["delete"](serviceUrl + 'Definitions/DataTypeEnum/' + dataTypeEnumId + '/delete');
        }
    };
}

