import { initializeComponent } from "../functions/init";
import addToBasket from '../components/add-to-basket';
import store from '../store';

initializeComponent("products", initProducts);

function initProducts(rootElement) {
    const scriptElement = rootElement.querySelector('script[data-variants=true]');
    var variants = [];
    if (scriptElement) {variants
        var prodVariants = JSON.parse(scriptElement.innerHTML).variants;

        for (var i = 0; i < prodVariants.length; i++) {
            variants.push({ Item: prodVariants[i], Current: prodVariants[i].Values[0] });
        }
    }
    
    new Vue({
        el: '#' + rootElement.id, 
        store,
        data: {
            variants: variants,
            addToBasket: null,
            notAddToBasket: null,
            selectedVariants: {}
        },
        components: {
            addToBasket
        },
        props: {
            productGuid: '',
            variantGuid: '',
            price: 0,
            listPrice: 0
        },
        methods: {
            onChange(event, variant) {
                this.selectedVariants[variant.TypeName] = variant;
            },
            getPrices: function () {
                this.$http.post('/ProductApi/productPrices',
                    {
                        ProductGuid: this.productGuid,
                        VariantGuid: this.variantGuid
                    }).then(function (response) {
                        if (response.data) {
                            for (var i = 0; i < response.data.length; i++) {
                                var pricePoint = response.data[i];

                                if (this.variantGuid && this.variantGuid === pricePoint.ProductGuid) {
                                    this.listPrice = pricePoint.ListPrice;
                                    this.price = pricePoint.Price;
                                    break;
                                }

                                if (this.variantGuid && this.productGuid === pricePoint.ProductGuid) {
                                    this.listPrice = pricePoint.ListPrice;
                                    this.price = pricePoint.Price;
                                }
                            }
                        }
                    });
            }
        }
    });
}




