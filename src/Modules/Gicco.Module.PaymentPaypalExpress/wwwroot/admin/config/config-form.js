﻿/*global angular, jQuery*/
(function ($) {
    angular
        .module('simplAdmin.paymentPaypalExpress')
        .controller('PaypalExpressConfigFormCtrl', PaypalExpressConfigFormCtrl);

    /* @ngInject */
    function PaypalExpressConfigFormCtrl($state, paypalExpressService, translateService) {
        var vm = this;
        vm.translate = translateService;
        vm.payPalExpressConfig = {};

        vm.save = function save() {
            vm.validationErrors = [];
            paypalExpressService.updateSetting(vm.payPalExpressConfig)
                .then(function (result) {
                    toastr.success('Settings have been saved');
                })
                .catch(function (response) {
                    var error = response.data;
                    vm.validationErrors = [];
                    if (error && angular.isObject(error)) {
                        for (var key in error) {
                            vm.validationErrors.push(error[key][0]);
                        }
                    } else {
                        vm.validationErrors.push('Could not save settings.');
                    }
                });
        };

        function init() {
            paypalExpressService.getSettings().then(function (result) {
                vm.payPalExpressConfig = result.data;
            });
        }

        init();
    }
})(jQuery);