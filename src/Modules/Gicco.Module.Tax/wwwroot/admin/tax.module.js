/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.tax', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('tax-classes', {
                    url: '/tax-classes',
                    templateUrl: 'modules/tax/admin/tax-class/tax-class-list.html',
                    controller: 'TaxClassListCtrl as vm', parent: 'base'
                })
                .state('tax-classes-create', {
                    url: '/tax-classes/create',
                    templateUrl: 'modules/tax/admin/tax-class/tax-class-form.html',
                    controller: 'TaxClassFormCtrl as vm', parent: 'base'
                })
                .state('tax-classes-edit', {
                    url: '/tax-classes/edit/:id',
                    templateUrl: 'modules/tax/admin/tax-class/tax-class-form.html',
                    controller: 'TaxClassFormCtrl as vm', parent: 'base'
                })
                .state('tax-rates', {
                    url: '/tax-rates',
                    templateUrl: 'modules/tax/admin/tax-rate/tax-rate-list.html',
                    controller: 'TaxRateListCtrl as vm', parent: 'base'
                })
                .state('tax-rates-create', {
                    url: '/tax-rates/create',
                    templateUrl: 'modules/tax/admin/tax-rate/tax-rate-form.html',
                    controller: 'TaxRateFormCtrl as vm', parent: 'base'
                })
                .state('tax-rates-import', {
                    url: '/tax-rates/import',
                    templateUrl: 'modules/tax/admin/tax-rate/tax-rate-import.html',
                    controller: 'TaxRateImportFormCtrl as vm', parent: 'base'
                })
                .state('tax-rates-edit', {
                    url: '/tax-rates/edit/:id',
                    templateUrl: 'modules/tax/admin/tax-rate/tax-rate-form.html',
                    controller: 'TaxRateFormCtrl as vm', parent: 'base'
                });
        }]);
})();
