/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.pricing', [])
        .config(['$stateProvider',
            function ($stateProvider) {
                $stateProvider
                    .state('app.promotions', {
                        url: "/promotions",
                        abstract: true,
                        template: '<ui-view></ui-view>',
                        ncyBreadcrumb: {
                            label: 'Promotion'
                        }
                    })
                    .state('app.promotions.cart-rules', {
                        url: '/cart-rules',
                        templateUrl: 'modules/pricing/admin/cart-rule/cart-rule-list.html',
                        controller: 'CartRuleListCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Cart Price Rules")}}'
                        }
                    })
                    .state('app.promotions.cart-rule-create', {
                        url: '/cart-rule/create',
                        templateUrl: 'modules/pricing/admin/cart-rule/cart-rule-form.html',
                        controller: 'CartRuleFormCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Create Cart Price Rule")}}'
                        }
                    })
                    .state('app.promotions.cart-rule-edit', {
                        url: '/cart-rule/edit/:id',
                        templateUrl: 'modules/pricing/admin/cart-rule/cart-rule-form.html',
                        controller: 'CartRuleFormCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Edit Cart Price Rule")}}'
                        }
                    })
                    .state('app.promotions.cart-rule-usages', {
                        url: '/cart-rule-usages',
                        templateUrl: 'modules/pricing/admin/cart-rule-usage/cart-rule-usage-list.html',
                        controller: 'CartRuleUsageListCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Usages Cart Price Rule")}}'
                        }
                    });
            }
        ]);
})();
