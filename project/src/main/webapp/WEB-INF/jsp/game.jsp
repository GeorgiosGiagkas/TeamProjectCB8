<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: giagkas
  Date: 16/10/19
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <%--Bootstrap--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <%--font awsome--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <%--jquery--%>
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <%--game css--%>
    <link rel="stylesheet" type="text/css" href="/css/game.css">
    <%--winwheel--%>
    <script type="text/javascript" src="/js/Winwheel.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>


    <title>Quizbot</title>

</head>
<body>

<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">Quizbot</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            <span class="nav-item nav-link">Sound Toggle</span>
            <a class="nav-item nav-link" href="#">Logout</a>

            <span id="category-highscore" class="nav-item nav-link">Category HighScore: ${gameStateSubject.highscore}</span>
            <span id="current-score" class="nav-item nav-link">Current Score: 0</span>

        </div>
    </div>
</nav>


<div class="container" >
    <div  id="countdown"></div>
</div>

<div id="points-message" class="container" >
    
</div>

<div id="wheel" class="mt-5">
    <div id="indicator">
        <i class="fas fa-angle-double-down fa-2x"></i>
    </div>
    <div width="438" height="582" class="the_wheel" align="center" valign="center">
        <canvas id="canvas" width="434" height="434">
            <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try another.
            </p>
        </canvas>
    </div>
</div>


<div id="question" class="container">
    <div class="jumbotron">
        <p id="question-content"></p>
    </div>
    <div id="answers">


    </div>
</div>


<div class="container mt-5" id="start">

    <div class="row">
        <button class="start-btn">Start Quiz</button>
    </div>

</div>





<script type="application/javascript" src="/js/game.js">

</script>


</body>
</html>
