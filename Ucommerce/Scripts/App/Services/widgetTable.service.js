var uc_widget_table_service = function () {
	return {
		recalculateTable: function (table) {
			var tableHeaders = table.find('thead th');
			var widths = [tableHeaders.length];
			for (var i = 0; i < tableHeaders.length; i++) {
				widths[i] = tableHeaders[i].attributes['data-width'].value;
				tableHeaders[i].style.width = widths[i] + '% !important';
				tableHeaders[i].setAttribute('style', 'width:' + widths[i] + '% !important');
			}

			var tableRows = table.find('tbody tr');
			for (var i = 0; i < tableRows.length; i++) {
				var row = tableRows[i];
				for (var x = 0; x < row.children.length - 1; x++) {
					var header = $(tableHeaders[x]);
					row.children[x].setAttribute('style', 'width:' + (header.outerWidth() - (header.outerWidth() - header.width())) + 'px');
				}
			}

			var contentHeight = table.parent().height();
			var headerHeight = table.find('thead').height();
			var tbody = table.find('tbody');
			tbody.css('height', (contentHeight - headerHeight));
		}
	}
}