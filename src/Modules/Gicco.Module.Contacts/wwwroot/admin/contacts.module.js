/*global angular*/
(function () {
    'use strict';

    angular.module('giccoAdmin.contacts', [])
        .config(['$stateProvider', function ($stateProvider) {
            $stateProvider
                .state('app.sites.contact-area', {
                    url: '/contact-area',
                    templateUrl: 'modules/contacts/admin/contact-area/contact-area-list.html',
                    controller: 'ContactAreaListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Contact Areas")}}'
                    }
                })
                .state('app.sites.contact-area-create', {
                    url: '/contact-area/create',
                    templateUrl: 'modules/contacts/admin/contact-area/contact-area-form.html',
                    controller: 'ContactAreaFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Create Contact Area")}}'
                    }
                })
                .state('app.sites.contact-area-edit', {
                    url: '/contact-area/edit/:id',
                    templateUrl: 'modules/contacts/admin/contact-area/contact-area-form.html',
                    controller: 'ContactAreaFormCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Edit Contact Area")}}'
                    }
                })
                .state('app.sites.contact', {
                    url: '/contact',
                    templateUrl: 'modules/contacts/admin/contacts/contact-list.html',
                    controller: 'ContactListCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Contacts")}}'
                    }
                })
                .state('app.sites.contact-preview', {
                    url: '/contact/preview/:id',
                    templateUrl: 'modules/contacts/admin/contacts/contact.html',
                    controller: 'ContactCtrl as vm',
                    ncyBreadcrumb: {
                        label: '{{ ::vm.translate.get("Contact information")}}'
                    }
                });
        }]);
})();
