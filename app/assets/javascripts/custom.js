$(document).on('ready', function(){

  $bigSlider = $('#big-slider').slick({

     dots: true
  });
  $brandsSlider = $('#brandsSlider').slick({
    slidesToShow: 5,
    infinite: true,
    speed: 300
  });

  function addHLTab(){
    var tabs = $('.tab-pane');
      // if (tabs.length) {
        $.each(tabs,function( idx, item ){
          // // console.log( $(item) )
          // if ( $(item).has('.product-item.select').size() === 0 ) {
          //   // console.log( '0' )
          //   $('a[href="#' + $(item)
          //     .has('.product-item.select')
          //     .attr('id') + '"]')
          //     .removeClass('has-selected');
          // } else {
          //   $('a[href="#' + $(item)
          //     .has('.product-item.select')
          //     .attr('id') + '"]')
          //     .addClass('has-selected');
          // }

          // var selected = $(item).has('.product-item.select');

          // if (selected.size() === 0) {
          //   $('a[href*="#' + selected.attr('id') + '"]').removeClass('has-selected')
          //   // selected.remove()
          // } else {
          //   console.log( $('a[href*="#' + selected.attr('id') + '"]'))
          //   $('a[href*="#' + selected.attr('id') + '"]').addClass('has-selected')
          // }
          // if (selected.size) {

          // }
          // var notSelected = $(item).has('.product-item.select');
          // console.log(selected.size() === 0 )
          // var cat = selected.attr('id');
          // var notHasSelectedTab = 
          // var hasSelectedTab = $('a[href*="' + cat + '"]').addClass('has-selected');
            // console.log(selectedTab)
          // if ($(item).has('.product-item.select')) {
          //   var hash = '#' + $(item).attr('id');
          //   $('a[href*="' + hash + '"]').addClass('has-selected');
          // }
          // console.log( $(item) );
          // } else {
          //   $(item).removeClass('has-selected')
          // }
          
          // console.log(item);
          // console.log('#' + $(item).attr('id'));
          // console.log(idx);

        });
      // console.log( tabs.length )
   // head :ok
      // }
  }

  function selectProduct(){}
  function unselectProduct(){}

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
        console.log(ids)
        // var _data =  "manager_id" + managerId,
        // "client_id" clientId,
        //   'arr': ids 
        // }; 

        // = managerId,
        // _data['client_id']= clientId

        // _data.arr.push(ids);
        // console.log(_data);
        // console.log(JSON.stringify(_data));
        // $.post( '/fit_boxes/new_box', { arr : ids } );
        // $.post( '/fit_boxes/new_box', { 'arr[]': ids, 'manager_id' : managerId, 'client_id' : clientId } );
        // $.post( '/fit_boxes/new_box', {data:_data} );
        $.ajax({
          url: '/fit_boxes/new_box',
      //     // data:  _data ),
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
        // addToFitbox(ids, managerId, clientId)

  });

  // function addToFitbox(arr, manager_id, client_id){

  //   $.ajax({
  //     url: '/fit_boxes/new_box',
  //     data: {
  //       'ids': arr,
  //       'manager_id': manager_id,
  //       'client_id': client_id

  //     },
  //     // dataType: 'script',
  //     type: 'POST',
  //     success: function(d){
  //       console.log(d)
  //     },
  //     error: function(err){
  //       console.log(err)
  //     }
  //   });

  // }

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



// arr, client_id, manager_id
      // $product
    // var currCatHash = $(this).data('cat-name');
    // var currCat = $('a[href="' + currCatHash + '"]');

    // $('a[href^="tab"]')
    //   .removeClass('has-selected')

    // currCat.addClass('has-selected');
    // var currCatB = $('a[href="' + currCatHash + '"]');


    // console.log(currCat)
    // var _catItems = $(this).parent().siblings().andSelf().find('.product-item');
    //   _catItems.removeClass('select');
    //   $(this).toggleClass('select')

    // addHLTab();

      // console.log( 'дальше запиздячиваю ajax' )
  })

});