/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.vendors', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider.state('sites.vendors', {
                url: '/vendors',
                templateUrl: "modules/vendors/admin/vendors/vendor-list.html",
                controller: 'VendorListCtrl as vm', parent: 'base'
            })
                .state('sites.vendor-create', {
                url: '/vendors/create',
                templateUrl: "modules/vendors/admin/vendors/vendor-form.html",
                controller: 'VendorFormCtrl as vm', parent: 'base'
            })
                .state('sites.vendor-edit', {
                url: '/vendors/edit/:id',
                templateUrl: 'modules/vendors/admin/vendors/vendor-form.html',
                controller: 'VendorFormCtrl as vm', parent: 'base'
            });
        }]);
})();
