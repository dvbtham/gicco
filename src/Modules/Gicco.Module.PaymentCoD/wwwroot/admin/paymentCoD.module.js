/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.paymentCoD', [])
        .config(['$stateProvider',
            function ($stateProvider) {
                $stateProvider
                    .state('payments-cod-config', {
                        url: '/payments/cod/config',
                        templateUrl: 'modules/paymentcod/admin/config/config-form.html',
                        controller: 'CoDConfigFormCtrlas vm', parent: 'base'
                    })
                    ;
            }
        ]);
})();
