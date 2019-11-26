"use strict";



$(document).ready(function() {

    setTimeout(function(){

    const leftButton = document.querySelector(".w3-display-left");
    const RightButton = document.querySelector(".w3-display-right");
    const invisible = document.querySelector(".invisible");
    const display = document.querySelector("#shopDisplay");
    const buyPanel = document.querySelector("#buyPanel");
    const myWallet = document.querySelector("#myWallet");
    const currentUserId = invisible.getAttribute("current-user-id");
    const clickSound = document.querySelector("#clickSound");
    const cashRegisterSound = document.querySelector("#cashRegisterSound");
    const paypalLink = document.querySelector("#paypal");

    paypalLink.addEventListener("click", function () {
        location.href = "/payment";
    });


    leftButton.addEventListener("click", function(){
        clickSound.play();
        plusDivs(-1);
    });

    RightButton.addEventListener("click", function(){
        clickSound.play();
        plusDivs(1);
    });



    const success = (response) =>
    {
        return response.json();
    }

    const handleData = (data) =>
    {
        console.log("data", data);

        let myWalletData = data.userWallet;
        let myWalletContent = `<p><img src="/images/money-bag.png" alt="my wallet" height="120px""><div class="text-center" id="myGold">${myWalletData}<div class="bounceInUp animated" id="arrow-parent"><div class="pulse animated infinite" id="arrow"><img src="/images/curvedArrow-160.png" alt="arrow"></div></div></div> </p>`;
        myWallet.innerHTML = `${myWalletContent}`;
        let content = `<div class="row d-flex justify-content-between">`;
        let costContent = `<div class="row d-flex justify-content-between mb-400">`;
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
                       <div class="avatar text-center nopadding hvr-shrink"> <img src="/images/${currentAvatarId}.jpg" alt="Avatar" width="200px" height="200px">
                       <div class="overlay text-center nopadding ${itemClass}" avatarIndex="${currentAvatarIndex}"><img src="/images/${overlayURL}" alt="Avatar" width="200px" height="200px"></div>
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
        const hoverSound = document.querySelector("#hoverSound");
        const selectedAvatarIndex = event.srcElement.parentElement.attributes[1].value;
        console.log("in:", event.srcElement.parentElement.attributes[1].value);
        console.log("Name: ",data.allAvatars[selectedAvatarIndex].avatarName);
        console.log("Name: ",data.allAvatars[selectedAvatarIndex].avatarCost);
        const avatarName = data.allAvatars[selectedAvatarIndex].avatarName;
        const avatarCost = data.allAvatars[selectedAvatarIndex].avatarCost;

        display.innerHTML = `<span class="bluefont">Click to Buy</span> <br /> <span class="lila">${avatarName}</span> <br /> <span class="bluefont">for </span><span class="lila">${avatarCost}</span><span class="bluefont"> Gold!</span>`;
        hoverSound.play();
    }

    function removeBuyPrompt(){
        console.log("out:");
        display.innerHTML = `Select an Avatar <br /> to Buy <br /> with Gold!`;
    }



        function checkout(event){

            // add avatar to user's collection
            // remove money from user's wallet (update session userDto and database)
            // refresh shop page at the same point position, only this time new avatar is owned
            const avatarId = event.currentTarget.attributes[3].nodeValue;


            const shopTranscactionURL = "/doShopTranscation/"+currentUserId+"/"+avatarId;

            const success = (response) => {
                return response.json();
            };

            const handleData = () => {
                console.log("transaction ok")
                cashRegisterSound.play();
                plusDivs(0);
                console.log("show avatars after transcaction")

            }

            const error = (err) => {
                console.error("Fetch error", err);
            };

            fetch(`${shopTranscactionURL}`)
                .then(success) // successful response
                .then(handleData)
                .catch(error); // error

        }



        const buyButton = document.getElementById("modal-btn-buy");


        const cancelButton = document.getElementById("modal-btn-cancel");



        $(buyButton).on("click", function(event){
            checkout(event)
            $("#mi-modal").modal('hide');
        });

        $(cancelButton).on("click", function(){
            $("#mi-modal").modal('hide');
        });



    function showBuyPanel(event,data){

        const selectedAvatarIndex = event.srcElement.parentElement.attributes[1].value;
        const avatarName = data.allAvatars[selectedAvatarIndex].avatarName;
        const avatarCost = data.allAvatars[selectedAvatarIndex].avatarCost;
        const avatarId = data.allAvatars[selectedAvatarIndex].avatarId;

        buyButton.setAttribute("selected-avatar-id",avatarId);

        buyPanel.innerHTML = `<div class="text-center"><span class="bluefont">Buy </span><span class="lila">${avatarName}</span><br><span class="bluefont">for </span><span class="lila">${avatarCost}</span><span class="bluefont"> Gold?</span></div>`;






        $("#mi-modal").modal('show');

    };



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






    }




    const error = (err) => {
        console.error("Fetch error", err);
    };




// slideshow code

    // START
    const loading = document.querySelector("#loading");
    loading.style.opacity="0";


    const shopBubble = document.querySelector("#shopBubble");
    shopBubble.style.opacity="1";






    var slideIndex = 1;

    function plusDivs(n) {
        showDivs(slideIndex += n);

    }


    showDivs(slideIndex);





    function showDivs(n) {



        const avatarCount = invisible.getAttribute("avatarCount");


        let avatarPageCount;

        if(avatarCount%5==0){
            avatarPageCount = (avatarCount/5);
        } else {
            avatarPageCount = (((avatarCount) - (avatarCount%5))/5) +1;
        }


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



    }, 2000);

})


