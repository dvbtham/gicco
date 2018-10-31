/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.core', [])
        .config(['$stateProvider', '$breadcrumbProvider', function ($stateProvider, $breadcrumbProvider) {

            $breadcrumbProvider.setOptions({
                prefixStateName: 'app.dashboard',
                includeAbstract: true,
                template: '<li class="breadcrumb-item" ng-repeat="step in steps" ng-class="{active: $last}" ng-switch="$last || !!step.abstract"><a ng-switch-when="false" href="{{step.ncyBreadcrumbLink}}">{{step.ncyBreadcrumbLabel}}</a><span ng-switch-when="true">{{step.ncyBreadcrumbLabel}}</span></li>'
            });

            $stateProvider
                .state('app', {
                    abstract: true,
                    templateUrl: 'modules/core/admin/common/layouts/full.html',
                    //page title goes here
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Dashboard")}}',
                        skip: true
                    }
                }).state('app.sites', {
                    url: "/sites",
                    abstract: true,
                    template: '<ui-view></ui-view>',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Site")}}'
                    }
                })
                .state('app.system', {
                    url: "/system",
                    abstract: true,
                    template: '<ui-view></ui-view>',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("System")}}'
                    }
                })
                .state('app.sites.users', {
                    url: '/users',

                    templateUrl: "modules/core/admin/user/user-list.html",
                    controller: 'UserListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('app.sites.user-create', {
                    url: '/user/create',

                    templateUrl: 'modules/core/admin/user/user-form.html',
                    controller: 'UserFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create User")}}'
                    }
                })
                .state('app.sites.user-edit', {
                    url: '/user/edit/:id',

                    templateUrl: 'modules/core/admin/user/user-form.html',
                    controller: 'UserFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit User")}}'
                    }
                })
                .state('app.content.widget', {
                    url: '/widget',
                    templateUrl: 'modules/core/admin/widget/widget-instance-list.html',
                    controller: 'WidgetInstanceListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Widgets")}}'
                    }
                })
                .state('app.system.configuration', {
                    url: '/configuration',

                    templateUrl: 'modules/core/admin/configuration/configuration.html',
                    controller: 'ConfigurationCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Settings")}}'
                    }
                })
                .state('app.sites.customergroups', {
                    url: '/customergroups',

                    templateUrl: "modules/core/admin/customergroups/customergroup-list.html",
                    controller: 'CustomerGroupListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Customer Groups")}}'
                    }
                })
                .state('app.sites.customergroup-create', {
                    url: '/customergroups/create',

                    templateUrl: "modules/core/admin/customergroups/customergroup-form.html",
                    controller: 'CustomerGroupFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Customer Group")}}'
                    }
                })
                .state('app.sites.customergroup-edit', {
                    url: '/customergroups/edit/:id',

                    templateUrl: 'modules/core/admin/customergroups/customergroup-form.html',
                    controller: 'CustomerGroupFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Customer Group")}}'
                    }
                })
                .state('app.system.themes', {
                    url: '/themes',

                    templateUrl: 'modules/core/admin/themes/theme-list.html',
                    controller: 'ThemeListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Installed themes")}}'
                    }
                })
                .state('app.system.online-themes', {
                    url: '/online-themes',

                    templateUrl: 'modules/core/admin/themes/online-theme-list.html',
                    controller: 'OnlineThemeListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Online Themes")}}'
                    }
                })
                .state('app.system.theme-details', {
                    url: '/theme-details/:name',

                    templateUrl: 'modules/core/admin/themes/theme-details.html',
                    controller: 'ThemeDetailsCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Theme Details")}}'
                    }
                })
                .state('app.system.countries', {
                    url: '/countries',

                    templateUrl: 'modules/core/admin/countries/country-list.html',
                    controller: 'CountryListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Countries")}}'
                    }
                })
                .state('app.system.country-create', {
                    url: '/countries/create',

                    templateUrl: 'modules/core/admin/countries/country-form.html',
                    controller: 'CountryFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('app.system.country-edit', {
                    url: '/countries/edit/:id',

                    templateUrl: 'modules/core/admin/countries/country-form.html',
                    controller: 'CountryFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('app.system.states-provinces', {
                    url: '/states-provinces',

                    templateUrl: 'modules/core/admin/stateprovince/state-province-list.html',
                    controller: 'StateProvinceListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('app.system.country-states-provinces', {
                    url: '/countries/:countryId/states-provinces',

                    templateUrl: 'modules/core/admin/stateprovince/state-province-list.html',
                    controller: 'StateProvinceListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('app.system.state-province-create', {
                    url: '/countries/:countryId/state-province/create',

                    templateUrl: 'modules/core/admin/stateprovince/state-province-form.html',
                    controller: 'StateProvinceFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('app.system.state-province-edit', {
                    url: '/countries/:countryId/state-province/edit/:id',

                    templateUrl: 'modules/core/admin/stateprovince/state-province-form.html',
                    controller: 'StateProvinceFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Users")}}'
                    }
                })
                .state('appSimple', {
                    abstract: true,
                    templateUrl: 'modules/core/admin/common/layouts/simple.html'
                });
        }]);
})();
