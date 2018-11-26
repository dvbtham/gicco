/*global angular*/
(function () {
    angular
        .module('giccoAdmin.catalog')
        .factory('productWidgetService', productWidgetService);

    /* @ngInject */
    function productWidgetService($http, Upload) {
        var service = {
            getWidgetZones: getWidgetZones,
            getProductWidget: getProductWidget,
            createProductWidget: createProductWidget,
            editProductWidget: editProductWidget,
            getProductWidgetAvailableOrderBy: getProductWidgetAvailableOrderBy,
            getNumberOfWidgets: getNumberOfWidgets
        };
        return service;

        function getWidgetZones() {
            return $http.get('api/widget-zones');
        }

        function getProductWidget(id) {
            return $http.get('api/product-widgets/' + id);
        }

        function createProductWidget(widgetInstance) {
            return Upload.upload({
                url: 'api/product-widgets',
                data: widgetInstance
            });
        }

        function editProductWidget(widgetInstance) {
            return Upload.upload({
                url: 'api/product-widgets',
                data: widgetInstance
            });
        }

        function getProductWidgetAvailableOrderBy() {
            return $http.get('api/product-widgets/available-orderby');
        }

        function getNumberOfWidgets() {
            return $http.get('api/widget-instances/number-of-widgets');
        }
    }
})();
