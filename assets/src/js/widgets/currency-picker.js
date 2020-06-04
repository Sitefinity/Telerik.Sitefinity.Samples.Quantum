import { initializeComponent } from "../functions/init";
import currencySelector from '../components/currency-selector';

initializeComponent("currency-picker", initCurrencies);

function initCurrencies(rootElement) {
    const scriptElement = rootElement.querySelector('script[data-items]');
    const items = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).items;
    new Vue({
        el: '#' + rootElement.id,
        props: {
            purl: {
                type: String,
                default: false
            }
        },
        data: {
            items: items,
        },
        components: {
            currencySelector
        }
    });
}