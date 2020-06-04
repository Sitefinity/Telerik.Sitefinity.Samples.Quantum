import { initializeComponent } from "../functions/init";

initializeComponent("facet-selector", initFacetFilter);

function initFacetFilter(rootElement) {
    const scriptElement = rootElement.querySelector('script[data-facets=true]');
    const facets = scriptElement === null ? [] : JSON.parse(scriptElement.innerHTML).facets;
    new Vue({
        el: '#' + rootElement.id,
        data: {
            facets: facets
        },
        created: function () {
            var result = {},
                queryString = location.search.slice(1),
                re = /([^&=]+)=([^&]*)/g,
                m;

            while (m = re.exec(queryString)) {
                result[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
            }

            var params = result;

            for (var propertyName in params) {
                var values = params[propertyName].split('|');
                var item = this.facets.find(facet => facet.Name === propertyName);
                if (typeof item !== 'undefined') {
                    for (var i = 0; i < values.length; i++) {
                        if (values[i].length > 0 && values[i] !== "|") {
                            var mathingFilterIndex = item.FacetValues.findIndex(filter => filter.FacetValueName === values[i]);
                            if (mathingFilterIndex > -1)
                                item.FacetValues[mathingFilterIndex]["Checked"] = true;
                        }
                    }
                }
            }
        },
        computed: {
            activeClass: function (filter) {
                return filter !== null && filter.hasOwnProperty("Checked") ? filter["Checked"] : false;
            }
        },
        methods: {
            clearFilters: function () {
                window.location.href = window.location.pathname;
            },
            filterProducts: function (filter) {
                var queryStrings = {};
                var baseUrl = window.location.href.split('?')[0] + '?';

                for (var i = 0; i < this.facets.length; i++) {
                    var checkedFacets = this.facets[i].FacetValues.filter(f => f.Checked === true);
                    var value = checkedFacets.map(f => { return f.FacetValueName + '|'; }).join('');
                    var key = this.facets[i].Name;
                    if (value.length > 0) {
                        queryStrings[key] = value;
                    }
                }

                for (var propertyName in queryStrings) {
                    baseUrl += propertyName + '=' + queryStrings[propertyName] + '&';
                }
                var newUrl = baseUrl.substring(0, baseUrl.length - 1);
                window.location.href = newUrl;
            }
        }
    });
}