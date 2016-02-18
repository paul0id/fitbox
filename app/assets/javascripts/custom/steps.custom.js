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

            $(this).on('click.go2next', 'button', function(){
                signUpForm.steps('next');
            });
            // .on('click.async-send', 'button#createAccount', function( event ){
            //     console.log( signUpForm )
            //      signUpForm.submit() 
            // });

            // $(this)
            //     .find('button')
            //     .on('click.go2next', function() { (signUpForm.steps('next')) });
            // $(this)
            //     .find('#createAccount')
            //     .on('click.async-submit', function(){
            //         // console.log('serialize')
            //         // console.log($(signUpForm))
            //         var data = $(signUpForm).serialize();
            //         console.log( data )
            //     })
        },

    });

});