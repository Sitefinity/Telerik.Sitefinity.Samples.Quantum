var uc_splitter = function () {
	return {
		restrict: 'E',
		transclude: true,
		replace: true,
		scope: true,
		templateUrl: 'App/Directives/ucommerce-splitter/ucommerce.splitter.html',
		link: function (scope, elm, attrs) {

			var lefts = attrs["left"].split('|');
			var rights = attrs["right"].split('|');

			if (scope.disableResize && scope.disableResize.toLowerCase() == "true") {
				$(elm).remove();
				
				if (scope.fixedLeftSize && scope.fixedLeftSize != '') {

					var actualWidth = scope.fixedLeftSize;
					if (actualWidth.indexOf('px') >= 0) {
						for (left in lefts) {
							$(lefts[left]).width(actualWidth);
						}

						for (right in rights) {
							$(rights[right]).css('width', 'calc(100% - '+ actualWidth +')');
						}
					}

					else 
					
					for (n in lefts) {
						$(lefts[n]).width(actualWidth);
					}

					var totalRightSize = 100 - actualWidth;
					for (n in rights) {
						$(rights[n]).width(totalRightSize+'%');
					}
				}

				return;
			}

			var minWidthPercent = attrs["minWidthLeft"];
      var maxWidthPercent = attrs["maxWidthLeft"];

      var resizeImmediately = scope.resizeImmediately == true;
			var x = 0;
			var newRightWidthPercent = 0;
			var newRight = '';
			var newLeftWidthPercent = 0;
			var newLeft = '';
			var dragged = false;
      elm.mousedown(function (event) {
          angular.element('.ui-splitter .ui-splitter-top').css('position', 'fixed');
          //angular.element('.ui-splitter .ui-splitter-top').css('background', 'url("../images/transparent.gif")');
          angular.element('.ui-splitter .ui-splitter-top').css('background', 'red');

          if (!resizeImmediately) {
              angular.element('.ui-splitter .ui-splitter-top').css('position', 'fixed');
              angular.element('.ui-splitter .ui-splitter-top').css('background', 'url("../images/transparent.gif")');
              angular.element('.ui-splitter .ui-splitter-bottom').css('visibility', 'visible');
              angular.element('.ui-splitter .ui-splitter-bottom').css('position', 'fixed');
              angular.element('.ui-splitter .ui-splitter-bottom').css('height', '100%');
          }

          $(document).mousemove(function (e) {
            if (resizeImmediately) {
                //for Umbraco8 it has been introduced to resize immediatley, and we want to use flex instead of %. So this is why this only supports flex right now. In case more CMSes want to support it, but in %, 
                //it has to be refactored.
                dragged = true;

                x = e.pageX;

                for (var i = 0; i < lefts.length; i++) {
                    var element = angular.element(lefts[i]);
                    $(element).css('flex', '0 0 ' + x + 'px');
                }

            } else {
                dragged = true;

                x = e.pageX;

                var documentWidth = angular.element(window).width();
                var xPercent = (x / documentWidth) * 100;
                if (xPercent <= maxWidthPercent && xPercent >= minWidthPercent) {

                    angular.element('.ui-splitter .ui-splitter-bottom').css('left', e.pageX);
                    newLeft = xPercent + '%';
                    var newLeftWidth = x;
                    newLeftWidthPercent = (newLeftWidth / documentWidth) * 100;
                    newRightWidthPercent = 100 - newLeftWidthPercent - 0.3;
                    newRight = newRightWidthPercent + '%';
                }
            }
				});
      });
      elm.mouseup(function (e) {
          if (resizeImmediately) {
              $(document).unbind("mousemove");
              dragged = false;
          }
          if (dragged) {
              dragged = false;

              for (var i = 0; i < lefts.length; i++) {
                  var element = angular.element(lefts[i]);
                  element.width(newLeft);
              }
              for (i = 0; i < rights.length; i++) {
                  var element = angular.element(rights[i]);
                  element.width(newRight);
              }
          }
          angular.element('.ui-splitter .ui-splitter-top').css('position', 'static');
          angular.element('.ui-splitter .ui-splitter-top').css('background', '#d2d5da');

          angular.element('.ui-splitter .ui-splitter-bottom').css('position', 'static');
          angular.element('.ui-splitter .ui-splitter-bottom').css('height', '0px');
          angular.element('.ui-splitter .ui-splitter-bottom').css('left', newLeft);
          angular.element('.ui-splitter .ui-splitter-bottom').css('visibility', 'hidden');

          $(document).unbind("mousemove");
      });
		}
	};
}