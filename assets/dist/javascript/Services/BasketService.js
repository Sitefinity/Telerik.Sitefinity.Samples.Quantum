angular.module('app').service('BasketService', BasketService);

function BasketService($http) {

    var service = {
        getBasket: getBasket,
        loadBasket: loadBasket,
        updateLineItem: updateLineItem,
        showSidebarBasket: false,
        applyVoucher: applyVoucher,
        addToBasket: addToBasket,
        basket: {},
        toggleSideBarBasket: toggleSideBarBasket,
        setCurrency: setCurrency
    };

    function updateLineItem(orderLineId, newQuantity) {
        $http.post('/Basket/UpdateLineItem',
            {
                OrderlineId: orderLineId,
                NewQuantity: newQuantity
            },
            {
                dataType: "application/json"
            }).then(function (response) {
                service.basket = response.data;
            });
    }

    function applyVoucher(voucherCode) {
        $http.post('/Basket/AddVoucher',
            {
                VoucherCode: voucherCode
            },
            {
                dataType: "application/json"
            }).then(function (response) {
                service.basket = response.data;
            });
    }

    function addToBasket(addToBasketModel) {
        $http.post('/Basket/AddToBasket',
            addToBasketModel,
            {
                dataType: "application/json"
            }).then(function (response) {
                service.basket = response.data;
                service.toggleSideBarBasket();
            });
    }

    function toggleSideBarBasket() {
        service.showSidebarBasket = !service.showSidebarBasket;
    }

    function setCurrency(priceGroupId) {
        $http.post('/Basket/ChangePriceGroup',
            {
                PriceGroupId: priceGroupId
            },
            {
                dataType: "application/json"
            }).then(function (response) {
                console.log("I'm here");
                location.reload();
            });
    }

    function loadBasket() {
        return $http({
            method: 'GET',
            url: '/Basket/GetBasket'
        }).then(function successCallback(response) {
            service.basket = response.data;
        }), function errorCallback(response) {
        };
    }

    function getBasket() {
        return service.basket;
    }

    return service;
}