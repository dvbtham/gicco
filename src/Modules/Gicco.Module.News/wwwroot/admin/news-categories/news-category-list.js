/*global angular, confirm*/
(function () {
    angular
        .module('giccoAdmin.news')
        .controller('NewsCategoryListCtrl', NewsCategoryListCtrl);

    /* @ngInject */
    function NewsCategoryListCtrl(newsCategoryService, translateService) {
        var vm = this;
        vm.translate = translateService;
        vm.newsCategorys = [];

        vm.getNewsCategories = function getNewsCategories() {
            newsCategoryService.getNewsCategories().then(function (result) {
                vm.newsCategorys = result.data;
            });
        };

        vm.deleteNewsCategory = function deleteNewsCategory(newsCategory) {
            bootbox.confirm('Are you sure you want to delete this news category: ' + newsCategory.name, function (result) {
                if (result) {
                    newsCategoryService.deleteNewsCategory(newsCategory)
                        .then(function (result) {
                            vm.getNewsCategories();
                            toastr.success(newsCategory.name + ' has been deleted');
                        })
                        .catch(function (response) {
                            toastr.error(response.data.error);
                        });
                }
            });
        };

        vm.getNewsCategories();
    }
})();
