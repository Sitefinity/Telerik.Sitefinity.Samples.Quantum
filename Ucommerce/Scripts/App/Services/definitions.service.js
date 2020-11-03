var uc_definitions_service = function (uCommerceDefinitionsResource) {
	return {
        getDefinitionGraph: function (id) {
			return uCommerceDefinitionsResource.getDefinitionGraph(id);
        },

		saveDefinitionGraph: function (definitionGraph, id) {
			return uCommerceDefinitionsResource.saveDefinitionGraph(definitionGraph, id);
        }
	};
}