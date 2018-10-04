﻿/*global angular, confirm*/
(function () {
    angular
        .module('simplAdmin.cms')
        .controller('PageListCtrl', PageListCtrl);

    /* @ngInject */
    function PageListCtrl(pageService, translateService) {
        var vm = this;
        vm.translate = translateService;
        vm.pages = [];

        vm.getPages = function getpages() {
            pageService.getPages().then(function (result) {
                vm.pages = result.data;
            });
        };

        vm.deletePage = function deletePage(page) {
            bootbox.confirm('Are you sure you want to delete this page: ' + page.name, function (result) {
                if (result) {
                    pageService.deletePage(page)
                       .then(function (result) {
                           vm.getPages();
                           toastr.success(page.name + ' has been deleted');
                       })
                        .catch(function (response) {
                            toastr.error(response.data.error);
                       });
                }
            });
        };

        vm.getPages();
    }
})();