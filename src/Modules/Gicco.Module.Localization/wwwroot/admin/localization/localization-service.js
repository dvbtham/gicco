/*global angular*/
(function () {
    angular
        .module('giccoAdmin.localization')
        .factory('localizationService', localizationService);

    /* @ngInject */
    function localizationService($http) {
        var service = {
            getCultures: getCultures,
            getResources: getResources,
            createResource: createResource,
            deleteResource: deleteResource,
            updateResources: updateResources
        };
        return service;

        function getCultures() {
            return $http.get('api/localization/get-cultures');
        }

        function getResources(params) {
            return $http.get('api/localization/get-resources', params);
        }

        function createResource(cultureId, resources) {
            return $http.post('api/localization/create-resources?cultureId=' + cultureId, resources);
        }

        function deleteResource(cultureId, resource) {
            return $http.post('api/localization/delete-resource?cultureId=' + cultureId, resource);
        }

        function updateResources(cultureId, resources) {
            return $http.post('api/localization/update-resources?cultureId=' + cultureId, resources);
        }
    }
})();
