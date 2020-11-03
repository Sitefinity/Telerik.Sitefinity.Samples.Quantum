var uc_content_picker_service = function (uCommerceContentResource) {
	return {
		getImageUrl: function(imageId) {
			return uCommerceContentResource.getImageUrl(imageId);
		},
			
		getRootNode: function(contentType) {
			return uCommerceContentResource.getRootNode(contentType);
		},
			
		getChildren: function(contentType, nodeType, nodeId) {
			return uCommerceContentResource.getChildren(contentType, nodeType, nodeId);
		},

		getNodes: function(nodeTypes, nodeIds) {
			return uCommerceContentResource.getNodes(nodeTypes, nodeIds);
		}
	};
};




