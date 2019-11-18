$(document).ready(function() {

    $(".login").addClass("test")
    setTimeout(function(){
        $(".login").addClass("testtwo")
    },300);
    setTimeout(function(){
        $(".authent").show().animate({right:-320},{easing : "easeOutQuint" ,duration: 600, queue: false });
        $(".authent").animate({opacity: 1},{duration: 200, queue: false }).addClass("visible");
    },350);

    setTimeout(function(){
        $(".authent").show().animate({right:90},{easing : "easeOutQuint" ,duration: 600, queue: false });
        $(".authent").animate({opacity: 0},{duration: 200, queue: false }).addClass("visible");
        $(".login").removeClass("testtwo")
    },2800);
    setTimeout(function(){
        $(".login").removeClass("test")
        $(".login div").fadeOut(123);
    },2800);
    setTimeout(function(){
        $(".success").fadeIn();
    },2800);

    setTimeout(function() {
        const redirect = document.getElementById("redirect");
        redirect.click();
    }, 5000);

});




