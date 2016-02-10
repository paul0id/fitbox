$(document).on('ready', function(){

  $bigSlider = $('#big-slider').slick({

     dots: true
  });
  $brandsSlider = $('#brandsSlider').slick({
    slidesToShow: 5,
    infinite: true,
    speed: 300
  });

});