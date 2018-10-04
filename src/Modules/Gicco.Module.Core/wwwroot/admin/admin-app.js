/*global angular*/
(function () {
    var adminApp = angular.module('giccoAdmin', [
        'ui.router',
        'ngMaterial',
        'ngMessages',
        'smart-table',
        'ngFileUpload',
        'ui.bootstrap',
        'ui.bootstrap.datetimepicker',
        'ui.tree',
        'summernote',
        'colorpicker.module',
        'ncy-angular-breadcrumb',
        'angular-loading-bar',
        'giccoAdmin.common',
        'giccoAdmin.dashboard',
        'giccoAdmin.core',
        'giccoAdmin.catalog',
        'giccoAdmin.orders',
        'giccoAdmin.cms',
        'giccoAdmin.search',
        'giccoAdmin.reviews',
        'giccoAdmin.comments',
        'giccoAdmin.activityLog',
        'giccoAdmin.vendors',
        'giccoAdmin.localization',
        'giccoAdmin.news',
        'giccoAdmin.contacts',
        'giccoAdmin.pricing',
        'giccoAdmin.tax',
        'giccoAdmin.shippings',
        'giccoAdmin.shipping-tablerate',
        'giccoAdmin.payments',
        'giccoAdmin.paymentStripe',
        'giccoAdmin.paymentPaypalExpress',
        'giccoAdmin.inventory',
        'giccoAdmin.shipment',
        'giccoAdmin.paymentCoD',
        'giccoAdmin.recentlyViewed'
    ]);

    toastr.options.closeButton = true;
    adminApp
        .config([
            '$urlRouterProvider', '$httpProvider', 'cfpLoadingBarProvider',
            function ($urlRouterProvider, $httpProvider, cfpLoadingBarProvider) {
                $urlRouterProvider.otherwise("/dashboard");
                cfpLoadingBarProvider.includeSpinner = false;
                cfpLoadingBarProvider.latencyThreshold = 1;

                $httpProvider.interceptors.push(function () {
                    return {
                        request: function (config) {
                            if (/modules.*admin.*\.html/i.test(config.url)) {
                                var separator = config.url.indexOf('?') === -1 ? '?' : '&';
                                config.url = config.url + separator + 'v=' + window.Global_AssetVersion;
                            }

                            return config;
                        }
                    };
                });
            }
        ]);
}());
