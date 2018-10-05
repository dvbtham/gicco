/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.vendors', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider.state('app.sites.vendors', {
                url: '/vendors',
                templateUrl: "modules/vendors/admin/vendors/vendor-list.html",
                controller: 'VendorListCtrl as vm',
                ncyBreadcrumb: {
                    label: '{{ ::vm.translate.get("Vendors")}}'
                }
            })
                .state('app.sites.vendor-create', {
                    url: '/vendors/create',
                    templateUrl: "modules/vendors/admin/vendors/vendor-form.html",
                    controller: 'VendorFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Vendor")}}'
                    }
                })
                .state('app.sites.vendor-edit', {
                    url: '/vendors/edit/:id',
                    templateUrl: 'modules/vendors/admin/vendors/vendor-form.html',
                    controller: 'VendorFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Vendor")}}'
                    }
                });
        }]);
})();
