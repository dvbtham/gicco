/*global angular*/
var brandPrimary = '#20a8d8';
var brandSuccess = '#4dbd74';
var brandInfo = '#63c2de';
var brandWarning = '#f8cb00';
var brandDanger = '#f86c6b';

var grayDark = '#2a2c36';
var gray = '#55595c';
var grayLight = '#818a91';
var grayLighter = '#d1d4d7';
var grayLightest = '#f8f9fa';

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
        ])
        .run(['$rootScope', '$state', '$stateParams', function ($rootScope, $state, $stateParams) {
            $rootScope.$on('$stateChangeSuccess', function () {
                document.body.scrollTop = document.documentElement.scrollTop = 0;
            });
            $rootScope.$state = $state;
            return $rootScope.$stateParams = $stateParams;
        }]);
}());
