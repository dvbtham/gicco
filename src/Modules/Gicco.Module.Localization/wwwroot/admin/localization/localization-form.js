/*global angular*/
(function () {
    angular
        .module('giccoAdmin.localization')
        .controller('LocalizationFormCtrl', LocalizationFormCtrl);

    /* @ngInject */
    function LocalizationFormCtrl($scope, localizationService, translateService) {
        var vm = this;
        console.log(this);
        vm.translate = translateService;
        vm.resources = [];
        vm.addMode = false;
        vm.resource = {};
        vm.cultures = [];
        vm.cultureId = 'vi-VN';

        vm.changeCulture = function changeCulture() {
            vm.validationErrors = [];
            localizationService.getResources(vm.selectedCultureId).then(function (result) {
                vm.resources = result.data;
            });
        };

        vm.save = function save() {
            vm.validationErrors = [];
            localizationService.updateResources(vm.selectedCultureId, vm.resources)
                .then(function (result) {
                    toastr.success('Translations have been saved');
                })
                .catch(function (response) {
                    var error = response.data;
                    vm.validationErrors = [];
                    if (error && angular.isObject(error)) {
                        for (var key in error) {
                            vm.validationErrors.push(error[key][0]);
                        }
                    } else {
                        vm.validationErrors.push('Could not save translation.');
                    }
                });
        };

        vm.onAddMode = function onAddMode() {
            vm.addMode = !vm.addMode;
        };

        vm.create = function create() {
            vm.validationErrors = [];
            localizationService.createResource(vm.selectedCultureId, vm.resource)
                .then(function (result) {
                    toastr.success('Translations have been saved');
                })
                .catch(function (response) {
                    var error = response.data;
                    vm.validationErrors = [];
                    if (error && angular.isObject(error)) {
                        for (var key in error) {
                            vm.validationErrors.push(error[key][0]);
                        }
                    } else {
                        vm.validationErrors.push('Could not save translation.');
                    }
                });
        };

        vm.delete = function deleteResource(resource) {
            bootbox.confirm('Are you sure you want to delete this translation?', function (result) {
                if (result) {
                    vm.validationErrors = [];
                    localizationService.createResource(vm.selectedCultureId, resource)
                        .then(function (result) {
                            toastr.success('Translations have been deleted');
                        })
                        .catch(function (response) {
                            var error = response.data;
                            console.log(error);
                            vm.validationErrors = [];
                            if (error && angular.isObject(error)) {
                                for (var key in error) {
                                    vm.validationErrors.push(error[key][0]);
                                }
                            } else {
                                vm.validationErrors.push('Could not delete translation.');
                            }
                        });
                }
            });
            console.log(vm.resource);
        };

        vm.getResources = function getResources() {
            var config = {
                params: {
                    query: $scope.keyword,
                    cultureId: vm.selectedCultureId
                }
            };

            localizationService.getResources(config).then(function (result) {
                vm.resources = result.data;
            });
        };

        function init() {
            localizationService.getCultures().then(function (result) {
                vm.cultures = result.data;
            });

            vm.getResources();
        }

        init();
    }
})();
