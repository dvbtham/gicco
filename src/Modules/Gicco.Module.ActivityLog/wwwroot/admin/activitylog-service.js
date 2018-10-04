/*global angular*/
(function () {
    angular
        .module('giccoAdmin.activityLog')
        .factory('activityLogService', activityLogService);

    /* @ngInject */
    function activityLogService($http) {
        var service = {
            getMostViewedEntities: getMostViewedEntities
        };
        return service;

        function getMostViewedEntities(entityTypeId) {
            return $http.get('api/activitylog/most-viewed-entities/' + entityTypeId);
        }
    }
})();