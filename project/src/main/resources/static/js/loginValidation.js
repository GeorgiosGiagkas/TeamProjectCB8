$(document).ready(function(){

    $.validator.addMethod("strongPassword", function(value, element) {
        return this.optional(element)
            || /\d/.test(value)
            && /[!@#$%^&*(),.?":{}|<>]/g.test(value)
            && /[a-z]/i.test(value);
    })

    $.validator.addMethod("alphanumeric", function(value, element) {
        return this.optional(element)
            || /\d/.test(value)
            && /[a-z]/i.test(value);
    })

    $.validator.addMethod( "nowhitespace", function( value, element ) {
        return this.optional( element ) || /^\S+$/i.test( value );
    }, "No white space please" );


    $("#loginForm").validate({
        rules: {
            userNickname: {
                required: true,
                alphanumeric: true,
                minlength:6,
                maxlength:15,
                nowhitespace: true
            },
            userPassword: {
                required: true,
                strongPassword: true,
                minlength:6,
                maxlength:60,
                nowhitespace: true
            }
        },
        messages: {
            userNickname: {
                required: "Please enter a nickname",
                alphanumeric: "Enter at least 1 number and 1 letter",
                minlength: "Please enter at least 6 characters",
                maxlength: "Please enter no more than 15 characters",
                nowhitespace: ""
            },
            userPassword: {
                required: "Please enter a password",
                strongPassword: "Enter at least 1 number, 1 letter and 1 special character",
                minlength: "Please enter at least 6 characters",
                maxlength:"Please enter no more than 60 characters"
            }
        }
    });
});