export var initializeComponent = function (dataComponentName, callbackFunction) {
    if (typeof dataComponentName === 'string' && dataComponentName.length > 0 && typeof callbackFunction === 'function') {
        var querySelectorExpression = "[data-component='" + dataComponentName + "']";
        if (window.personalizationManager) {
            window.personalizationManager.addPersonalizedContentLoaded(function () {
                initFunction(querySelectorExpression, callbackFunction);
            });
        } else {
            document.addEventListener('DOMContentLoaded', function () {
                initFunction(querySelectorExpression, callbackFunction);
            });
        }
    }
};

function initFunction(querySelectorExpression, callbackfunction) {
    var componentRootElements = document.querySelectorAll(querySelectorExpression);
    for (var i = 0; i < componentRootElements.length; i++) {
        var rootElement = componentRootElements[i];
        callbackfunction(rootElement);
    }
}