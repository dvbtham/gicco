/*global angular*/
(function () {
    'use strict';

    angular
        .module('giccoAdmin.dashboard', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider.state('dashboard', {
                url: '/dashboard',
                parent: 'base',
                templateUrl: "/admin/dashboard-tpl"
            });
        }]);
})();
