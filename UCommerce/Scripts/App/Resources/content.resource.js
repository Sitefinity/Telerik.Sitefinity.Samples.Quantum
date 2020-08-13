var uc_content_resource = function ($http) {
    function getVirtualAppPath() {

        if (UcommerceClientMgr != null) {
            if (UcommerceClientMgr.UseBaseServiceUrlExplicit === true) {
                return UcommerceClientMgr.BaseServiceUrl;
            }
        }

        var path = '/' + location.pathname.split('/')[1];
        if (path === "/CMSModules"
          || path.toLowerCase() === "/sitecore%20modules"
          || path.toLowerCase() === "/umbraco"
          || path.toLowerCase() === "/ucommerce") {
            path = "";
        }
        return path;
    }

    var virtualAppPath = getVirtualAppPath();
    var serviceUrl = virtualAppPath + '/ucommerceapi/';
    if (UcommerceClientMgr != null) {
        if (UcommerceClientMgr.UseBaseServiceUrlExplicit === true) {
            serviceUrl = UcommerceClientMgr.BaseServiceUrl;
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