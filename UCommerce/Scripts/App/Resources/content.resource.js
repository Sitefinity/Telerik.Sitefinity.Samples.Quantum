var uc_content_resource = function ($http) {
    function getVirtualAppPath() {

        if (UCommerceClientMgr != null) {
            if (UCommerceClientMgr.UseBaseServiceUrlExplicit === true) {
                return UCommerceClientMgr.BaseServiceUrl;
            }
        }

        var path = '/' + location.pathname.split('/')[1];
        if (path === "/CMSModules") path = "";
        if (path === "/Sitecore%20Modules") path = "";
        if (path === "/sitecore%20modules") path = "";
        if (path === "/umbraco") path = "";
        if (path === "/Umbraco") path = "";
        if (path === "/ucommerce") path = "";

        return path;
    }

    var virtualAppPath = getVirtualAppPath();
    var serviceUrl = virtualAppPath + '/ucommerceapi/';
    if (UCommerceClientMgr != null) {
        if (UCommerceClientMgr.UseBaseServiceUrlExplicit === true) {
            serviceUrl = UCommerceClientMgr.BaseServiceUrl;
        }
    }

    return {
        getImageUrl: function (id) {
            return $http.get(serviceUrl + 'Content/ImageUrl/' + id + top.location.search).then(function (response) {
                return response.data.ImageUrl;
            });
        },

        getRootNode: function (contentType) {
            return $http.get(serviceUrl + 'Content/' + contentType + '/RootNode' + top.location.search).then(function (response) {
                var data = response.data;
                return data;
            });
        },

        getChildren: function (contentType, nodeType, nodeId) {
            return $http.get(serviceUrl + 'Content/' + contentType + '/Children/' + nodeType + '/' + nodeId + top.location.search).then(function (response) {
                var data = response.data;
                return data;
            });
        },

        getNodes: function (nodeTypes, nodeIds) {
            var formData = {
                'PreSelectedValues': nodeIds,
                'NodeTypes': nodeTypes
            }

            return $http.post(
				serviceUrl + 'Content/Nodes',
				formData,
				{
				    dataType: "application/json"
				}
			);
        }
    };

}