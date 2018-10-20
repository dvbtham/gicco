/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.recentlyViewed', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('app.content.widget-recently-viewed-create', {
                    url: '/widget-recently-viewed/create',
                    templateUrl: 'modules/productrecentlyviewed/admin/recently-viewed-widget/recently-viewed-widget-form.html',
                    controller: 'RecentlyViewedWidgetFormCtrl as vm', 
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Recently Viewed Widget")}}'
                    }
                })
                .state('app.content.widget-recently-viewed-edit', {
                    url: '/widget-recently-viewed/edit/:id',
                    templateUrl: 'modules/productrecentlyviewed/admin/recently-viewed-widget/recently-viewed-widget-form.html',
                    controller: 'RecentlyViewedWidgetFormCtrl as vm', 
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Recently Viewed Widget")}}'
                    }
                });
        }]);
})();
