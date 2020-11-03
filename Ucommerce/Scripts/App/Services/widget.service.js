var uc_widget_service = function (uCommerceWidgetResource) {
	return {

		getAllWidgets: function() {
			return uCommerceWidgetResource.getAllWidgets();
		},

		loadWidgets: function (section) {
			return uCommerceWidgetResource.loadWidgets(section);
		},

		updateWidget: function (widget) {
			return uCommerceWidgetResource.updateWidget(widget);
		},

		addWidget: function(selection) {
			return uCommerceWidgetResource.addWidget(selection);
		},

		removeWidget: function(widget) {
			uCommerceWidgetResource.removeWidget(widget);
		}

	};
}


