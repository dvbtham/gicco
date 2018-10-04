/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.pricing', [])
        .config(['$stateProvider',
            function ($stateProvider) {
                $stateProvider
                    .state('cart-rules', {
                        url: '/cart-rules',
                        templateUrl: 'modules/pricing/admin/cart-rule/cart-rule-list.html',
                        controller: 'CartRuleListCtrl as vm', parent: 'base'
                    })
                    .state('cart-rule-create', {
                        url: '/cart-rule/create',
                        templateUrl: 'modules/pricing/admin/cart-rule/cart-rule-form.html',
                        controller: 'CartRuleFormCtrl as vm', parent: 'base'
                    })
                    .state('cart-rule-edit', {
                        url: '/cart-rule/edit/:id',
                        templateUrl: 'modules/pricing/admin/cart-rule/cart-rule-form.html',
                        controller: 'CartRuleFormCtrl as vm', parent: 'base'
                    })
                    .state('cart-rule-usages', {
                        url: '/cart-rule-usages',
                        templateUrl: 'modules/pricing/admin/cart-rule-usage/cart-rule-usage-list.html',
                        controller: 'CartRuleUsageListCtrl as vm', parent: 'base'
                    })
                ;
            }
        ]);
})();
