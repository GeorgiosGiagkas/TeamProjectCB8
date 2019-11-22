<%--
  Created by IntelliJ IDEA.
  User: mousa
  Date: 20-Nov-19
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quizbot</title>

    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel = "stylesheet" href = "/css/main-menu.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!-- <img id = "logo" src = "https://upload.wikimedia.org/wikipedia/commons/d/d5/Hey_Machine_Learning_Logo.png">  -->
<button id = "avatar" class = "dropdown-toggle" data-toggle = "dropdown"></button>
<div class="dropdown-menu">
    <small id = "nickname" class = "center"></small>
    <hr>
    <button id = "change-avatar" class = "btn">Change Avatar</button>
    <a class="dropdown-item" href="#"><i class="fa fa-sign-out" aria-hidden="true"></i> Sign out</a>
</div>

<div id = "avatar-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="hidden" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div id = "avatar-modal-body" class="modal-body">
                <p>My Avatars.</p>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>



<div class = "main">
    <div class="contain">
        <div class="box box-1" id = "play">
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
        <div class="box box-4">
            <div class="cover"><img class = "img" src="https://cdn3.iconfinder.com/data/icons/gradient-circle/36/2015-512.png" alt=""></div>
            <button class = "button"><div style = "text-align: center;"></div></button>
        </div>
    </div>
</div>

<audio id = "audio-click" src = "/sound/click.mp3" autostart = "false">
    <audio id = "audio-hover" src = "/sound/hover.mp3" autostart = "false">



        <script src = "/js/main-menu.js"></script>
        <!-- <script src = "carousel.js"></script> -->
</body>
</html>
