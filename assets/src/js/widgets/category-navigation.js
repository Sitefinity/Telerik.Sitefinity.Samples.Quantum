import { initializeComponent } from "../functions/init";
import dropdownMenu from "../components/dropdown-menu";
import search from '../components/search';
import currencySelector from '../components/currency-selector';

initializeComponent("category-navigation", initCategories);

function initCategories(rootElement) {
    const scriptElement = rootElement.querySelector('script[data-items]');
    const items = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).items;
    new Vue({
        el: '#' + rootElement.id,
        props: {
            showFilter: {
                type: Boolean,
                default: false
            },
            purl: {
                type: String,
                default: false
            }
        },
        data: {
            items: items,
            numberOfItemsInBasket: 5
        },
        components: {
            dropdownMenu,
            search,
            currencySelector
        },
        methods: {
            toggleSearchBar: function () {

                var searchComponent = this.$refs['search'];
                if (searchComponent) {
                    searchComponent.toggleSearchBar();
                }
            },
            toggleFilter: function () {

                this.showFilter = !this.showFilter;
            }
        }
    });
}