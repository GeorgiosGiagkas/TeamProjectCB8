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

</head>
<body>

<div class="invisible" current-user-id="${currentUserId}" avatarCount="${avatarCount}"current-avatar-page="1"></div>

<div class ="container mt-4 bg-light border mb-5 logo">
    <div class="row">
        <div class="col-12"><img src="/images/quizbot-shop-logo-100.png" alt="logo"></div>
    </div>
</div>

<div class ="container mt-4 bg-light shadow mb-5">
    <div class="row">
    <div class="w3-content w3-display-container col-12">
    <div id="showRoom">
    </div>
        <button class="w3-button w3-black w3-display-left">&#10094;</button>
        <button class="w3-button w3-black w3-display-right">&#10095;</button>
        <div id="goldContent"></div>
    </div>
    </div>



</div>

<div class ="container mt-100 bg-light border shadow mb-5">
    <div class="row">
        <div class="col-3"></div>

        <div class="col-9">

        <div id="shopBubble"><img src="/images/shop-robot-bubble-300.png" alt=""><div class="text-center align-middle" id="shopDisplay">Select an Avatar <br /> to Buy <br /> with Gold!</div></div>
        
        </div>
    </div>

    <div class="row">

        <div class="col-1">
            <img src="/images/robot-shop.gif" alt="">
        </div>
    </div>
</div>



<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="/js/shop.js"></script>



</body>
</html>
