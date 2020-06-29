import { initializeComponent } from "../functions/init";
import checkoutNavigation from "../components/checkout-navigation";
import store from '../store';

import { mapState } from 'vuex';

initializeComponent("cart", initCart);

function initCart(rootElement) {
    new Vue({
        el: '#' + rootElement.id,
        store,
        props: ['purl'],
        data: {
            model: null,
            hasVoucher: false
        },
        computed: {
            ...mapState([
                'triggerSubmit'
            ])
        },
        watch: {
            triggerSubmit: function() {
                this.submit((success) => {
                    if (success) {
                        this.$store.dispatch('widgetSubmitted');
                    }
                });
            }
        },
        components: {
            checkoutNavigation
        },
        methods: {
            updateCartItems: function() {
                var model = this.model;
                var orderlineKeyValue = [];
                var store = this.$store;

                for (var item of model.OrderLines) {
                    var orderlineId = item.OrderLineId;
                    var orderlineQty = item.Quantity;
                    var currentKeyValue = { orderlineId, orderlineQty };
                    orderlineKeyValue.push(currentKeyValue);
                }

                this.$http.post(this.purl + '/uc/checkout/cart/update-basket',
                    {
                        RefreshBasket: orderlineKeyValue
                    }).then(function(response) {
                    if (response.data) {
                        if (response.data.Status && response.data.Status == 'failed') {
                            console.error(response.data.Message);
                        } else {
                            var data = response.data;
                            var updatedFields = ['SubTotal', 'TaxTotal', 'DiscountTotal', 'OrderTotal'];
                            var orderLineArray = [];

                            for (var field of updatedFields) {
                                model[field] = data[field];
                            }

                            for (var updatedItem of data.OrderLines) {
                                for (var currentItem of model.OrderLines) {
                                    if (currentItem.OrderLineId == updatedItem.OrderlineId) {
                                        orderLineArray.push(Object.assign({}, currentItem, updatedItem));
                                    }
                                }
                            }

                            model.OrderLines = orderLineArray;
                            store.commit('update');
                        }
                    }
                });
            },
            removeCartItem: function(itemId) {
                var model = this.model;
                var store = this.$store;

                this.$http.post(this.purl + '/uc/checkout/cart/remove-orderline',
                    {
                        orderlineId: itemId
                    }).then(function(response) {
                    if (response.data) {
                        var data = response.data;

                        if (data.OrderLines.length == 0) {
                            model.OrderLines = [];
                            store.commit('update');
                        } else {
                            // TODO: Set mapping fields in ViewModel
                            var updatedFields = ['SubTotal', 'TaxTotal', 'DiscountTotal', 'OrderTotal'];

                            for (var field of updatedFields) {
                                model[field] = data[field];
                            }

                            var updatedItems = [];

                            // generate new set without the removed item
                            for (var item of model.OrderLines) {
                                if (item.OrderLineId != itemId) {
                                    updatedItems.push(item);
                                }
                            }

                            model.OrderLines = updatedItems;
                            store.commit('update');
                        }
                    }
                });
            },
            applyVoucher: function() {
                var model = this.model;
                var voucher = model.Voucher;

                this.$http.post(this.purl + '/uc/checkout/cart/vouchers/add',
                    {
                        Vouchers: voucher
                    }).then(function(response) {
                    if (response.data) {
                        if (response.data.Status && response.data.Status == 'failed') {
                            console.error(response.data.Message);
                        } else {
                            var data = response.data;
                            var updatedFields = ['SubTotal', 'TaxTotal', 'DiscountTotal', 'OrderTotal'];
                            var orderLineArray = [];

                            for (var field of updatedFields) {
                                model[field] = data[field];
                            }

                            for (var updatedItem of data.OrderLines) {
                                for (var currentItem of model.OrderLines) {
                                    if (currentItem.OrderLineId == updatedItem.OrderlineId) {
                                        orderLineArray.push(Object.assign({}, currentItem, updatedItem));
                                    }
                                }
                            }

                            model.OrderLines = orderLineArray;

                            if (response.data.Voucher && response.data.Voucher.length) {
                                var vouchers = new Set(model.Discounts);
                                vouchers.add(response.data.Voucher[0]);
                                model.Discounts = vouchers;
                                model.Voucher = null;
                            }
                        }
                    }
                });
            },
            removeVoucher: function(vouchersTitle) {
                var model = this.model;
                var store = this.$store;

                this.$http.post(this.purl + '/uc/checkout/cart/vouchers/remove',
                    {
                        vouchers: vouchersTitle
                    }).then(function(response) {
                    if (response.data) {
                        var data = response.data;

                        // TODO: Set mapping fields in ViewModel
                        var updatedFields = ['SubTotal', 'TaxTotal', 'DiscountTotal', 'OrderTotal'];

                        for (var field of updatedFields) {
                            model[field] = data[field];
                        }

                        var updatedDiscounts = [];

                        // generate new set without the removed item
                        for (var item of model.Discounts) {
                            if (item != vouchersTitle) {
                                updatedDiscounts.push(item);
                            }
                        }

                        model.Discounts = updatedDiscounts;
                        store.commit('update');
                    }
                });
            },
            // required for consistency
            submit: function(callback) {
                callback(true)
            }
        },
        created: function () {
            var scriptElement = rootElement.querySelector('script[purl]');
            this.purl = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).purl;
            this.$store.commit('vuecreated', 'cart');

            this.$http.get(this.purl + '/uc/checkout/cart', {}).then((response) => {
                if (response.data &&
                    response.data.Status &&
                    response.data.Status == 'success' &&
                    response.data.Data &&
                    response.data.Data.data) {

                    this.model = response.data.Data.data;

                    if (this.model.Discounts.length) {
                        this.hasVoucher = true;
                    } else {
                        this.hasVoucher = false;
                    }
                } else {
                    this.model = null;
                }
            });
        }
    });
}