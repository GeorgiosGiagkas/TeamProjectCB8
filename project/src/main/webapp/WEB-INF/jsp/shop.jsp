<%@include file="authorize-user.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="/fav.png">
    <title>QuizBot</title>

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <link rel="stylesheet" href="/css/shop.css">
    <style>
        .mySlides {display:none;}
    </style>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Roboto+Condensed:700i&display=swap');
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
</head>
<body>
<audio id="shop-sound" autoplay>
    <source src="/sound/shop-sound-effect.mp3" type="audio/mp3">
</audio>

<audio id="hoverSound"y>
    <source src="/sound/157538__nenadsimic__double-click.wav" type="audio/wav">
</audio>

<audio id="clickSound">
    <source src="/sound/click.mp3" type="audio/mp3">
</audio>

<audio id="cashRegisterSound">
    <source src="/sound/cashRegister.mp3" type="audio/mp3">
</audio>


<div class="invisible" current-user-id="${currentUserId}" avatarCount="${avatarCount}"current-avatar-page="1"></div>

<div class ="container-fluid mt-5 bg-light border mb-5 logo blue">
    <div class="row yellow">
        <div class="col-2 bounceInLeft animated" id="logo"><a href="/menu"><img src="/images/quizbot-logo2-230.png" alt="logo"></a></div>
        <div class="col-4" id="loading"><img src="/images/robot-loading.gif" alt="logo" height="70px"></div>


    </div>


</div>

<div id="avatars" class ="container mt-5 bg-light mb-5 bounceInRight animated">
    <div class="row blue">
    <div class="w3-content w3-display-container col-12 blue">
    <div id="showRoom" class="blue">
    </div>
        <button class="w3-button w3-green w3-display-left">&#10094;</button>
        <button class="w3-button w3-green w3-display-right">&#10095;</button>
        <div id="goldContent"></div>
        <div class="blue"><p>&nbsp;</p></div>
        <div class="blue"><p>&nbsp;</p></div>

    </div>
    </div>



</div>

<div class ="container-fluid mt-100 bg-light border shadow mb-5 yellow">
    <div class="row">
        <div class="col-3"></div>

        <div class="col-9">

        <div id="shopBubble"><img src="/images/shop-robot-bubble-300.png" alt="robot bubble"><div class="text-center align-middle bluefont" id="shopDisplay">Select an Avatar <br /> to Buy <br /> with Gold!</div></div>
        
        </div>

    </div>

    <div class="row"><p>&nbsp;</p></div>


    <div class="row">
        
        <div class="col-5"></div>


    </div>


    <div class="row"><p>&nbsp;</p></div>


    <div class="row" id="foot">
        <div class="col-1"></div>

        <div class="col-3 bounceInLeft animated" id="shopRobot">
            <img src="/images/robot-shop.gif" alt="shop robot" height="350px">
        </div>
        <div class="col-5 bounceInRight animated text-left" id="instructions">
            <pre class="bluefont">
<u><span class="lila">Not Enough Gold?</span></u>
- Earn more by playing or
- Buy some through Paypal!


            </pre>
        </div>
        <div class="col-1 bounceInRight animated" id="potGold">
            <img src="/images/potGold-350.png" alt="pot of gold" height="350px">
        </div>
        <div class="col-1 bounceInUp animated" id="paypal">
            <img src="/images/paypal-gold-150.png" alt="logo" height = "73px" class="rounded hvr-shrink">
        </div>
        <div class="col-1 bounceInDown animated" id="myWallet"></div>
    </div>
</div>

<div class="modal fade shadow" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header blue">
                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                <%--<h4 class="modal-title" id="myModalLabel">Confirm</h4>--%>
            </div>
            <%--<div class="col-7" id="buyPanel"></div>--%>
            <div id="buyPanel" class="yellow"></div>
            <div class="modal-footer blue">
                <button type="button" class="btn btn-primary btn-lg" id="modal-btn-buy" selected-avatar-id="">Buy</button>
                <button type="button" class="btn btn-secondary btn-lg" id="modal-btn-cancel">Cancel</button>
            </div>
        </div>
    </div>
</div>




<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="/js/shop.js"></script>



</body>
</html>
