﻿/*global jQuery, window*/
$(document).ready(function () {
    $('.sp-wrap').smoothproducts();

    $('.product-attrs li').on('click', function () {
        var $variationDiv,
            selectedproductOptions = [],
            variationName,
            $form = $(this).closest("form"),
            $attrOptions = $form.find('.product-attr-options');

        $(this).find('input').prop('checked', true);

        $attrOptions.each(function () {
            selectedproductOptions.push($(this).find('input[type=radio]:checked').val());
        });
        variationName = selectedproductOptions.join('-');
        $variationDiv = $('div[data-variation-name="' + variationName + '"]');
        $('.product-variation').hide();
        if ($variationDiv.length > 0) {
            $variationDiv.show();
            $('.product-variation-notavailable').hide();
        } else {
            $('.product-variation-notavailable').show();
        }
    });

    $('.quantity-button').on('click', function () {
        var quantityInput = $(this).closest("form").find('.quantity-field');
        if ($(this).val() === '+') {
            quantityInput.val(parseInt(quantityInput.val(), 10) + 1);
        }
        else if (quantityInput.val() > 1) {
            quantityInput.val(quantityInput.val() - 1);
        }
    });

    $('#addreview').on('click', '#btn-addreview', function (e) {
        e.preventDefault();
        var $form = $('#form-addreview');
        if (!$form.valid || $form.valid()) {
            $.post($form.attr('action'), $form.serializeArray())
                .done(function (result) {
                    $('#addreview').html(result);
                    $('input.rating-loading').rating({
                        language: window.simplGlobalSetting.lang,
                        filledStar: '<i class="fa fa-star"></i>',
                        emptyStar: '<i class="fa fa-star-o"></i>'
                    });
                });
        }
    });

    $('#reviews,#comments').on('click', '.btn-submit-review-reply', function (e) {
        e.preventDefault();
        var $form = $(this).closest('.form-add-review-reply');
        var that = this;
        if (!$form.valid || $form.valid()) {
            $.post($form.attr('action'), $form.serializeArray())
                .done(function (result) {
                    $(that).closest('.add-review-reply').html(result);
                });
        }
    });

    $('#reviews,#comments').on('click', '.btn-view-review-replies', function (e) {
        var $parent = $(this).parent();
        $(this).addClass('d-none');
        $parent.find('.review-replies').removeClass('d-none');
        $parent.find('.btn-hide-review-replies').removeClass('d-none');
    });

    $('#reviews,#comments').on('click', '.btn-hide-review-replies', function (e) {
        var $parent = $(this).parent();
        $(this).addClass('d-none');
        $parent.find('.review-replies').addClass('d-none');
        $parent.find('.btn-view-review-replies').removeClass('d-none');
    });

    $('#reviews,#comments').on('click', '.btn-add-review-reply', function (e) {
        $('.add-review-reply').addClass('d-none');
        $(this).parent().find('.add-review-reply').removeClass('d-none');
    });

    $('#addcomment').on('click', '#btn-addcomment', function (e) {
        e.preventDefault();
        var $form = $(this).closest('form');
        if (!$form.valid || $form.valid()) {
            $.post($form.attr('action'), $form.serializeArray())
                .done(function (result) {
                    $form.parent().html(result);
                });
        }
    });
});