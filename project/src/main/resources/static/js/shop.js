"use strict";



$(document).ready(function() {

    const leftButton = document.querySelector(".w3-display-left");
    const RightButton = document.querySelector(".w3-display-right");
    const invisible = document.querySelector(".invisible");
    const currentUserId = invisible.getAttribute("current-user-id");



    leftButton.addEventListener("click", function(){
        plusDivs(-1);
    });

    RightButton.addEventListener("click", function(){
        plusDivs(1);
    });






    function createTable(data){
        // console.log("table:", data[0].allAvatars[0].avatarId);
    };

    const success = (response) =>
    {
        return response.json();
    }

    const handleData = (data) =>
    {
        console.log("data", data);

        console.log("table:", data.allAvatars[0].avatarId);

        const imageId = data.allAvatars[0].avatarId;

        const tempImage = document.querySelector("#tempImage");

        tempImage.innerHTML=`<img src="/images/${imageId}.jpg" alt="Avatar" height="200" width="200">`;



    }

    const error = (err) => {
        console.error("Fetch error", err);
    };




// slideshow code

    var slideIndex = 1;

    function plusDivs(n) {
        showDivs(slideIndex += n);

    }


    showDivs(slideIndex);




    function showDivs(n) {



        const avatarCount = invisible.getAttribute("avatarCount");
        const avatarPageCount = ((avatarCount-avatarCount%5)/5)+1;
        if (n > avatarPageCount) {slideIndex = 1}
        if (n < 1) {slideIndex = avatarPageCount} ;
        invisible.setAttribute(`current-avatar-page`,slideIndex.toString());
        console.log("Page No:", slideIndex);
        updateData();



    }

// end of slideshow code



    function updateData() {

        const currentAvatarPage = invisible.getAttribute("current-avatar-page");
        const currentAvatarPageToFetch = currentAvatarPage - 1;
        const fetchURL = "getShopDtoByUserId/" + currentUserId + "?page=" + currentAvatarPageToFetch + "&size=5";

        fetch(`${fetchURL}`)
            .then(success) // successful response
            .then(handleData)
            .catch(error); // error

    }



})