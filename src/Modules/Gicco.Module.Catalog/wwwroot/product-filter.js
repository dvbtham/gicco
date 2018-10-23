/*global jQuery, noUiSlider, wNumb, window, document, productFilter*/
(function ($, currentSearchOption, priceSetting) {
    $(function () {
        function createUrl() {
            var key,
                value,
                newUrl,
                params = [],
                baseUrl = window.location.protocol + '//' + window.location.host + window.location.pathname;

            for (key in currentSearchOption) {
                if (currentSearchOption.hasOwnProperty(key) && currentSearchOption[key]) {
                    value = currentSearchOption[key];
                    params.push(key + '=' + value);
                }
            }

            if (params.length > 0) {
                newUrl = baseUrl + '?' + params.join('&');
            } else {
                newUrl = baseUrl;
            }

            return newUrl;
        }

        function giccoPriceSlider() {
            // CATEGORY FILTER 
            $('.slider-range-price').each(function () {
                var min = $(this).data('min');
                var max = $(this).data('max');
                var unit = $(this).data('unit');
                var value_min = $(this).data('value-min');
                var value_max = $(this).data('value-max');
                var label_result = $(this).data('label-result');
                var t = $(this);

                $(this).slider({
                    range: true,
                    min: min,
                    max: max,
                    values: [value_min, value_max],
                    slide: function (event, ui) {
                        var result = label_result + " " + unit + ui.values[0] + ' - ' + unit + ui.values[1];
                        t.closest('.slider-range').find('.amount-range-price').html(result);
                    },
                    change: function (event, ui) {
                        currentSearchOption.minPrice = ui.values[0];
                        currentSearchOption.maxPrice = ui.values[1];
                        window.location = createUrl();
                    }
                });


            });
        }

        function initPriceSlider() {
            var priceSlider = document.getElementById('priceSlider');
            if (!priceSlider) {
                return;
            }
            var priceValues = [
                document.getElementById('minPrice'),
                document.getElementById('maxPrice')
            ];

            noUiSlider.create(priceSlider, {
                connect: true,
                start: [priceSetting.currentMin, priceSetting.currentMax],
                range: {
                    'min': priceSetting.min,
                    'max': priceSetting.max
                },
                format: wNumb({
                    decimals: 3,
                    thousand: '.'
                })
            });

            priceSlider.noUiSlider.on('update', function (values, handle) {
                priceValues[handle].innerHTML = values[handle];
            });

            priceSlider.noUiSlider.on('change', function () {
                var min, max, prices;
                prices = priceSlider.noUiSlider.get();
                min = parseInt(prices[0].replace(/\./g, ''), 10);
                max = parseInt(prices[1].replace(/\./g, ''), 10);
                if (min !== priceSetting.min) {
                    currentSearchOption.minPrice = min;
                } else {
                    currentSearchOption.minPrice = null;
                }
                if (max !== priceSetting.max) {
                    currentSearchOption.maxPrice = max;
                } else {
                    currentSearchOption.maxPrice = null;
                }
                window.location = createUrl();
            });
        }

        $('.brand-filter input:checkbox').on('change', function () {
            var index,
                checkbox = $(this),
                brand = checkbox.val(),
                brands = currentSearchOption.brand ? currentSearchOption.brand.split('--') : [];
            if (checkbox.prop("checked") === true) {
                brands.push(brand);
            } else {
                index = brands.indexOf(brand);
                brands.splice(index, 1);
            }
            currentSearchOption.brand = brands.join('--');

            window.location = createUrl();
        });

        $('.category-filter input:checkbox').on('change', function () {
            var index,
                checkbox = $(this),
                category = checkbox.val(),
                categories = currentSearchOption.category ? currentSearchOption.category.split('--') : [];
            if (checkbox.prop("checked") === true) {
                categories.push(category);
            } else {
                index = categories.indexOf(category);
                categories.splice(index, 1);
            }
            currentSearchOption.category = categories.join('--');

            window.location = createUrl();
        });

        $('.sort-by select').on('change', function () {
            currentSearchOption.sort = $(this).val();
            window.location = createUrl();
        });

        initPriceSlider();

        giccoPriceSlider();
    });
})(jQuery, productFilter.currentSearchOption, productFilter.priceSetting);
