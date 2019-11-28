<%@include file="login-access-control.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<html>
<head>
    <title>QuizBot</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
    <%--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="/css/login.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>--%>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.19.1/jquery.validate.min.js"></script>
</head>

<body>

<section id="LoginContent">
    <div class="questionMarks">
        <video loop muted autoplay poster="/images/QuestionMarks.jpg" class="questionMarks_video">
            <source src="/video/Questionmark_video.webm" type="video/webm">
            <source src="/video/Questionmark_video.mp4" type="video/mp4">
        </video>
    </div>
    <spring:form modelAttribute="userDto" id="loginForm" action="loginUser" method="post"
                 enctype="application/x-www-form-urlencoded">
        <div class="login">
            <div class="QuizbotHeader">
                <h2><img src="/images/quizbot-logo2-230.png"/></h2>
                <h3>${logoutMessage}</h3>
                <p>Test your knowledge!</p>
            </div>
            <div class="login_title">
                <span>Please Login Here</span>
            </div>
            <div class="login_fields">
                <div class="login_fields__user">
                    <div class="icon">
                        <i class="fas fa-user"></i>
                    </div>
                    <spring:input path="userNickname" id="userNickname" placeholder="Nickname" autocomplete="off"/>
                    <spring:errors path="userNickname" class="error"/>
                </div>
                <div class="login_fields__password">
                    <div class="icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <spring:password path="userPassword" id="userPass" placeholder="Password"/>
                    <spring:errors path="userPassword" class="error"/>
                </div>
                <div class="login_fields__submit">
                    <input type="submit" value="Log In" id="loginButton">
                    <div class="signUp">
                        <p>Don't have an account?</p>
                        <a href="/register">Sign Up</a>
                    </div>
                </div>
            </div>
        </div>
    </spring:form>
</section>

<script src="js/loginValidation.js"></script>

</body>

</html>