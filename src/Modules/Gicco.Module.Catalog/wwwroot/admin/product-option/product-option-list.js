﻿/*global angular, confirm*/
(function () {
    angular
        .module('giccoAdmin.catalog')
        .controller('ProductOptionListCtrl', ProductOptionListCtrl);

    /* @ngInject */
    function ProductOptionListCtrl(productOptionService, translateService) {
        var vm = this;
        vm.translate = translateService;
        vm.productOptions = [];

        vm.getProductOptions = function getProductOptions() {
            productOptionService.getProductOptions().then(function (result) {
                vm.productOptions = result.data;
            });
        };

        vm.deleteProductOption = function deleteProductOption(productOption) {
            if (confirm("Are you sure?")) {
                productOptionService.deleteProductOption(productOption)
                    .then(function (result) {
                        vm.getProductOptions();
                    });
            }
        };

        vm.getProductOptions();
    }
})();