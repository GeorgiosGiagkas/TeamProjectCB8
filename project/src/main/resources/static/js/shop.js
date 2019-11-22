"use strict";



$(document).ready(function() {

    const leftButton = document.querySelector(".w3-display-left");
    const RightButton = document.querySelector(".w3-display-right");
    const invisible = document.querySelector(".invisible");
    const display = document.querySelector("#shopDisplay");
    const buyPanel = document.querySelector("#buyPanel");
    const currentUserId = invisible.getAttribute("current-user-id");



    leftButton.addEventListener("click", function(){
        plusDivs(-1);
    });

    RightButton.addEventListener("click", function(){
        plusDivs(1);
    });



    const success = (response) =>
    {
        return response.json();
    }

    const handleData = (data) =>
    {
        console.log("data", data);


        let content = `<div class="row d-flex justify-content-between">`
        let costContent = `<div class="row d-flex justify-content-between mb-400">`
        let itemClass;

        for (let i = 0; i<data.allAvatars.length ; i++)
        {
            let currentAvatarId = data.allAvatars[i].avatarId;
            let currentAvatarIndex = i;
            let currentAvatarCost = data.allAvatars[i].avatarCost;
            let overlayURL="";

            if (data.allOwnedAvatars.includes(currentAvatarId)){
                itemClass = "owned";
                overlayURL = "owned.png"
            } else if(currentAvatarCost>data.userWallet) {
                itemClass = "notEnoughGold";
                overlayURL = "notEnoughGold.png"
            } else {
                itemClass = "normal";
                overlayURL = "trans.png"
            }



            content +=`                  
                       <div class="avatar text-center" nopadding> <img src="/images/${currentAvatarId}.jpg" alt="Avatar" width="200px" height="200px">
                       <div class="overlay text-center nopadding  ${itemClass}" avatarIndex="${currentAvatarIndex}"><img src="/images/${overlayURL}" alt="Avatar" width="200px" height="200px"></div>
                       </div> 
                        
                        `

            costContent += `<div class="col-2 text-center nopadding"><div class="coin"><img src="/images/coin-pouch-100.png" alt="goldCoins"><div class="cost text-center">${currentAvatarCost}</div></div></div>
                            `


        }

        content += `</div>`
        costContent += `</div>`



        const showRoom = document.querySelector("#showRoom");
        const goldContent = document.querySelector("#goldContent");

        showRoom.innerHTML = content;
        goldContent.innerHTML = costContent;

        return data;

    }

    function toggleSelected(event){
        event.target.classList.toggle("active");

    }

    function displayBuyPrompt(event, data){
        const selectedAvatarIndex = event.srcElement.parentElement.attributes[1].value;
        console.log("in:", event.srcElement.parentElement.attributes[1].value);
        console.log("Name: ",data.allAvatars[selectedAvatarIndex].avatarName);
        console.log("Name: ",data.allAvatars[selectedAvatarIndex].avatarCost);
        const avatarName = data.allAvatars[selectedAvatarIndex].avatarName;
        const avatarCost = data.allAvatars[selectedAvatarIndex].avatarCost;

        display.innerHTML = `Click to Buy <br /> <span class="tomato">${avatarName}</span> <br /> for <span class="tomato">${avatarCost}</span> Gold!`;
    }

    function removeBuyPrompt(){
        console.log("out:");
        display.innerHTML = `Select an Avatar <br /> to Buy <br /> with Gold!`;
    }


    function showBuyPanel(event,data){
        let modalConfirm = function(callback){
        const selectedAvatarIndex = event.srcElement.parentElement.attributes[1].value;
        const avatarName = data.allAvatars[selectedAvatarIndex].avatarName;
        const avatarCost = data.allAvatars[selectedAvatarIndex].avatarCost;
        const avatarId = data.allAvatars[selectedAvatarIndex].avatarId;

        const buyButton = document.getElementById("modal-btn-buy");
        buyButton.setAttribute("selected-avatar-id",avatarId);


        buyPanel.innerHTML = `<div class="text-center">Buy <span class="tomato">${avatarName}</span> for <span class="tomato">${avatarCost}</span> Gold?"</div>`;
        $("#mi-modal").modal('show');

        // confirmation modal


            $("#modal-btn-buy").on("click", function(event){
                callback(true, event);
                $("#mi-modal").modal('hide');
            });

            $("#modal-btn-cancel").on("click", function(){
                callback(false);
                $("#mi-modal").modal('hide');
            });
        };

        function checkout(data, event){

            // add avatar to user's collection
            // remove money from user's wallet (update session userDto and database)
            // refresh shop page at the same point position, only this time new avatar is owned
            const avatarId = event.currentTarget.attributes[3].nodeValue;


            const shopTranscactionURL = "/doShopTranscation/"+currentUserId+"/"+avatarId;

            const success = (response) => {
                return response.json();
            };

            const handleData = (data) => {
                console.log("transaction ok")
                plusDivs(0);

            }

            const error = (err) => {
                console.error("Fetch error", err);
            };

            fetch(`${shopTranscactionURL}`)
                .then(success) // successful response
                .then(handleData)
                .catch(error); // error




        }

        modalConfirm(function(confirm, event){
            if(confirm){
                checkout(data, event);
            }
        });

        // confirmation modal end

    }

    function activateShopping(data){
        const shoppableAvatars = document.getElementsByClassName("normal");

        console.log("Shoppable: ",shoppableAvatars );
        for (let i = 0 ; i < shoppableAvatars.length; i++) {
            const data2 = data;
            shoppableAvatars[i].addEventListener('mouseover' , function(event){
                toggleSelected(event);
                displayBuyPrompt(event, data2);
            }, false ) ;

            shoppableAvatars[i].addEventListener('mouseout' , function(event){
                toggleSelected(event);
                removeBuyPrompt();
            }, false ) ;

            shoppableAvatars[i].addEventListener("click", function(event){
                showBuyPanel(event, data2);
            }, false)

        }

        // TOGGLE ANIMATE HERE
        const robot = document.querySelector("#shopRobot")

        function activateShopRobotAnimation(){
            robot.classList.toggle("animated");
        }

        setTimeout(function(){ alert("Hello"); }, 3000);




    }




    const error = (err) => {
        console.error("Fetch error", err);
    };




// slideshow code

    // START

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
            .then(activateShopping)
            .catch(error); // error

    }



})