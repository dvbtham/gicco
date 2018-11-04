/*global $ */
$(function () {
    $('body').on('click', '.quick-view .search', function (e) {
        e.preventDefault();
        var productId = $(this).data("productid");
        $.ajax({
            type: 'GET',
            url: '/product/product-overview?id=' + productId,
            contentType: "application/json"
        }).done(function (data) {
            $('#productOverview').find('.modal-content').html(data);
            $('#productOverview').modal('show');
        });
    });
});
