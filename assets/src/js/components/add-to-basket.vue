<script>
    const addToBasketSuccessMessage = 'Added to basket';
    const addToBasketFailedMessage = 'Not added to basket';

    export default {
        name: "addToBasket",
        template: '#add-to-basket-template',
        props: {
            productSku: {
                type: String,
                default: null
            },
            selectedVariants: {
                type: Object,
                default: null
            },
            addToBasketMessage: String,
            showAddToBasketMessage: Boolean,
            quantity: {
                type: Number,
                default: 1
            },
            rootId: String
        },
        methods: {
            addToBasket: function () {
                var store = this.$root.$store;
                var addToBasketSuccessMessage = this.$root.$refs.addToBasket.value;
                var addToBasketFailedMessage = this.$root.$refs.notAddToBasket.value;

                var routesSelector = '#' + this.rootId + ' .addToBasketUrl';
                var addToBasketUrlContainers = document.querySelectorAll(routesSelector);
                if (addToBasketUrlContainers && addToBasketUrlContainers.length > 0) {
                    var addToBasketUrl = '/' + addToBasketUrlContainers[0].value;

                    var productQuantity = 1;
                    if (this.quantity !== '' && !isNaN(this.quantity)) {
                        productQuantity = parseInt(this.quantity);
                    }

                    var variants = [];

                    if (this.selectedVariants) {
                        for (var i = 0; i < Object.keys(this.selectedVariants).length; i++) {
                            variants.push(this.selectedVariants[Object.keys(this.selectedVariants)[i]]);
                        }
                    }

                    var addToBasketModel = { Quantity: productQuantity, Sku: this.productSku, Variants: variants };

                    this.$http.post(addToBasketUrl, addToBasketModel)
                        .then(function (response) {
                            if (response.data.Status && response.data.Status == 'failed') {
                                this.addToBasketMessage = response.data.Message;
                                this.showAddToBasketMessage = true;

                                setTimeout(() =>
                                    this.showAddToBasketMessage = false,
                                    5000);
                            }
                            else {
                                this.addToBasketMessage = addToBasketSuccessMessage;
                                this.showAddToBasketMessage = true;

                                if (store) {
                                    store.commit('update');
                                }

                                setTimeout(() =>
                                    this.showAddToBasketMessage = false,
                                    5000);
                            }
                        }, function (error) {
                            this.addToBasketMessage = addToBasketFailedMessage;
                            this.showAddToBasketMessage = true;

                            setTimeout(() =>
                                this.showAddToBasketMessage = false,
                                5000);
                        });
                }
            }
        }
    };
</script>