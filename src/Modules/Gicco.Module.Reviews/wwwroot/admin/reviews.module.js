/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.reviews', [])
        .config(['$stateProvider',
            function ($stateProvider) {
                $stateProvider
                    .state('app.sites.reviews', {
                        url: '/reviews',
                        templateUrl: 'modules/reviews/admin/review/review-list.html',
                        controller: 'ReviewListCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Reviews")}}'
                        }
                    })
                    .state('app.sites.review-replies', {
                        url: '/review-replies',
                        templateUrl: 'modules/reviews/admin/review/review-reply-list.html',
                        controller: 'ReviewReplyListCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Review Replies")}}'
                        }
                    })
                ;
            }
        ]);
})();
