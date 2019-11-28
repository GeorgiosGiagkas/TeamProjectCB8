<%@include file="authorize-user.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%--bootstrap--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <%--font awsome--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <%--animate css--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <%--google fonts--%>
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">

    <%--game css--%>
    <link rel="stylesheet" type="text/css" href="/css/main-game.css">
    <%--winwheel--%>
    <script type="text/javascript" src="/js/Winwheel.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>


    <link rel="icon" type="image/png" href="/fav.png">
    <title>QuizBot</title>

</head>
<body>




<div id="main-container">
    <aside id="user-section">

        <a href="/menu"><img id="logo" src="/images/quizbot-logo2-230.png"></a>

        <div class="container score-container">


            <div id="score-container">
                <div id="score-label">SCORE</div>
                <span id="currentscore"></span>
                <div id="new-highscore-label">New HighScore!</div>
            </div>
        </div>

        <div id="drop-menu" >
            <div id = "nickname" class = "center"><c:out value="${nickname}"/></div>
            <hr>
            <ul>
                <li ><a  href="/menu"><i class="fas fa-bars"></i>Main Menu</a></li>
                <li ><a  href="/logout"><i class="fas fa-sign-out-alt"></i>Sign out</a></li>
            </ul>
        </div>

        <footer id="user-footer">
            <img id="user-avatar" src="/images/${selectedAvatarId}.jpg" alt="User avatar">
        </footer>

    </aside>

    <main id="game-section">

        <div id="end-bubble">
            <div id="end-bubble-text-container">
                    <span id="end-bubble-text"></span>
            </div>
            <div id="end-game-options">
                <a href="/menu" id="end-game-btn" class="underline">End Game</a>
                <a href="#" id="replay-btn">Play Again</a>
            </div>
            <img id="end-bubble-icon" src="/images/botaki-bubble-big2-600.png" alt="end bubble text">

        </div>


        <div id="wheel" class="mt-5">
            <div id="indicator">
                <i id="indicator-arrow" class="fas fa-angle-double-down fa-2x"></i>
            </div>
            <div width="438" height="582" class="the_wheel" align="center" valign="center">
                <canvas id="canvas" width="434" height="434">
                    <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try
                        another.
                    </p>

                </canvas>
                <div class="inner"></div>
            </div>
        </div>
        <div id="points-info-container" class="container">
            <span id="points"> </span> <i class="fas fa-times"></i> <i class="far fa-clock"></i>
        </div>

        <div id="game-info-container" class="container">

            <div id="timer-container">
                <div id="timer">20</div>
            </div>
            <span id="round"></span>

        </div>


        <div id="quiz-container" class="container">
                <span id="question-content">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Enim officia consectetur nostrum nobis,
                    tempore tenetur expedita adipisci error nam repudiandae, dolorem ea delectus? Ipsa corrupti itaque
                    deleniti
                    reiciendis architecto! Fugiat! </span>
        </div>

        <div id="button-container" class="container">
            <div id="answers-container" class="row">
                <div id="a1" data-answer-position="top-left" class="answer-btn  button_slide slide_left ">Answer 1 Answer 2 Answer 2 Answer 2  nswer 1 Answer 2 Answer 2 Answer 2
                </div>
                <div id="a2" data-answer-position="top-right" class="answer-btn  button_slide slide_left ">Answer 2 Answer 2 Answer 2
                </div>
                <div id="a3" data-answer-position="bottom-left" class="answer-btn  button_slide slide_left ">Answer
                    3</div>
                <div id="a4" data-answer-position="bottom-right" class="answer-btn  button_slide slide_left ">Answer Answer 2
                    4</div>
            </div>
        </div>
    </main>




    <aside id="bot-section">
        <a id="volume-link" href="#">
            <i id="volume" class="fas fa-volume-up fa-2x"></i>
        </a>



        <footer id="bot-footer">
            <div id="bubble">
                <div id="bubble-text-container">
                    <span id="bubble-text">Welcome!</span>
                </div>
                <img id="bubble-icon" src="/images/botaki-robot-bubble-250.png" alt="bubble text">
            </div>
            <img id="bot-avatar" src="/images/botaki-200.png" alt="User avatar">
        </footer>

    </aside>
</div>




<%--mousic--%>
<audio  loop id="background-music" controls>
    <source src="/sound/killerLooks.mp3" type="audio/mp3">
</audio>
<%--buttons--%>
<audio id="button-sound" controls>
    <source src="/sound/157538__nenadsimic__double-click.wav" type="audio/wav">
</audio>

<%--success--%>
<audio id="success-sound" controls>
    <source src="/sound/80921__justinbw__buttonchime02up.wav" type="audio/wav">
</audio>

<%--fail--%>

<audio id="fail-sound" controls>
    <source src="/sound/335906__littlerainyseasons__fail.mp3" type="audio/wav">
</audio>





<script type="application/javascript" src="/js/main-game.js">

</script>

</body>
</html>
