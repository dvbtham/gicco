/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.shipment', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('shipment-create', {
                    url: '/orders/:orderId/create-shipment',
                    templateUrl: 'modules/shipments/admin/shipment/shipment-form.html',
                    controller: 'ShipmentFormCtrl as vm', parent: 'base'
                })
                .state('shipments', {
                    url: '/shipments',
                    templateUrl: 'modules/shipments/admin/shipment/shipment-list.html',
                    controller: 'ShipmentListCtrl as vm', parent: 'base'
                })
                .state('shipment-details', {
                    url: '/shipment/:id',
                    templateUrl: 'modules/shipments/admin/shipment/shipment-details.html',
                    controller: 'ShipmentDetailsCtrl as vm', parent: 'base'
                });
        }]);
})();
