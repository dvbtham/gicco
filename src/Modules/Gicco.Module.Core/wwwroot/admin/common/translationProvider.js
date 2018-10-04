(function () {

    'use strict';
    angular
        .module('giccoAdmin')
        .provider('translation', function () {

            this.$get = ['$http', function ($http) {

                var data = {}, isDataLoaded = false;

                $http.get('api/localization/get-translation').then(function (result) {
                    data = result.data;
                    isDataLoaded = true;
                });

                return {
                    // Call this to track an event
                    get: function (key) {
                        if (isDataLoaded) {
                            if (data[key]) {
                                return data[key];
                            }

                            return key;
                        }
                    }
                };
            }];
        });
})();  
