/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.shippings', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider.state('shipping-providers', {
                url: '/shipping-providers',
                templateUrl: "modules/shipping/admin/provider/shipping-provider-list.html",
                controller: 'ShippingProviderListCtrl as vm', parent: 'base'
            });
        }]);
})();
