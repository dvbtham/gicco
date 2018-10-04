﻿/*global angular*/
(function () {
    angular
        .module('giccoAdmin.catalog')
        .factory('productAttributeGroupService', productAttributeGroupService);

    /* @ngInject */
    function productAttributeGroupService($http) {
        var service = {
            getProductAttributeGroup: getProductAttributeGroup,
            createProductAttributeGroup: createProductAttributeGroup,
            editProductAttributeGroup: editProductAttributeGroup,
            deleteProductAttributeGroup: deleteProductAttributeGroup,
            getProductAttributeGroups: getProductAttributeGroups
        };
        return service;

        function getProductAttributeGroup(id) {
            return $http.get('api/product-attribute-groups/' + id);
        }

        function getProductAttributeGroups() {
            return $http.get('api/product-attribute-groups');
        }

        function createProductAttributeGroup(productAttributeGroup) {
            return $http.post('api/product-attribute-groups', productAttributeGroup);
        }

        function editProductAttributeGroup(productAttributeGroup) {
            return $http.put('api/product-attribute-groups/' + productAttributeGroup.id, productAttributeGroup);
        }

        function deleteProductAttributeGroup(productAttributeGroup) {
            return $http.delete('api/product-attribute-groups/' + productAttributeGroup.id);
        }
    }
})();