/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.catalog', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('app.catalog', {
                    url: "/catalog",
                    abstract: true,
                    template: '<ui-view></ui-view>',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Catalog")}}'
                    }
                })
                .state('app.catalog.brand', {
                    url: '/brand',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Brands")}}'
                    },
                    templateUrl: 'modules/catalog/admin/brand/brand-list.html',
                    controller: 'BrandListCtrl as vm'
                })
                .state('app.catalog.brand-create', {
                    url: '/brand/create',

                    templateUrl: 'modules/catalog/admin/brand/brand-form.html',
                    controller: 'BrandFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Brand")}}'
                    }
                })
                .state('app.catalog.brand-edit', {
                    url: '/brand/edit/:id',

                    templateUrl: 'modules/catalog/admin/brand/brand-form.html',
                    controller: 'BrandFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Brand")}}'
                    }
                })
                .state('app.catalog.category', {
                    url: '/category',
                    templateUrl: 'modules/catalog/admin/category/category-list.html',
                    controller: 'CategoryListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Categories")}}'
                    }
                })
                .state('app.catalog.category-create', {
                    url: '/category/create',
                    templateUrl: 'modules/catalog/admin/category/category-form.html',
                    controller: 'CategoryFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Category")}}'
                    }
                })
                .state('app.catalog.category-create-parent', {
                    url: '/category/create/:parent',
                    templateUrl: 'modules/catalog/admin/category/category-form.html',
                    controller: 'CategoryFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Category")}}'
                    }
                })
                .state('app.catalog.category-edit', {
                    url: '/category/edit/:id',

                    templateUrl: 'modules/catalog/admin/category/category-form.html',
                    controller: 'CategoryFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Category")}}'
                    }
                })
                .state('product-option', {
                    url: '/product-option',

                    templateUrl: 'modules/catalog/admin/product-option/product-option-list.html',
                    controller: 'ProductOptionListCtrl as vm'
                })
                .state('product-option-create', {
                    url: '/product-option/create',

                    templateUrl: 'modules/catalog/admin/product-option/product-option-form.html',
                    controller: 'ProductOptionFormCtrl as vm'
                })
                .state('product-option-edit', {
                    url: '/product-option/edit/:id',

                    templateUrl: 'modules/catalog/admin/product-option/product-option-form.html',
                    controller: 'ProductOptionFormCtrl as vm'
                })
                .state('product-attribute-group', {
                    url: '/product-attribute-group',
                    templateUrl: 'modules/catalog/admin/product-attribute-group/product-attribute-group-list.html',
                    controller: 'ProductAttributeGroupListCtrl as vm'
                })
                .state('product-attribute-group-create', {
                    url: '/product-attribute-group/create',
                    templateUrl: 'modules/catalog/admin/product-attribute-group/product-attribute-group-form.html',
                    controller: 'ProductAttributeGroupFormCtrl as vm'
                })
                .state('product-attribute-group-edit', {
                    url: '/product-attribute-group/edit/:id',
                    templateUrl: 'modules/catalog/admin/product-attribute-group/product-attribute-group-form.html',
                    controller: 'ProductAttributeGroupFormCtrl as vm'
                })
                .state('product-attribute', {
                    url: '/product-attribute',
                    templateUrl: 'modules/catalog/admin/product-attribute/product-attribute-list.html',
                    controller: 'ProductAttributeListCtrl as vm'
                })
                .state('product-attribute-create', {
                    url: '/product-attribute/create',
                    templateUrl: 'modules/catalog/admin/product-attribute/product-attribute-form.html',
                    controller: 'ProductAttributeFormCtrl as vm'
                })
                .state('product-attribute-edit', {
                    url: '/product-attribute/edit/:id',
                    templateUrl: 'modules/catalog/admin/product-attribute/product-attribute-form.html',
                    controller: 'ProductAttributeFormCtrl as vm'
                })
                .state('product-template', {
                    url: '/product-template',

                    templateUrl: 'modules/catalog/admin/product-template/product-template-list.html',
                    controller: 'ProductTemplateListCtrl as vm'
                })
                .state('product-template-create', {
                    url: '/product-template/create',
                    templateUrl: 'modules/catalog/admin/product-template/product-template-form.html',
                    controller: 'ProductTemplateFormCtrl as vm'
                })
                .state('product-template-edit', {
                    url: '/product-template/edit/:id',
                    templateUrl: 'modules/catalog/admin/product-template/product-template-form.html',
                    controller: 'ProductTemplateFormCtrl as vm'
                })
                .state('app.catalog.product', {
                    url: '/product',
                    templateUrl: 'modules/catalog/admin/product/product-list.html',
                    controller: 'ProductListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Products")}}'
                    }
                })
                .state('app.catalog.product-create', {
                    url: '/product-create',
                    templateUrl: 'modules/catalog/admin/product/product-form.html',
                    controller: 'ProductFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Product")}}'
                    }
                })
                .state('app.catalog.product-edit', {
                    url: '/product/edit/:id',
                    templateUrl: 'modules/catalog/admin/product/product-form.html',
                    controller: 'ProductFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Product")}}'
                    }
                })
                .state('widget-product-create', {
                    url: '/widget-product/create',
                    templateUrl: 'modules/catalog/admin/product-widget/product-widget-form.html',
                    controller: 'ProductWidgetFormCtrl as vm'
                })
                .state('widget-product-edit', {
                    url: '/widget-product/edit/:id',
                    templateUrl: 'modules/catalog/admin/product-widget/product-widget-form.html',
                    controller: 'ProductWidgetFormCtrl as vm'
                })
                .state('widget-category-create', {
                    url: '/widget-category/create',
                    templateUrl: 'modules/catalog/admin/category-widget/category-widget-form.html',
                    controller: 'CategoryWidgetFormCtrl as vm'
                })
                .state('widget-category-edit', {
                    url: '/widget-category/edit/:id',
                    templateUrl: 'modules/catalog/admin/category-widget/category-widget-form.html',
                    controller: 'CategoryWidgetFormCtrl as vm'
                })
                .state('widget-simple-product-create', {
                    url: '/widget-simple-product/create',
                    templateUrl: 'modules/catalog/admin/simple-product-widget/simple-product-widget-form.html',
                    controller: 'SimpleProductWidgetFormCtrl as vm'
                })
                .state('widget-simple-product-edit', {
                    url: '/widget-simple-product/edit/:id',
                    templateUrl: 'modules/catalog/admin/simple-product-widget/simple-product-widget-form.html',
                    controller: 'SimpleProductWidgetFormCtrl as vm'
                })
                .state('app.catalog.product-prices', {
                    url: '/product-prices',
                    templateUrl: 'modules/catalog/admin/product-price/product-price-form.html',
                    controller: 'ProductPriceFormCtrl as vm'
                });
        }]);
})();
