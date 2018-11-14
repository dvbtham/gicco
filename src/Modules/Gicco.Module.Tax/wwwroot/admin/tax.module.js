/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.tax', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('app.system.tax-classes', {
                    url: '/tax-classes',
                    templateUrl: 'modules/tax/admin/tax-class/tax-class-list.html',
                    controller: 'TaxClassListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Tax Classes")}}'
                    }
                })
                .state('app.system.tax-classes-create', {
                    url: '/tax-classes/create',
                    templateUrl: 'modules/tax/admin/tax-class/tax-class-form.html',
                    controller: 'TaxClassFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Tax Classes")}}'
                    }
                })
                .state('app.system.tax-classes-edit', {
                    url: '/tax-classes/edit/:id',
                    templateUrl: 'modules/tax/admin/tax-class/tax-class-form.html',
                    controller: 'TaxClassFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Tax Classes")}}'
                    }
                })
                .state('app.system.tax-rates', {
                    url: '/tax-rates',
                    templateUrl: 'modules/tax/admin/tax-rate/tax-rate-list.html',
                    controller: 'TaxRateListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Tax Rates")}}'
                    }
                })
                .state('app.system.tax-rates-create', {
                    url: '/tax-rates/create',
                    templateUrl: 'modules/tax/admin/tax-rate/tax-rate-form.html',
                    controller: 'TaxRateFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Tax Rates")}}'
                    }
                })
                .state('app.system.tax-rates-import', {
                    url: '/tax-rates/import',
                    templateUrl: 'modules/tax/admin/tax-rate/tax-rate-import.html',
                    controller: 'TaxRateImportFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Import Tax Rates")}}'
                    }
                })
                .state('app.system.tax-rates-edit', {
                    url: '/tax-rates/edit/:id',
                    templateUrl: 'modules/tax/admin/tax-rate/tax-rate-form.html',
                    controller: 'TaxRateFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Tax Rates")}}'
                    }
                });
        }]);
})();
