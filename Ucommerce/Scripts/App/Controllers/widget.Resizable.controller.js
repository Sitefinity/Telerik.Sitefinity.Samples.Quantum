function uc_widgetResizableController($scope) {
	
	$.fn.textfill = function (options) {
		return this.each(function () {
			var text = $(this).html();
			var oldFontSize = parseInt($(this).css("font-size"));
			var contentFontSizes = [];
			$(this).find('*').each(function (i, e) {
				contentFontSizes[i] = parseInt($(this).css("font-size"));
			});
			$(this).html('');
			var container = $('<span />').html(text).appendTo($(this));
			var min = 1, max = 200, fontSize;
			do {
				fontSize = (max + min) / 2;
				container.css('fontSize', fontSize);
				container.find('*').each(function (i, e) {
					$(this).css("font-size", fontSize);
				});
				var multiplier = $(this).height() / container.height();
				if (multiplier == 1) { min = max = fontSize }
				if (multiplier > 1) { min = fontSize }
				if (multiplier < 1) { max = fontSize }
			} while ((max - min) > 1);
			fontSize = min;
			coef = fontSize / oldFontSize;
			if ($(this).width() < container.width()) {
				min = 1;
				do {
					fontSize = (max + min) / 2;
					container.css('fontSize', fontSize);
					container.find('*').each(function (i, e) {
						$(this).css("font-size", fontSize);
					});
					var multiplier = $(this).width() / container.width();
					if (multiplier == 1) { min = max = fontSize }
					if (multiplier > 1) { min = fontSize }
					if (multiplier < 1) { max = fontSize }
				} while ((max - min) > 1);
				fontSize = min;
				coef = fontSize / oldFontSize;
			}
			container.remove();
			$(this).html(text);
			var minFontSize = options.minFontPixels;
			var maxFontSize = options.maxFontPixels;
			var newFontSize = minFontSize && (minFontSize > fontSize) ?
				minFontSize :
						maxFontSize && (maxFontSize < fontSize) ?
				maxFontSize :
						fontSize;

			coef = minFontSize && (minFontSize > fontSize) ?
						minFontSize / oldFontSize :
						maxFontSize && (maxFontSize < fontSize) ?
						maxFontSize / oldFontSize :
						coef;
			$(this).find('*').each(function (i, e) {
				$(this).css("font-size", newFontSize);
			});
			$(this).css('fontSize', newFontSize);
		});
	};

	$scope.recalculateTextSize = function () {
		setTimeout(function () {
			var elm = $($scope.elm.parent());

			elm.textfill({ minFontPixels: 20 });
		}, 100);
	}

	$scope.recalculateTextSize();
}

