﻿/*global angular*/
(function () {
    'use strict';

    angular
        .module('simplAdmin.core', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider.state('users', {
                url: '/users',
                templateUrl: "modules/core/admin/user/user-list.html",
                controller: 'UserListCtrl as vm'
                })
                .state('user-create', {
                    url: '/user/create',
                    templateUrl: 'modules/core/admin/user/user-form.html',
                    controller: 'UserFormCtrl as vm'
                })
                .state('user-edit', {
                    url: '/user/edit/:id',
                    templateUrl: 'modules/core/admin/user/user-form.html',
                    controller: 'UserFormCtrl as vm'
                })
                .state('widget', {
                    url: '/widget',
                    templateUrl: 'modules/core/admin/widget/widget-instance-list.html',
                    controller: 'WidgetInstanceListCtrl as vm'
                })
                .state('configuration', {
                    url: '/configuration',
                    templateUrl: 'modules/core/admin/configuration/configuration.html',
                    controller: 'ConfigurationCtrl as vm'
                })
                .state('customergroups', {
                    url: '/customergroups',
                    templateUrl: "modules/core/admin/customergroups/customergroup-list.html",
                    controller: 'CustomerGroupListCtrl as vm'
                })
                .state('customergroup-create', {
                    url: '/customergroups/create',
                    templateUrl: "modules/core/admin/customergroups/customergroup-form.html",
                    controller: 'CustomerGroupFormCtrl as vm'
                })
                .state('customergroup-edit', {
                    url: '/customergroups/edit/:id',
                    templateUrl: 'modules/core/admin/customergroups/customergroup-form.html',
                    controller: 'CustomerGroupFormCtrl as vm'
                })
                .state('themes', {
                    url: '/themes',
                    templateUrl: 'modules/core/admin/themes/theme-list.html',
                    controller: 'ThemeListCtrl as vm'
                })
                .state('online-themes', {
                    url: '/online-themes',
                    templateUrl: 'modules/core/admin/themes/online-theme-list.html',
                    controller: 'OnlineThemeListCtrl as vm'
                })
                .state('theme-details', {
                    url: '/theme-details/:name',
                    templateUrl: 'modules/core/admin/themes/theme-details.html',
                    controller: 'ThemeDetailsCtrl as vm'
                })
                .state('countries', {
                    url: '/countries',
                    templateUrl: 'modules/core/admin/countries/country-list.html',
                    controller: 'CountryListCtrl as vm'
                })
                .state('country-create', {
                    url: '/countries/create',
                    templateUrl: 'modules/core/admin/countries/country-form.html',
                    controller: 'CountryFormCtrl as vm'
                })
                .state('country-edit', {
                    url: '/countries/edit/:id',
                    templateUrl: 'modules/core/admin/countries/country-form.html',
                    controller: 'CountryFormCtrl as vm'
                })
                .state('states-provinces', {
                    url: '/states-provinces',
                    templateUrl: 'modules/core/admin/stateprovince/state-province-list.html',
                    controller: 'StateProvinceListCtrl as vm'
                })
                .state('country-states-provinces', {
                    url: '/countries/:countryId/states-provinces',
                    templateUrl: 'modules/core/admin/stateprovince/state-province-list.html',
                    controller: 'StateProvinceListCtrl as vm'
                })
                .state('state-province-create', {
                    url: '/countries/:countryId/state-province/create',
                    templateUrl: 'modules/core/admin/stateprovince/state-province-form.html',
                    controller: 'StateProvinceFormCtrl as vm'
                })
                .state('state-province-edit', {
                    url: '/countries/:countryId/state-province/edit/:id',
                    templateUrl: 'modules/core/admin/stateprovince/state-province-form.html',
                    controller: 'StateProvinceFormCtrl as vm'
                });
        }]);
})();