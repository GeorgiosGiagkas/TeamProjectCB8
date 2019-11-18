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




$('#userNickname,#userPass').focus(function(){
    $(this).prev().animate({'opacity':'1'},200)
});
$('#userNickname,#userPass').blur(function(){
    $(this).prev().animate({'opacity':'.5'},200)
});
$('#userNickname,#userPass').keyup(function(){
    if(!$(this).val() == ''){
        $(this).next().animate({'opacity':'1','right' : '30'},200)
    } else {
        $(this).next().animate({'opacity':'0','right' : '20'},200)
    }
});