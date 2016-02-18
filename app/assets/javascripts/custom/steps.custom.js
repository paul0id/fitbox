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

        onFinished: function (event, currentIndex) {
            alert("Form subimtted.");
        },

        onFinishing: function (event, currentIndex) {
            alert("Form subimtted.");
        },

        onInit: function(){

            $(this).on('click.go2next', 'button', function(){
                console.log(   $(this).attr('name'),"=",$(this).attr('value'))
                signUpForm.steps('next');

            })
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