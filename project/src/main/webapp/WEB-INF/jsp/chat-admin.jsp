<%@include file="authorize-admin.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <!--Jquery-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="/css/admin-chat.css">
</head>

<body class="menu menu-open">
<header>
    <i class="material-icons">menu</i>
    <nav class="menu-side">
        <img src="/images/quizbot-logo2-230.png" alt="Quizbot Logo"/>
        <ul>
            <li id = "home">Leaderboard</li>
            <li id = "edit-question">Questions</li>
            <li id = "edit-category">Categories</li>
            <li id = "edit-avatars">Avatars</li>
            <li id = "chat-admin" class="activeChat">Live Support</li>
            <li id = "logout">Sign out</li>
        </ul>
    </nav>
</header>
<div id="content">
    <div class="container mt-4 bg-light border shadow mb-5">
        <div class="messaging">
            <div class="inbox_msg">

                <div class="inbox_players">
                    <div class="inbox_heading">
                        <div class="heading_title">
                            <h4>Players</h4>
                        </div>
                        <div class="heading_search">
                            <input type="text" id="search-bar" placeholder="Search">
                            <span class="input-group-addon">
                             <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                         </span>
                        </div>
                    </div>
                    <%--users--%>
                    <div class="inbox_chat"></div>
                </div>

                <div class="messages">
                    <div>
                        <input id="adminNickname" type="text" hidden id="from" value=
                                <c:out value="${adminNickname}" /> />
                        <input id="adminAvatarId" type="text" hidden value=
                                <c:out value="${adminAvatarId}" /> />
                        <div id="sound" hidden></div>
                    </div>

                    <div class="message-header">
                        <div class="chat-header">Quizbot Chat</div>
                        <button id="disconnect" type="button" class="btn" data-toggle="tooltip" title="Disconnect"
                                onclick="disconnect();"><i class="fas fa-sign-out-alt"></i></button>
                        <button id="connect" type="button" class="btn" data-toggle="tooltip" title="Connect"
                                onclick="connect();"><i class="fas fa-sign-in-alt"></i></button>
                    </div>


                    <div id="messageboard">
                        <ul class="nav nav-tabs" id="myTab" role="tablist"></ul>
                        <div class="tab-content" id="myTabContent"></div>
                    </div>


                    <div class="type_msg">
                        <div class="input_msg_write">
                            <textarea class="write_msg" placeholder="Type a message"
                                      onfocus="clearContents(this);"></textarea>
                            <button id="sendMessageBtn" class="btn" type="button"><i class="fas fa-paper-plane"></i>
                            </button>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>

    $(document).ready(function () {
        $("#home").click(function(){
            location.href = "/admin-menu" ;
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
            $(this).toggleClass('activeChat');
        });
        $("#logout").click(function() {
            location.href = "/logout";
        });

        $('.material-icons').on('click', function () {
            $('body').toggleClass('menu-open');
        });
    });

</script>
<script src="/js/admin-chat.js"></script>


</body>
</html>