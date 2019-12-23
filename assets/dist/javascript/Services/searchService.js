angular.module('app').service('SearchService', SearchService);

function SearchService($http) {
    var urlParams = new URLSearchParams(window.location.search);
    var searchQuery = urlParams.get('search');

    var service = {
        searchQuery: searchQuery,
        showSearchBar: false,
        showFilter: false,
        toggleSearchBar: toggleSearchBar,
        toggleFilter: toggleFilter,
        search: search,
        searchResult: [],
        suggestions: []
    };

    function toggleSearchBar() {
        service.showSearchBar = !service.showSearchBar;
    }

    function toggleFilter() {
        service.showFilter = !service.showFilter;
    }

    function search() {
        $http.post('/SearchApi/FullText',
            {
                SearchQuery: service.searchQuery
            },
            {
                dataType: "application/json"
            }).then(function (response) {
                if (response.data)
                    service.searchResult = response.data;
            });
        
        $http.post('/SearchApi/Suggestions',
            {
                SearchQuery: service.searchQuery
            },
            {
                dataType: "application/json"
            }).then(function (response) {
                if (response.data)
                    service.suggestions = response.data;
            });
    }

    return service;
}