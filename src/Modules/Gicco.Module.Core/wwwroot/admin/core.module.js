/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.core', [])
        .config(['$stateProvider', '$breadcrumbProvider', function ($stateProvider, $breadcrumbProvider) {

            $breadcrumbProvider.setOptions({
                prefixStateName: 'dashboard',
                includeAbstract: true,
                template: '<li class="breadcrumb-item" ng-repeat="step in steps" ng-class="{active: $last}" ng-switch="$last || !!step.abstract"><a ng-switch-when="false" href="{{step.ncyBreadcrumbLink}}">{{step.ncyBreadcrumbLabel}}</a><span ng-switch-when="true">{{step.ncyBreadcrumbLabel}}</span></li>'
            });

            $stateProvider
                .state('base', {
                    abstract: true,
                    templateUrl: 'modules/core/admin/common/layouts/full.html',
                    //page title goes here
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Dashboard")}}',
                        skip: true
                    }
                }).state('users', {
                    url: '/users',
                    parent: 'base',
                    templateUrl: "modules/core/admin/user/user-list.html",
                    controller: 'UserListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('user-create', {
                    url: '/user/create',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/user/user-form.html',
                    controller: 'UserFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('user-edit', {
                    url: '/user/edit/:id',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/user/user-form.html',
                    controller: 'UserFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('widget', {
                    url: '/widget',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/widget/widget-instance-list.html',
                    controller: 'WidgetInstanceListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('configuration', {
                    url: '/configuration',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/configuration/configuration.html',
                    controller: 'ConfigurationCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('customergroups', {
                    url: '/customergroups',
                    parent: 'base',
                    templateUrl: "modules/core/admin/customergroups/customergroup-list.html",
                    controller: 'CustomerGroupListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('customergroup-create', {
                    url: '/customergroups/create',
                    parent: 'base',
                    templateUrl: "modules/core/admin/customergroups/customergroup-form.html",
                    controller: 'CustomerGroupFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('customergroup-edit', {
                    url: '/customergroups/edit/:id',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/customergroups/customergroup-form.html',
                    controller: 'CustomerGroupFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('themes', {
                    url: '/themes',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/themes/theme-list.html',
                    controller: 'ThemeListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('online-themes', {
                    url: '/online-themes',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/themes/online-theme-list.html',
                    controller: 'OnlineThemeListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('theme-details', {
                    url: '/theme-details/:name',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/themes/theme-details.html',
                    controller: 'ThemeDetailsCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('countries', {
                    url: '/countries',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/countries/country-list.html',
                    controller: 'CountryListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('country-create', {
                    url: '/countries/create',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/countries/country-form.html',
                    controller: 'CountryFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('country-edit', {
                    url: '/countries/edit/:id',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/countries/country-form.html',
                    controller: 'CountryFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('states-provinces', {
                    url: '/states-provinces',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/stateprovince/state-province-list.html',
                    controller: 'StateProvinceListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('country-states-provinces', {
                    url: '/countries/:countryId/states-provinces',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/stateprovince/state-province-list.html',
                    controller: 'StateProvinceListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('state-province-create', {
                    url: '/countries/:countryId/state-province/create',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/stateprovince/state-province-form.html',
                    controller: 'StateProvinceFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('state-province-edit', {
                    url: '/countries/:countryId/state-province/edit/:id',
                    parent: 'base',
                    templateUrl: 'modules/core/admin/stateprovince/state-province-form.html',
                    controller: 'StateProvinceFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                });
        }]);
})();
