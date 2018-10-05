/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.comments', [])
        .config(['$stateProvider',
            function ($stateProvider) {
                $stateProvider
                    .state('app.sites.comments', {
                        url: '/comments',
                        templateUrl: 'modules/comments/admin/comment/comment-list.html',
                        controller: 'CommentListCtrl as vm',
                        ncyBreadcrumb: {
                            label: '{{ ::vm.translate.get("Comments")}}'
                        }
                    })
                ;
            }
        ]);
})();
