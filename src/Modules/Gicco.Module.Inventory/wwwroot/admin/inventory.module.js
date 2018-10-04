﻿/*global angular*/
(function () {
    'use strict';

    angular.module('simplAdmin.inventory', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('stocks', {
                    url: '/stocks',
                    templateUrl: 'modules/inventory/admin/stock/stock-form.html',
                    controller: 'StockFormCtrl as vm'
                })
                .state('warehouses', {
                    url: '/warehouses',
                    templateUrl: 'modules/inventory/admin/warehouse/warehouse-list.html',
                    controller: 'WarehouseListCtrl as vm'
                })
                .state('warehouse-create', {
                    url: '/warehouse/create',
                    templateUrl: 'modules/inventory/admin/warehouse/warehouse-form.html',
                    controller: 'WarehouseFormCtrl as vm'
                })
                .state('warehouse-edit', {
                    url: '/warehouses/edit/:id',
                    templateUrl: 'modules/inventory/admin/warehouse/warehouse-form.html',
                    controller: 'WarehouseFormCtrl as vm'
                });
        }]);
})();