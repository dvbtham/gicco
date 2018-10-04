﻿(function() {
    angular
        .module('simplAdmin.search')
        .directive('mostSearchKeyword', mostSearchKeyword);

    function mostSearchKeyword() {
        var directive = {
            restrict: 'E',
            templateUrl: 'modules/search/admin/most-search-keywords.directive.html',
            scope: {},
            controller: MostSearchKeywordCtrl,
            controllerAs: 'vm',
            bindToController: true
        };

        return directive;
    }

    /* @ngInject */
    function MostSearchKeywordCtrl(searchService, translateService) {
        var vm = this;
        vm.translate = translateService;
        vm.keywords = [];

        searchService.getMostSearchKeywords().then(function (result) {
            vm.keywords = result.data;
        });
    }
})();
