<%@include file="authorize-admin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<html>
    <head>
        <title>Home</title>

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Jquery-->
        <script
                src="https://code.jquery.com/jquery-3.4.1.min.js"
                integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
                crossorigin="anonymous"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="/css/menu.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
              rel="stylesheet">
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    </head>

    <body class="menu menu-open">

        <header>
            <a href="#" class="menu-toggle"><i class="material-icons">menu</i></a>
            <nav class="menu-side">
                <img src="/images/quizbot-logo2-230.png" alt="Quizbot Logo"/>
                <ul>
                    <li id = "home" class="active">Leaderboard</li>
                    <li id = "edit-question">Questions</li>
                    <li id = "edit-category">Categories</li>
                    <li id = "edit-avatars">Avatars</li>
                    <li id = "chat-admin">Live Support</li>
                    <li id = "logout">Sign out</li>
                </ul>
            </nav>
        </header>
        <div id="content">
            <jsp:include page="leaderboard.jsp" />
        </div>

        <script>
            $(document).ready(function(){
                $("#home").click(function(){
                   location.href = "/admin-menu" ;
                    $(this).toggleClass('active');
                });

                $("#edit-category").click(function () {
                    location.href = "/show-all-categories";
                });

                $("#edit-question").click(function () {
                    location.href = "/show-all-questions";
                });

                $("#edit-avatars").click(function() {
                    location.href = "/show-all-avatars";
                });
                $("#chat-admin").click(function() {
                    location.href = "/admin-chat";
                });
                $("#logout").click(function() {
                    location.href = "/logout";
                });
                $('.menu-toggle').on('click', function() {
                    $('body').toggleClass('menu-open');
                });
            });
        </script>

    </body>

</html>
