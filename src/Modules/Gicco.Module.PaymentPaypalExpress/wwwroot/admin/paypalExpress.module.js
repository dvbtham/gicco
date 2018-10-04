/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.paymentPaypalExpress', [])
        .config(['$stateProvider',
            function ($stateProvider) {
                $stateProvider
                    .state('payments-paypalExpress-config', {
                        url: '/payments/paypal-express/config',
                        templateUrl: 'modules/paymentpaypalexpress/admin/config/config-form.html',
                        controller: 'PaypalExpressConfigFormCtrl as vm', parent: 'base'
                    })
                    ;
            }
        ]);
})();
