/*global angular*/
(function () {
    angular
        .module('giccoAdmin.search')
        .factory('searchService', searchService);

    /* @ngInject */
    function searchService($http) {
        var service = {
            getMostSearchKeywords: getMostSearchKeywords
        };
        return service;

        function getMostSearchKeywords() {
            return $http.get('api/search/most-search-keywords');
        }
    }
})();