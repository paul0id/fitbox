/* ------------------------------------------------------------------------------
*
*  # jQuery UI sliders
*
*  Specific JS code additions for jqueryui_sliders.html page
*
*  Version: 1.0
*  Latest update: Nov 12, 2015
*
* ---------------------------------------------------------------------------- */

$(function() {

    // Custom label text
    var months = ["XS", "S", "M", "L", "XL", "XXL", "XXXL"];

    $(".ui-slider-labels-custom").slider({
        min: 0,
        max: 6,
        value: 5
    });
    $(".ui-slider-labels-custom").slider("pips" , {
        rest: "label",
        labels: months
    });
    $(".ui-slider-labels-custom").on("slidechange", function(e,ui) {
        alert('sssdf');
        // $("#ui-slider-labels-custom-output").html("You selected " + "<span class='text-danger'>" + months[ui.value] + "</span>");
    });

});
