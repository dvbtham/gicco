/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.paymentStripe', [])
        .config(['$stateProvider',
            function ($stateProvider) {
                $stateProvider
                    .state('payments-stripe-config', {
                        url: '/payments/stripe/config',
                        templateUrl: 'modules/paymentstripe/admin/stripe/stripe-config-form.html',
                        controller: 'StripeConfigFormCtrl as vm', parent: 'base'
                    })
                ;
            }
        ]);
})();
