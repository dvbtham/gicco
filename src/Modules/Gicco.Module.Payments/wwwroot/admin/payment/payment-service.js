/*global angular*/
(function () {
    angular
        .module('giccoAdmin.payments')
        .factory('paymentService', paymentService);

    /* @ngInject */
    function paymentService($http) {
        var service = {
            getPaymentsByOrder: getPaymentsByOrder
        };
        return service;

        function getPaymentsByOrder(orderId) {
            return $http.get('api/orders/' + orderId + '/payments');
        }
    }
})();