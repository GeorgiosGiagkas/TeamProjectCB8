"use strict";

$(document).ready(function() {

    const invisible = document.querySelector(".invisible");
    const currentUserId = invisible.getAttribute("current-user-id");
    const currentAvatarPage = invisible.getAttribute("current-avatar-page");

    // to set attribute for later pages use, during the current page creation:
    //     invisible.setAttribute(`current-avatar-page`,`{currentAvatarPage}`);

    const fetchURL = "getShopDtoByUserId/" + currentUserId + "?page=" + currentAvatarPage + "&size=6";

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

    fetch(`${fetchURL}`)
        .then(success) // successful response
        .then(handleData)
        .catch(error); // error




})