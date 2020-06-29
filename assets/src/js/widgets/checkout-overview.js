import { initializeComponent } from "../functions/init";
import checkoutNavigation from "../components/checkout-navigation";
import store from '../store';

import { mapState } from 'vuex';

initializeComponent("checkout-overview", initCart);

function initCart(rootElement) {
    new Vue({
        el: '#' + rootElement.id,
        store,
        props: ['purl'],
        data: {
            model: null
        },
        computed: {
            ...mapState([
                'updateIteration',
                'allowNavigate'
            ]),
        },
        watch: {
            updateIteration: function () {
                this.fetchData();
            },
            allowNavigate: function () {
                this.submit();
            }
        },
        components: {
            checkoutNavigation
        },
        methods: {
            fetchData: function () {
                this.$http.get(this.purl + '/uc/checkout/preview', {}).then((response) => {
                    if (response.data &&
                        response.data.Status &&
                        response.data.Status == 'success' &&
                        response.data.Data && response.data.Data.data) {
                        
                        this.model = response.data.Data.data;
                    }
                    else {
                        this.model = null;
                    }
                });
            },
            continueFn: function (callback) {
                // Prevent the default redirect action
                callback(false);

                if (this.$store.state.widgets.length) {
                    this.$store.commit('triggersubmit');
                }
                else {
                    this.submit();
                }
            },
            submit: function () {
                this.$http.post(this.purl + '/uc/checkout/complete-order', {}).then((response) => {
                    if (response.data) {
                        var data = response.data;

                        if (data.Status && data.Status == 'success') {
                            // If the transaction is completed, redirect the user the the payment URL
                            location.href = data.Message;
                        }
                        else {
                            console.error('Order not complete!');
                        }
                    }
                });
            }
        },
        created: function () {
            var scriptElement = rootElement.querySelector('script[purl]');
            this.purl = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).purl;
            this.fetchData();
        }
    });
}

