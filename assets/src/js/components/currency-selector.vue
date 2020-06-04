<script>
    export default {
        name: "currencySelector",
        template: '#currency-selector-template',
        data() {
            return {
                showCurrencies: false
            }
        },
        props: {
            currencies: [],
            serializedCurrencies: String,
            currentCurrency: {},
            serializedCurrentCurrency: String,
            rootId: String
        },
        created() {
            this.currencies = JSON.parse(this.serializedCurrencies);
            this.currentCurrency = JSON.parse(this.serializedCurrentCurrency);
        },
        methods: {
            toggleCurrenciesVisibility: function () {
                this.showCurrencies = !this.showCurrencies;
            },
            setCurrency: function (priceGroupId) {
                var routesSelector = '#' + this.rootId + ' .changePriceGroupUrl';
                var routeUrlContainers = document.querySelectorAll(routesSelector);
                if (routeUrlContainers && routeUrlContainers.length > 0) {
                    var changePriceGroupUrl = '/' + routeUrlContainers[0].value;

                    this.$http.put(changePriceGroupUrl, { PriceGroupId: priceGroupId })
                        .then(function (response) {
                            location.reload();
                        });
                }
            }
        }
    };
</script>