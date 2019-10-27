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
        return this.optional( element )
            || /^\S+$/i.test( value );
    }, "No white space please" );

    $("#registrationForm").validate({
        rules: {
            userNickname: {
                required: true,
                alphanumeric: true,
                minlength:6,
                maxlength:15,
                nowhitespace: true
            },
            userEmail: {
                required: true,
                email: true
            },
            userPassword: {
                required: true,
                strongPassword: true,
                minlength:6,
                maxlength:60,
                nowhitespace: true
            },
            userPasswordRetype: {
                required: true,
                equalTo: "#userPassword"
            }
        },
        messages: {
            userNickname: {
                required: "Please enter a nickname",
                alphanumeric: "Please enter at least 1 number and 1 letter",
                minlength: "Please enter at least 6 characters",
                maxlength: "Please enter no more than 15 characters",
                nowhitespace: "Whitespace is not allowed"
            },
            userEmail: {
                required: "Please enter an email address",
                email: "Please enter a valid email address"
            },
            userPassword: {
                required: "Please enter a password",
                strongPassword: "Please enter at least 1 number, 1 letter and 1 special character",
                minlength: "Please enter at least 6 characters",
                maxlength:"Please enter no more than 60 characters",
                nowhitespace: "Whitespace is not allowed"
            },
            userPasswordRetype: {
                required: "Please retype the password",
                equalTo: "These passwords don't match"
            }
        }
    });
});