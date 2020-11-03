function uc_widgetResource($http) {
    var serviceUrl = UcommerceClientMgr.BaseServiceUrl + '/Widgets/';

    return {

		getAllWidgets: function() {
			return $http.get(serviceUrl + 'all').then(function (response) {
				return response.data;
			});
		},

        loadWidgets: function (section) {
        	return $http.get(serviceUrl + 'user/' + section).then(function (response) {
                return response.data;
            });
        },

        addWidget: function(selection) {
        	var url = serviceUrl+'user/addWidget';
	        return $http.post(
		        url,
		        {
		        	Section: selection.section,
		        	WidgetName: selection.widgetName
		        },
		        {
		        	dataType: "application/json"
		        }
	        );
        },

        updateWidget: function (widget) {
	        var url = serviceUrl + 'user/UpdateWidget';
        	$http.post(
        		url,
		        {
			        widget: widget
		        },
		        {
		        	dataType: "application/json"
		        }
	        );

	        return '';
        },

		removeWidget: function(widget) {
			var url = serviceUrl + 'user/RemoveWidget/' + widget.userWidgetSettings.userWidgetSettingId;
			$http.get(url);
		}
    };
}