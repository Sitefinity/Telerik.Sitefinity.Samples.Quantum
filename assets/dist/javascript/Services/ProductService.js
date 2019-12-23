angular.module('app').service('ProductService', ProductService);

function ProductService($http) {
    var service = {
        productGuid: "",
        variantGuid: "",
        price: 0,
        listPrice: 0,
        getPrices: getPrices,
        variantUpdated: variantUpdated
    };

    function variantUpdated() {
        var variantSelector = document.getElementById('variantSku');
        service.variantGuid = variantSelector.options[variantSelector.selectedIndex].dataset.variantGuid;

        getPrices();
    }


    function getPrices() {
        $http.post('/ProductApi/productPrices',
            {
                ProductGuid: service.productGuid,
                VariantGuid: service.variantGuid
            },
            {
                dataType: "application/json"
            }).then(function (response) {
                if (response.data) {
                    for (var i = 0; i < response.data.length; i++) {
                        var pricePoint = response.data[i];

                        if (service.variantGuid && service.variantGuid === pricePoint.ProductGuid) {
                            service.listPrice = pricePoint.ListPrice;
                            service.price = pricePoint.Price;
                            break;
                        }

                        if (service.variantGuid && service.productGuid === pricePoint.ProductGuid) {
                            service.listPrice = pricePoint.ListPrice;
                            service.price = pricePoint.Price;
                        }
                    }

                    //AngularJS adds first options for the ng-model and ng-change requires a ng-model
                    var variantSelector = document.getElementById('variantSku');
                    if (variantSelector.options[0].text === "")
                        variantSelector.remove(0);
                }
            });
    }

    return service;
}