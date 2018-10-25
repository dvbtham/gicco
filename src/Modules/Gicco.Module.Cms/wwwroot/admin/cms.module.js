/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.cms', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('app.content.pages', {
                    url: '/page',
                    templateUrl: 'modules/cms/admin/page/page-list.html',
                    controller: 'PageListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Menus")}}'
                    }
                })
                .state('app.content.pages-create', {
                    url: '/page/create',
                    templateUrl: 'modules/cms/admin/page/page-form.html',
                    controller: 'PageFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Menus")}}'
                    }
                })
                .state('app.content.pages-edit', {
                    url: '/page/edit/:id',
                    templateUrl: 'modules/cms/admin/page/page-form.html',
                    controller: 'PageFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Menus")}}'
                    }
                })
                .state('app.content.menus', {
                    url: '/menus/',
                    templateUrl: 'modules/cms/admin/menu/menu-list.html',
                    controller: 'MenuListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Menus")}}'
                    }
                })
                .state('app.content.menus-create', {
                    url: '/menus-create/',
                    templateUrl: 'modules/cms/admin/menu/menu-form-create.html',
                    controller: 'MenuFormCreateCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Menu")}}'
                    }
                })
                .state('app.content.menus-edit', {
                    url: '/menus-edit/:id',
                    templateUrl: 'modules/cms/admin/menu/menu-form.html',
                    controller: 'MenuFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Menu")}}'
                    }
                })
                .state('app.content', {
                    url: "/content",
                    abstract: true,
                    template: '<ui-view></ui-view>',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Widget")}}'
                    }
                })
                .state('app.content.widget-carousel-create', {
                    url: '/widget-carousel/create',
                    templateUrl: 'modules/cms/admin/carousel-widget/carousel-widget-form.html',
                    controller: 'CarouselWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Widget")}}'
                    }
                })
                .state('app.content.widget-carousel-edit', {
                    url: '/widget-carousel/edit/:id',
                    templateUrl: 'modules/cms/admin/carousel-widget/carousel-widget-form.html',
                    controller: 'CarouselWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Widget")}}'
                    }
                })
                .state('app.content.widget-html-create', {
                    url: '/widget-html/create',
                    templateUrl: 'modules/cms/admin/html-widget/html-widget-form.html',
                    controller: 'HtmlWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Html Widget")}}'
                    }
                })
                .state('app.content.widget-html-edit', {
                    url: '/widget-html/edit/:id',
                    templateUrl: 'modules/cms/admin/html-widget/html-widget-form.html',
                    controller: 'HtmlWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Html Widget")}}'
                    }
                })
                .state('app.content.widget-spacebar-create', {
                    url: '/widget-spacebar/create',
                    templateUrl: 'modules/cms/admin/spacebar-widget/spacebar-widget-form.html',
                    controller: 'SpaceBarWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Spacebar Widget")}}'
                    }
                })
                .state('app.content.widget-spacebar-edit', {
                    url: '/widget-spacebar/edit/:id',
                    templateUrl: 'modules/cms/admin/spacebar-widget/spacebar-widget-form.html',
                    controller: 'SpaceBarWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Spacebar Widget")}}'
                    }
                });
        }]);
})();
