/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.inventory', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('app.inventorys', {
                    url: "/inventorys",
                    abstract: true,
                    template: '<ui-view></ui-view>',
                    ncyBreadcrumb: {
                        label: 'Inventory'
                    }
                })
                .state('app.inventorys.stocks', {
                    url: '/stocks',
                    templateUrl: 'modules/inventory/admin/stock/stock-form.html',
                    controller: 'StockFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Stock management")}}'
                    }
                })
                .state('app.inventorys.warehouses', {
                    url: '/warehouses',
                    templateUrl: 'modules/inventory/admin/warehouse/warehouse-list.html',
                    controller: 'WarehouseListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Warehouses")}}'
                    }
                })
                .state('app.inventorys.warehouse-create', {
                    url: '/warehouse/create',
                    templateUrl: 'modules/inventory/admin/warehouse/warehouse-form.html',
                    controller: 'WarehouseFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Warehouses")}}'
                    }
                })
                .state('app.inventorys.warehouse-edit', {
                    url: '/warehouses/edit/:id',
                    templateUrl: 'modules/inventory/admin/warehouse/warehouse-form.html',
                    controller: 'WarehouseFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Warehouses")}}'
                    }
                });
        }]);
})();
