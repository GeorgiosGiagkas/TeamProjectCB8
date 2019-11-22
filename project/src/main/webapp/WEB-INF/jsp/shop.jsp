<%--
  Created by IntelliJ IDEA.
  User: omiro
  Date: 31-Oct-19
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QuizBot Shop</title>

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

<div class="invisible" current-user-id="${currentUserId}" avatarCount="${avatarCount}"current-avatar-page="1"></div>

<div class ="container-fluid mt-4 bg-light border mb-5 logo">
    <div class="row">
        <div class="col-12"><img src="/images/quizbot-shop-logo-100.png" alt="logo"></div>
    </div>
</div>

<div class ="container mt-4 bg-light mb-5">
    <div class="row noBackground">
    <div class="w3-content w3-display-container col-12 noBackground">
    <div id="showRoom">
    </div>
        <button class="w3-button w3-black w3-display-left">&#10094;</button>
        <button class="w3-button w3-black w3-display-right">&#10095;</button>
        <div id="goldContent"></div>
        <div class="noBackground"><p>&nbsp;</p></div>
        <div class="noBackground"><p>&nbsp;</p></div>

    </div>
    </div>



</div>

<div class ="container-fluid mt-100 bg-light border shadow mb-5">
    <div class="row">
        <div class="col-3"></div>

        <div class="col-9">

        <div id="shopBubble"><img src="/images/shop-robot-bubble-300.png" alt=""><div class="text-center align-middle" id="shopDisplay">Select an Avatar <br /> to Buy <br /> with Gold!</div></div>
        
        </div>
    </div>

    <div class="row"><p>&nbsp;</p></div>


    <div class="row">
        
        <div class="col-5"></div>


    </div>


    <div class="row"><p>&nbsp;</p></div>


    <div class="row">
        <div class="col-4"></div>

        <div class="col-8 bounceInLeft" id="shopRobot">
            <img src="/images/robot-shop.gif" alt="shop robot" height="250px">
        </div>
    </div>
</div>

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                <%--<h4 class="modal-title" id="myModalLabel">Confirm</h4>--%>
            </div>
            <div class="col-7" id="buyPanel"></div>
            <div class="modal-footer">
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
