/*global angular*/
(function () {
    angular
        .module('giccoAdmin.paymentPaypalExpress')
        .factory('paypalExpressService', paypalExpressService);

    /* @ngInject */
    function paypalExpressService($http) {
        var service = {
            getSettings: getSettings,
            updateSetting: updateSetting
        };
        return service;

        function getSettings() {
            return $http.get('api/paypal-express/config');
        }

        function updateSetting(settings) {
            return $http.put('api/paypal-express/config', settings);
        }
    }
})();