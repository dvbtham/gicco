/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.cms', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('page', {
                    url: '/page',
                    templateUrl: 'modules/cms/admin/page/page-list.html',
                    controller: 'PageListCtrl as vm', parent: 'base'
                })
                .state('page-create', {
                    url: '/page/create',
                    templateUrl: 'modules/cms/admin/page/page-form.html',
                    controller: 'PageFormCtrl as vm', parent: 'base'
                })
                .state('page-edit', {
                    url: '/page/edit/:id',
                    templateUrl: 'modules/cms/admin/page/page-form.html',
                    controller: 'PageFormCtrl as vm', parent: 'base'
                })
                .state('menus', {
                    url: '/menus/',
                    templateUrl: 'modules/cms/admin/menu/menu-list.html',
                    controller: 'MenuListCtrl as vm', parent: 'base'
                })
                .state('menus-create', {
                    url: '/menus-create/',
                    templateUrl: 'modules/cms/admin/menu/menu-form-create.html',
                    controller: 'MenuFormCreateCtrl as vm', parent: 'base'
                })
                .state('menus-edit', {
                    url: '/menus-edit/:id',
                    templateUrl: 'modules/cms/admin/menu/menu-form.html',
                    controller: 'MenuFormCtrl as vm', parent: 'base'
                })
                .state('widget-carousel-create', {
                    url: '/widget-carousel/create',
                    templateUrl: 'modules/cms/admin/carousel-widget/carousel-widget-form.html',
                    controller: 'CarouselWidgetFormCtrl as vm', parent: 'base'
                })
                .state('widget-carousel-edit', {
                    url: '/widget-carousel/edit/:id',
                    templateUrl: 'modules/cms/admin/carousel-widget/carousel-widget-form.html',
                    controller: 'CarouselWidgetFormCtrl as vm', parent: 'base'
                })
                .state('widget-html-create', {
                    url: '/widget-html/create',
                    templateUrl: 'modules/cms/admin/html-widget/html-widget-form.html',
                    controller: 'HtmlWidgetFormCtrl as vm', parent: 'base'
                })
                .state('widget-html-edit', {
                    url: '/widget-html/edit/:id',
                    templateUrl: 'modules/cms/admin/html-widget/html-widget-form.html',
                    controller: 'HtmlWidgetFormCtrl as vm', parent: 'base'
                })
                .state('widget-spacebar-create', {
                    url: '/widget-spacebar/create',
                    templateUrl: 'modules/cms/admin/spacebar-widget/spacebar-widget-form.html',
                    controller: 'SpaceBarWidgetFormCtrl as vm', parent: 'base'
                })
                .state('widget-spacebar-edit', {
                    url: '/widget-spacebar/edit/:id',
                    templateUrl: 'modules/cms/admin/spacebar-widget/spacebar-widget-form.html',
                    controller: 'SpaceBarWidgetFormCtrl as vm', parent: 'base'
                });
        }]);
})();
