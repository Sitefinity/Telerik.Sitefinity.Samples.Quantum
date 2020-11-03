var uc_tree_service = function (catalogResource, marketingResource, settingsResource, treeResource) {
	return {
		deleteItem: function(node) {

			switch (node.nodeType) {
				// Product Catalog
			case 'productCatalogGroup':
				return catalogResource.deleteCatalogGroup(node.id);
			case 'productCatalog':
				return catalogResource.deleteCatalog(node.id);
			case 'productCategory':
				return catalogResource.deleteCategory(node.id);
			case 'product':
				return catalogResource.deleteProduct(node.id);
			case 'productVariant':
				return catalogResource.deleteProduct(node.id);
			// Marketing
			case 'campaign':
				return marketingResource.deleteCampaign(node.id);
			case 'campaignItem':
				return marketingResource.deleteCampaignItem(node.id);
			// Settings Product Catalog
			case 'settingsCatalogPriceGroup':
				return settingsResource.deleteCatalogPriceGroup(node.id);
			case 'settingsCatalogProductRelation':
				return settingsResource.deleteCatalogProductRelation(node.id);
			// Settings Orders
			case 'shippingMethod':
				return settingsResource.deleteShippingMethod(node.id);
			case 'paymentMethod':
				return settingsResource.deletePaymentMethod(node.id);
			case 'country':
				return settingsResource.deleteCountry(node.id);
			case 'currency':
				return settingsResource.deleteCurrency(node.id);
			case 'orderNumber':
				return settingsResource.deleteOrderNumber(node.id);
			// Settings Email
			case 'settingsEmailProfile':
				return settingsResource.deleteEmailProfile(node.id);
			case 'settingsEmailType':
				return settingsResource.deleteEmailType(node.id);
			// Settings Definitions
			case 'settingsDefinitionsProductDefinition':
				return settingsResource.deleteProductDefinition(node.id);
			case 'settingsDefinitionsProductDefinitionField':
				return settingsResource.deleteProductDefinitionField(node.id);
			case 'settingsDefinitionsDynamicDefinition':
				return settingsResource.deleteDynamicDefinition(node.id);
			case 'settingsDefinitionsDynamicDefinitionField':
				return settingsResource.deleteDynamicDefinitionField(node.id);
			case 'settingsDefinitionsDataType':
				return settingsResource.deleteDataType(node.id);
			case 'settingsDefinitionsDataTypeEnum':
				return settingsResource.deleteDataTypeEnum(node.id);
						
			}
			return null;
		},

		loadChildNodes: function (node) { 
			return treeResource.getChildren('tree', node.nodeType, node.id);
		},
			
		loadRootNode: function() {
			return treeResource.getRootNode('tree');
		}
	};

};
