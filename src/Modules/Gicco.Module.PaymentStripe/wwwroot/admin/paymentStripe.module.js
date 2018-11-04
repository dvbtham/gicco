/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.paymentStripe', [])
        .config(['$stateProvider',
            function ($stateProvider) {
                $stateProvider
                    .state('app.system.payments-stripe-config', {
                        url: '/payments/stripe/config',
                        templateUrl: 'modules/paymentstripe/admin/stripe/stripe-config-form.html',
                        controller: 'StripeConfigFormCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Payment Stripe")}}'
                        }
                    });
            }
        ]);
})();
