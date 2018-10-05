/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.dashboard', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider.state('app.dashboard', {
                url: '/dashboard',
                templateUrl: "/admin/dashboard-tpl",
                ncyBreadcrumb: {
                    label: '{{ ::vm.translate.get("Dashboard")}}'
                }
            });
        }]);
})();
