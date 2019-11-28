
let user;

function playClick() {
    $("#audio-click")[0].currentTime = 0;
    $("#audio-click")[0].play();
}

function playHover() {
    $("#audio-hover")[0].currentTime = 0;
    $("#audio-hover")[0].play();
}

function returnMain() {
    //removeCategories();
    $(".contain").html("");
    let main = `<div class="box box-1" id = "play">
                            <div class="cover"><img class = "img" src="https://cdn4.iconfinder.com/data/icons/game-ui-pack-02/500/play-512.png" alt=""></div>
                            <button class = "button"><div style = "text-align: center;"></div></button>
                            </div>
                            <div class="box box-2" id = "leaderboard">
                            <div class="cover"><img class = "img" src="https://cdn3.iconfinder.com/data/icons/circle-f1/512/F1_15-512.png" alt=""></div>
                            <button class = "button"><div style = "text-align: center;"></div></button>
                            </div>
                            <div class="box box-3" id = "statistics">
                            <div class="cover"><img class = "img" src="https://cdn1.iconfinder.com/data/icons/round-color-icon/3/21-512.png" alt=""></div>
                            <button class = "button"><div style = "text-align: center;"></div></button>
                            </div>
                            <div class="box box-4" id = "shop">
                            <div class="cover"><img class = "img" src="https://cdn3.iconfinder.com/data/icons/gradient-circle/36/2015-512.png" alt=""></div>
                            <button class = "button"><div style = "text-align: center;"></div></button>
                            </div>
                            </div>`;
    $(".contain").html(main);
    init();
}

function removeCategories() {
    $(".box-category").css({
        "animation": "bounceOutRight ease 1s"
    });
    $(".box-init").css({
        "animation": "fadeOut ease 1s"
    });
}

function removeLeaderboard() {
    $(".table, #categorySelect").css({
        "animation": "bounceOutRight ease 1s"
    });
    $(".box-init").css({
        "animation": "fadeOut ease 1s"
    });
}

function appendCategories(categories) {

    let boxInit = `<div class="box box-init">
                                <div class="cover"><img class = "img" src="https://image.flaticon.com/icons/png/512/122/122659.png" alt=""></div>
                                <button class = "button"><div style = "text-align: center;"></div></button>
                        </div>`;
    $(".contain").append(boxInit);
    for (let category of categories) {
        if (category.categoryId != 14) {
            const id = `#${category.categoryName}`;
            let box = `<div class="box box-category" data-category-id="${category.categoryId}" id = "${category.categoryName}">
                                    <div class="cover"><img class = "img" src="/images/${category.categoryName}.jpg" alt=""></div>
                                    <button class = "button"><div id = ${id}-btn style = "text-align: center;"></div></button>
                                </div>`;

            $(".contain").append(box);


            $(""+id).click(handleClickOnCategory);
        }
    }
}

function handleClickOnCategory(){

    const categoryId=this.getAttribute("data-category-id");
    window.location.href ="/start-game?category-id="+categoryId;
    startGameAnimation();
}

function startGameAnimation(){
    $(".box-category").css({
        "pointer-event":"none",
        "animation": "bounceOutRight ease 1s"
    });
    $('.box-category').on("animationend", function(){
        $(this).css('display', 'none');
    });
    $(".box-init").css({
        "pointer-event":"none",
        "animation": "fadeOut ease 1s"
    });
    $('.box-init').on("animationend", function(){
        $(this).css('display', 'none');
    });
    setTimeout(function(){
        displayLoading();
    },500);
}
function displayLoading(){
    $('.centered').css('display','block');
}


function appendCategorySelector(categories) {
    //$(".contain").html("");
    let boxInit = `<div class="box box-init">
                                <div class="cover"><img class = "img" src="https://image.flaticon.com/icons/png/512/122/122659.png" alt=""></div>
                                <button class = "button"><div style = "text-align: center;"></div></button>
                        </div>`;
    $(".contain").append(boxInit);
    let table = `<table class = "table col-md-2 borderless">
    <thead>
    <th>USER</th>
    <th> </th>
    <th>HIGHSCORE</th>
    </thead>
    <tbody id = "rows">`;



    $.ajax(
        {
            url: "/getLeaderboardByCategoryId/26",
            async: false
        }
    ).then(function (userScores) {
        let max;
        if (userScores.length != 0) {
            max = userScores[0][1];
        }
        let counter = 0;
        for (let userScore of userScores) {
            counter++;
            let nicknameData;
            if(userScore[0] == user.userNickname){ nicknameData = `<td><strong>${userScore[0]}</strong></td>`;}
            else{
                nicknameData = `<td>${userScore[0]}</td>`;
            }
            let row = `<tr>
            ${nicknameData}
            <td><progress id = "progress-${counter}" value=0 max="100"></progress></td>
            <td>${userScore[1]}</td>
            </tr>`;
            table += row;

            let id = "#progress-" + counter;
            slowlyLoad(max, userScore[1], id);
        }

        table += `</tbody>
                </table>`;
        $(".contain").append(table);
        $(".box, .box-init").click(function () {
            playClick();
        });
        let selector = `<div id="categorySelect">
        <ul id="selectbox" class="closed">`;
        for (let category of categories) {
            let categoryOption = `<li>${category.categoryName}</li>`;
            selector += categoryOption;
        }
        selector += "</ul></div>";
        $(".contain").append(selector);
        $("#categorySelect ul li:first-child").css({ "backgroundColor": "#f9ed99", "color": "#2C3138", "border": "3px solid #fca959" });
    });


}

function loadStatistics(categoryScores) {
    let boxInit = `<div class="box box-init">
                                <div class="cover"><img class = "img" src="https://image.flaticon.com/icons/png/512/122/122659.png" alt=""></div>
                                <button class = "button"><div style = "text-align: center;"></div></button>
                        </div>`;
    $(".contain").append(boxInit);
    let table = `<table id = "stats" class = "table col-md-2 borderless">
    <thead>
    <th>CATEGORY</th>
    <th>HIGHSCORE</th>
    <th>POSITION</th>
    </thead>
    <tbody id = "rowsStat">`;

    let emptyDiv = `<div style = "width: 300px"></div>`;



    for (let categoryScore of categoryScores) {
        let position;
        let row = `<tr>
        <td>${categoryScore.category}</td>
        <td>${categoryScore.score}</td>
        <td> ${categoryScore.position} </td>
        </tr>`;
        table += row;
    }
    table += `</tbody>
    </table>`;
    $(".contain").append(table);
    $(".contain").append(emptyDiv);
    $(".box, .box-init").click(function () {
        playClick();
    });
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function slowlyLoad(max, thisScore, id) {
    await sleep(150);
    let ratio = (thisScore / max) * 100;
    let secs = 2000;
    let count = 0;

    let $bar = $(id);
    while ($bar.val() < ratio) {
        count += 0.0025;
        $bar.val($bar.val() + count);
        await sleep(1);
    }


}

function loadLeaderboard(categoryName) {
    getUser();
    $.ajax(
        {
            url: "/getLeaderboardByCategoryName/" + categoryName
        }
    ).then(async function (userScores) {
        let max;
        $("#rows").html("");
        if (userScores.length != 0) {
            max = userScores[0][1];
        }
        let thead = `<th>PLAYER</th>
        <th> </th>
        <th>HIGHSCORE</th>`;
        $("thead").html("");
        $("thead").append(thead);
        let counter = 0;
        for (let userScore of userScores) {
            counter++;
            let nicknameData;
            if(userScore[0] == user.userNickname){ nicknameData = `<td><strong>${userScore[0]}</strong></td>`;}
            else{
                 nicknameData = `<td>${userScore[0]}</td>`;
            }
            let row = `<tr>
            ${nicknameData}
            <td><progress id = "progress-${counter}" value=0 max="100"></progress></td>
            <td>${userScore[1]}</td>
            </tr>`;
            $("#rows").append(row);
            let id = "#progress-" + counter;
            //console.log($(id).attr("value"));
            slowlyLoad(max, userScore[1], id);

        }
        $(".box, .box-init").click(function () {
            playClick();
        });

    });
}

function setUserInfo(){
    $.ajax(
        {
            url: "/get-user-info"
        }
    ).then(function (user) {
        let nickname = user.userNickname;
        $("#nickname").html("");
        $("#nickname").html(nickname);
        $("#avatar").css({"backgroundImage" : "url(/images/"+user.selectedAvatarId+".jpg)"});
    });
}

function getUser() {
    $.ajax({
        url: '/get-user-info',
        type: 'GET',
        async: false,
        success: function(user) {


            var thisuser = user;
            getUserInfo(thisuser); // dont use the value till the ajax promise resolves here

        }
    })
}


function getUserInfo(thisuser){
    user = thisuser;
}




function init() {
    $(document).ready(function () {
        getUser();
        console.log(user);
        setUserInfo();
        $("#change-avatar").click(function () {
            $(".btn").click(function () {
                playClick();
            });
            $("body").on("click", ".modal-dialog", function(e) {
                if ($(e.target).hasClass('modal-dialog')) {
                    var hidePopup = $(e.target.parentElement).attr('id');
                    $('#' + hidePopup).modal('hide');
                }
            });
            $.ajax(
                {
                    url: "/getShopDtoByUserId/"+user.userId
                }
            ).then(function (shop) {
                let carousel = `<div class = "scene"><div class = "carousel">`;
                $("#avatar-modal-body").html("");
                for (let avatarId of shop.allOwnedAvatars) {
                    let avatar = `<div id = "avatar-${avatarId}" class = "carousel__cell"> <img class = "avatar-img" data-avatarId = ${avatarId} src = "/images/${avatarId}.jpg" alt = ""></div>`;
                    carousel += avatar;
                }
                carousel += `</div></div>`;

                let controls = `<p style="text-align: center;">
                <i class="previous-button left i"></i>
                <i class="next-button right i"></i>
                 </p>`;

                $("#avatar-modal-body").append(controls);
                $("#avatar-modal-body").append(carousel);
                
                $("#avatar-modal").modal("show");


                let carouselElem = document.querySelector('.carousel');
                let  cellCount = 9;
                var selectedIndex = 0;

                function rotateCarousel() {
                    let angle = selectedIndex / cellCount * -360;
                    carouselElem.style.transform = 'translateZ(-288px) rotateY(' + angle + 'deg)';
                }

                let prevButton = document.querySelector('.previous-button');
                prevButton.addEventListener('click', function () {
                    
                    selectedIndex--;
                    playHover();
                    rotateCarousel();
                });

                let nextButton = document.querySelector('.next-button');
                nextButton.addEventListener('click', function () {
                    selectedIndex++;
                    playHover();
                    rotateCarousel();
                });

                $(".avatar-img").click(function(e){
                    playClick();
                    let img = e.target;
                    let imageFile = img.getAttribute("src");
                    let avatarId = img.getAttribute("data-avatarId");
                    $("#avatar").css({"backgroundImage" : "url("+imageFile+")"});
                    $.ajax({
                        type: "POST",
                        url: "/set-selected-avatar?avatarId="+avatarId,
                        success: function (data) {

                            var json = "<h4>Ajax Response</h4><pre>"
                                + JSON.stringify(data, null, 4) + "</pre>";
                            $('#feedback').html(json);

                            console.log("SUCCESS : ", data);
                            $("#btn-search").prop("disabled", false);

                        },
                        error: function (e) {

                            var json = "<h4>Ajax Response</h4><pre>"
                                + e.responseText + "</pre>";
                            $('#feedback').html(json);

                            console.log("ERROR : ", e);
                            $("#btn-search").prop("disabled", false);

                        }
                    });
                });
            });

            


        });
        $(".box").click(function () {
            playClick();
        });
        $(".box-1, .box-2, .box-3").click(function () {
            $("#description").html("");
        });

        $("#play").click(function () {
            $(".contain").html("");
            $.ajax(
                {
                    url: "/show-categories"
                }
            ).then(function (categories) {
                appendCategories(categories);
                $(".box, .box-init").click(function () {
                    playClick();
                });
                $(".box-init").click(async function () {
                    removeCategories();
                    await sleep(700);
                    returnMain();
                });

                $("[data-category-id]").hover(function(e) {
                    let categoryName = $(this).attr("id");
                    console.log(categoryName);
                    if(categoryName != null){
                        let message = `<p>${categoryName}</p>`;
                        $("#description").html("");
                        $("#description").html(message);
                    }
                });

                $("[data-category-id]").mouseleave(function () {
                    $("#description").html("");
                });
            });
        });

        $("#leaderboard").click(function () {
            $(".contain").html("");
            $.ajax(
                {
                    url: "/show-categories"
                }
            ).then(async function (categories) {
                appendCategorySelector(categories);
                await sleep(100);
                $(".box, .box-init").click(function () {
                    playClick();
                });
                $("#categorySelect li").click(function (e) {
                    $("#categorySelect li").css({ "backgroundColor": "transparent", "color": "#f9ed99", "border": "none" });
                    $(e.target).css({ "backgroundColor": "#f9ed99", "color": "#2C3138", "border": "3px solid #fca959"});
                    let categoryName = e.target.innerText;
                    loadLeaderboard(categoryName);
                    playClick();
                });

                $(".box-init").click(async function () {
                    removeLeaderboard();
                    await sleep(700);
                    returnMain();

                });
            });
        });

    });

    $("#statistics").click(function () {
        $(".contain").html("");
        $.ajax(
            {
                url: "/get-user-stats"
            }
        ).then(function (categoryScores) {
            $(".box, .box-init").click(function () {
                playClick();
            });
            loadStatistics(categoryScores);
            $(".box-init").click(async function () {
                removeLeaderboard();
                await sleep(700);
                returnMain();
            });
        });
    });

    $("#shop").click(function () {
       location.href = "/show-shop";
    });

    $("#play").hover(function () {
       let message = `<p class = "message">Answer questions to test your knowledge.<br> Hurry up, though, time is against you!</p>`;
       $("#description").html("");
       $("#description").html(message);
    });

    $("#leaderboard").hover(function () {
        let message = `<p class = "message">Earn some serious points and <br> be one of the top 10 of the leaderboard!</p>`;
        $("#description").html("");
        $("#description").html(message);
    });

    $("#statistics").hover(function () {
        let message = `<p class = "message">Revisit your statistics frequently to <br> explore your strengths and weaknesses.</p>`;
        $("#description").html("");
        $("#description").html(message);
    });

    $("#shop").hover(function () {
        let message = `<p class = "message">Your personality is unique. <br> Check our collection to choose an avatar that fits you.</p>`;
        $("#description").html("");
        $("#description").html(message);
    });




    $(".box").mouseleave(function () {
       $("#description").html("");
    });
}

init();