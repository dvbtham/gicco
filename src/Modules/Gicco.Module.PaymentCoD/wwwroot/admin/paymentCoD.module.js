/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.paymentCoD', [])
        .config(['$stateProvider',
            function ($stateProvider) {
                $stateProvider
                    .state('app.system.payments-cod-config', {
                        url: '/payments/cod/config',
                        templateUrl: 'modules/paymentcod/admin/config/config-form.html',
                        controller: 'CoDConfigFormCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Payment COD")}}'
                        }
                    });
            }
        ]);
})();
