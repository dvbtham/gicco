/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.news', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('app.content.news-categories', {
                    url: '/news-categories',
                    templateUrl: 'modules/news/admin/news-categories/news-category-list.html',
                    controller: 'NewsCategoryListCtrl as vm', 
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("News Categories")}}'
                    }
                })
                .state('app.content.news-categories-create', {
                    url: '/news-categories/create',
                    templateUrl: 'modules/news/admin/news-categories/news-category-form.html',
                    controller: 'NewsCategoryFormCtrl as vm', 
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Categories")}}'
                    }
                })
                .state('app.content.news-categories-edit', {
                    url: '/news-categories/edit/:id',
                    templateUrl: 'modules/news/admin/news-categories/news-category-form.html',
                    controller: 'NewsCategoryFormCtrl as vm', 
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Categories")}}'
                    }
                })
                .state('app.content.news-items', {
                    url: '/news-items',
                    templateUrl: 'modules/news/admin/news-items/news-item-list.html',
                    controller: 'NewsItemListCtrl as vm', 
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("News Items")}}'
                    }
                })
                .state('app.content.news-items-create', {
                    url: '/news-items/create',
                    templateUrl: 'modules/news/admin/news-items/news-item-form.html',
                    controller: 'NewsItemFormCtrl as vm', 
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Items")}}'
                    }
                })
                .state('app.content.news-items-edit', {
                    url: '/news-items/edit/:id',
                    templateUrl: 'modules/news/admin/news-items/news-item-form.html',
                    controller: 'NewsItemFormCtrl as vm', 
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Items")}}'
                    }
                });
        }]);
})();
