/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.payments', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider.state('app.system.payment-providers', {
                url: '/payment-providers',
                templateUrl: "modules/payments/admin/provider/payment-provider-list.html",
                controller: 'PaymentProviderListCtrl as vm',
                ncyBreadcrumb: {
                    label: '{{ ::vm.translate.get("Payment Providers")}}'
                }
            });
        }]);
})();
