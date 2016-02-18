$(document).on('ready', function(){

  $bigSlider = $('#big-slider').slick({

     dots: true
  });
  $brandsSlider = $('#brandsSlider').slick({
    slidesToShow: 5,
    infinite: true,
    speed: 300
  });


  $('#sendToFitbox').on('click', function(){

    var 
        managerId = $(this).data('manager-id'),
        clientId = $(this).data('client-id'),
        ids = new Array();

        if ($('.product-item.select').size()) {
          $('.product-item.select')
            .each(function( _idx, _item ){
              // console.log( $(_item).attr('id') );
              ids.push( $(_item).attr('id')  );
          })
        }
        $.ajax({
          url: '/fit_boxes/new_box',
          data: {
            'client_id':clientId,'manager_id':managerId,'arr': ids
          },

          dataType: 'JSON',
          type: 'POST',
          success: function(d){
            console.log(d)
          },
          error: function(err){
            console.log(err)
          }
      });
      setTimeout(function(){
        window.location.reload();
      }, 500);

  });

  $('.product-item').on('click', function(e) {
    e.preventDefault();
    var $product = $(this); 

      $product
        .toggleClass('select')
        .parent().siblings().find('.product-item')
        .removeClass('select')

        $('.tab-pane')
        .each(function(idx,item){
          var _hash = $(item).attr('id');
          $('a[href^="#' +_hash+ '"]').removeClass('has-selected');
        })
        .has('.product-item.select').each(function(idx,item){
          // console.log(item)
          var _hash = $(item).attr('id');
          $('a[href^="#' +_hash+ '"]').addClass('has-selected');
        });

  })

});