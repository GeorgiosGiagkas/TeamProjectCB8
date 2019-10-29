$(document).ready(function(){

    $("#loginForm").validate({
        rules: {
            userNickname: "required",
            userPassword: "required"
        },
        messages: {
            userNickname: {
                required: "Please enter a nickname",
            },
            userPassword: {
                required: "Please enter a password",
            }
        }
    });
});