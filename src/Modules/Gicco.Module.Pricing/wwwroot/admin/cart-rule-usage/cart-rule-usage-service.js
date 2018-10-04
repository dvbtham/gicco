/*global angular*/
(function () {
    angular
        .module('giccoAdmin.pricing')
        .factory('cartRuleUsageService', cartRuleUsageService);

    /* @ngInject */
    function cartRuleUsageService($http) {
        var service = {
            getCartRuleUsages: getCartRuleUsages
        };
        return service;

        function getCartRuleUsages(params) {
            return $http.post('api/cart-rule-usages/grid', params);
        }
    }
})();