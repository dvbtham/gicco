/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.orders', [])
        .config(['$stateProvider',
            function ($stateProvider) {
                $stateProvider
                    .state('app.sales', {
                        url: "/sites",
                        abstract: true,
                        template: '<ui-view></ui-view>',
                        ncyBreadcrumb: {
                            label: 'sales'
                        }
                    })
                    .state('app.sales.order', {
                        url: '/order',
                        templateUrl: 'modules/orders/admin/order/order-list.html',
                        controller: 'OrderListCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Order")}}'
                        }
                    })
                    .state('app.sales.order-detail', {
                        url: '/order/detail/:id',
                        templateUrl: 'modules/orders/admin/order/order-detail.html',
                        controller: 'OrderDetailCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Order detail")}}'
                        }
                    });
            }
        ]);
})();
