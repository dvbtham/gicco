/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.shipment', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('app.sales.shipment-create', {
                    url: '/orders/:orderId/create-shipment',
                    templateUrl: 'modules/shipments/admin/shipment/shipment-form.html',
                    controller: 'ShipmentFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Shipment")}}'
                    }
                })
                .state('app.sales.shipments', {
                    url: '/shipments',
                    templateUrl: 'modules/shipments/admin/shipment/shipment-list.html',
                    controller: 'ShipmentListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Shipments")}}'
                    }
                })
                .state('app.sales.shipment-details', {
                    url: '/shipment/:id',
                    templateUrl: 'modules/shipments/admin/shipment/shipment-details.html',
                    controller: 'ShipmentDetailsCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Shipment Detail")}}'
                    }
                });
        }]);
})();
