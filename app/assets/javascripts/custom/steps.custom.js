$(document).ready(function(){

    // Basic wizard setup
    window.signUpForm = $(".steps-basic").steps({
        headerTag: "h6",
        bodyTag: "fieldset",
        transitionEffect: "fade",
        enablePagination: false,
        autoFocus: true,
        titleTemplate: '<span class="number">#index#</span> #title#',
        labels: {
            finish: 'Submit'
        },
        onInit: function(){
            var self = $(this);

            self
                .find('fieldset')
                .each(function(idx, _fieldset){
                    $(_fieldset)
                        .prepend( $('<input type="hidden" value="" name="" class="fieldset-data" />') );
                });

            self
                .on('click.go2next', 'button',  
                    function(){ 
                        var $hidden = 
                        $(this)
                            .parents('fieldset')
                            .find( '[type="hidden"]' )
                            .attr('name', $(this).attr('name') )
                            .attr('value', $(this).attr('value') );
                        signUpForm.steps('next');
                    });
        },

    });

});