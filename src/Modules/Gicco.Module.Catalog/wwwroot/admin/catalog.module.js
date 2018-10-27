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
                .state('app.catalog.product-option', {
                    url: '/product-option',
                    templateUrl: 'modules/catalog/admin/product-option/product-option-list.html',
                    controller: 'ProductOptionListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product Option")}}'
                    }
                })
                .state('app.catalog.product-option-create', {
                    url: '/product-option/create',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product Option Create")}}'
                    },
                    templateUrl: 'modules/catalog/admin/product-option/product-option-form.html',
                    controller: 'ProductOptionFormCtrl as vm'
                })
                .state('app.catalog.product-option-edit', {
                    url: '/product-option/edit/:id',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product Option Edit")}}'
                    },
                    templateUrl: 'modules/catalog/admin/product-option/product-option-form.html',
                    controller: 'ProductOptionFormCtrl as vm'
                })
                .state('app.catalog.product-attribute-group', {
                    url: '/product-attribute-group',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product attribute group")}}'
                    },
                    templateUrl: 'modules/catalog/admin/product-attribute-group/product-attribute-group-list.html',
                    controller: 'ProductAttributeGroupListCtrl as vm'
                })
                .state('app.catalog.product-attribute-group-create', {
                    url: '/product-attribute-group/create',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product attribute group create")}}'
                    },
                    templateUrl: 'modules/catalog/admin/product-attribute-group/product-attribute-group-form.html',
                    controller: 'ProductAttributeGroupFormCtrl as vm'
                })
                .state('product-attribute-group-edit', {
                    url: '/product-attribute-group/edit/:id',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product attribute group edit")}}'
                    },
                    templateUrl: 'modules/catalog/admin/product-attribute-group/product-attribute-group-form.html',
                    controller: 'ProductAttributeGroupFormCtrl as vm'
                })
                .state('app.catalog.product-attribute', {
                    url: '/product-attribute',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product attribute")}}'
                    },
                    templateUrl: 'modules/catalog/admin/product-attribute/product-attribute-list.html',
                    controller: 'ProductAttributeListCtrl as vm'
                })
                .state('app.catalog.product-attribute-create', {
                    url: '/product-attribute/create',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product attribute create")}}'
                    },
                    templateUrl: 'modules/catalog/admin/product-attribute/product-attribute-form.html',
                    controller: 'ProductAttributeFormCtrl as vm'
                })
                .state('app.catalog.product-attribute-edit', {
                    url: '/product-attribute/edit/:id',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product attribute edit")}}'
                    },
                    templateUrl: 'modules/catalog/admin/product-attribute/product-attribute-form.html',
                    controller: 'ProductAttributeFormCtrl as vm'
                })
                .state('app.catalog.product-template', {
                    url: '/product-template',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product template")}}'
                    },
                    templateUrl: 'modules/catalog/admin/product-template/product-template-list.html',
                    controller: 'ProductTemplateListCtrl as vm'
                })
                .state('app.catalog.product-template-create', {
                    url: '/product-template/create',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product template create")}}'
                    },
                    templateUrl: 'modules/catalog/admin/product-template/product-template-form.html',
                    controller: 'ProductTemplateFormCtrl as vm'
                })
                .state('app.catalog.product-template-edit', {
                    url: '/product-template/edit/:id',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Product template edit")}}'
                    },
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
                .state('app.content.widget-product-create', {
                    url: '/widget-product/create',
                    templateUrl: 'modules/catalog/admin/product-widget/product-widget-form.html',
                    controller: 'ProductWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Product Widget")}}'
                    }
                })
                .state('app.content.widget-product-edit', {
                    url: '/widget-product/edit/:id',
                    templateUrl: 'modules/catalog/admin/product-widget/product-widget-form.html',
                    controller: 'ProductWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Product Widget")}}'
                    }
                })
                .state('app.content.widget-category-create', {
                    url: '/widget-category/create',
                    templateUrl: 'modules/catalog/admin/category-widget/category-widget-form.html',
                    controller: 'CategoryWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Category Widget")}}'
                    }
                })
                .state('app.content.widget-category-edit', {
                    url: '/widget-category/edit/:id',
                    templateUrl: 'modules/catalog/admin/category-widget/category-widget-form.html',
                    controller: 'CategoryWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Category Widget")}}'
                    }
                })
                .state('app.content.widget-simple-product-create', {
                    url: '/widget-simple-product/create',
                    templateUrl: 'modules/catalog/admin/simple-product-widget/simple-product-widget-form.html',
                    controller: 'SimpleProductWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Simple Product Widget")}}'
                    }
                })
                .state('app.content.widget-simple-product-edit', {
                    url: '/widget-simple-product/edit/:id',
                    templateUrl: 'modules/catalog/admin/simple-product-widget/simple-product-widget-form.html',
                    controller: 'SimpleProductWidgetFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Simple Product Widget")}}'
                    }
                })
                .state('app.catalog.product-prices', {
                    url: '/product-prices',
                    templateUrl: 'modules/catalog/admin/product-price/product-price-form.html',
                    controller: 'ProductPriceFormCtrl as vm'
                });
        }]);
})();
