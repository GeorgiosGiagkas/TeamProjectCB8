<%@include file="authorize-user.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>QuizBot</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main-menu.css">
    <link rel="stylesheet" href="/css/user-chat.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

</head>
<body>
<img id = "logo" src = "/images/quizbot-logo2-230.png">
<button id="avatar" class="dropdown-toggle" data-toggle="dropdown"></button>
<div class="dropdown-menu">
    <small id="nickname" class="center"></small>
    <hr>
    <button id="change-avatar" class="btn">Change Avatar</button>
    <a class="dropdown-item" href="/logout"><i class="fas fa-sign-out-alt" aria-hidden="true"></i> Sign out</a>
</div>

<div id="avatar-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="hidden" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div id="avatar-modal-body" class="modal-body">
                <p>My Avatars.</p>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>



<div class="main">
    <div class="contain">
        <div class="box box-1" id="play">
            <div class="cover"><img class="img"
                                    src="https://cdn4.iconfinder.com/data/icons/game-ui-pack-02/500/play-512.png"
                                    alt=""></div>
            <button class="button">
                <div style="text-align: center;"></div>
            </button>


        </div>
        <div class="box box-2" id="leaderboard">
            <div class="cover"><img class="img" src="https://cdn3.iconfinder.com/data/icons/circle-f1/512/F1_15-512.png"
                                    alt=""></div>
            <button class="button">
                <div style="text-align: center;"></div>
            </button>
        </div>
        <div class="box box-3" id="statistics">
            <div class="cover"><img class="img"
                                    src="https://cdn1.iconfinder.com/data/icons/round-color-icon/3/21-512.png" alt="">
            </div>
            <button class="button">
                <div style="text-align: center;"></div>
            </button>
        </div>
        <div class="box box-4" id = "shop">
            <div class="cover"><img class="img"
                                    src="https://cdn3.iconfinder.com/data/icons/gradient-circle/36/2015-512.png" alt="">
            </div>
            <button class="button">
                <div style="text-align: center;"></div>
            </button>
        </div>
    </div>
</div>

<div class = "centered">
    <div class = "blob-1"></div>
    <div class = "blob-2"></div>
</div>

<div style = "width: 800px; font-size: 28px; font-weight: 500; position: absolute; top: 82%; left: 35%; color: #2C3138; " id = "description">

</div>


<audio id="audio-click" src="/sound/click.mp3" autostart="false"></audio>
<audio id="audio-hover" src="/sound/hover.mp3" autostart="false"></audio>

<audio src = "/sound/orion.mp3" autoplay loop></audio>


<button type="button" class="btn btn-info open-button" onclick="openChat(); connect(); getAdmin();"><i
        class="far fa-question-circle icon"></i>Need help?
</button>


<section class="container chat">
    <div>
        <input type="text" hidden id="from" value=<c:out value="${userNickname}" /> />
        <input type="text" hidden id="userAvatarId" value=<c:out value="${userAvatarId}" /> />
    </div>

    <div class="header">
        <div class="chat-header"></div>
        <button id="delete-history-btn" type="button" class="btn" data-toggle="tooltip" data-placement="left"
                title="Delete history"><i class="fas fa-trash-alt"></i></button>
    </div>

    <div class="chat-body">
        <div id="dialog-box"></div>
    </div>

    <div class="chat-body row">
        <div id="conversationDivPrivate">
            <textarea id="textPrivate" placeholder="Write a Private message..." required
                      onfocus="getAdmin()"></textarea>
            <button id="sendMessageBtn" class="btn"><i class="fas fa-paper-plane"></i></button>
        </div>
    </div>

    <div class="chat-footer row">
        <button type="button" class="btn btn-info close-button" onclick="closeChat(); disconnect();"><i
                class="far fa-times-circle icon"></i>Quizbot Help
        </button>
    </div>
</section>


<script src="/js/main-menu.js"></script>
<!-- <script src = "carousel.js"></script> -->
<script src="/js/user-chat.js"></script>

</body>
</html>
