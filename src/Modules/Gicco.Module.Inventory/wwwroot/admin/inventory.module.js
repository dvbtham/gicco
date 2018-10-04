/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.inventory', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('stocks', {
                    url: '/stocks',
                    templateUrl: 'modules/inventory/admin/stock/stock-form.html',
                    controller: 'StockFormCtrl as vm', parent: 'base'
                })
                .state('warehouses', {
                    url: '/warehouses',
                    templateUrl: 'modules/inventory/admin/warehouse/warehouse-list.html',
                    controller: 'WarehouseListCtrl as vm', parent: 'base'
                })
                .state('warehouse-create', {
                    url: '/warehouse/create',
                    templateUrl: 'modules/inventory/admin/warehouse/warehouse-form.html',
                    controller: 'WarehouseFormCtrl as vm', parent: 'base'
                })
                .state('warehouse-edit', {
                    url: '/warehouses/edit/:id',
                    templateUrl: 'modules/inventory/admin/warehouse/warehouse-form.html',
                    controller: 'WarehouseFormCtrl as vm', parent: 'base'
                });
        }]);
})();
