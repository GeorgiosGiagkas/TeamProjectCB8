<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Page</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="/css/login.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>

<body>

<section id="LoginContent">
    <div class="questionMarks">
        <video loop muted autoplay poster="/images/QuestionMarksBlue.jpg" class="questionMarks_video">
            <source src="/video/QuestionmarkBlue_video.wmv" type="video/wmv">
            <source src="/video/QuestionmarkBlue_video.mp4" type="video/mp4">
        </video>
    </div>
    <form  id="loginForm" action="loginUser" method="post" enctype="application/x-www-form-urlencoded">
        <div class="login">
            <%--<div class="QuizbotHeader">--%>
            <%--<h2></h2>--%>
            <%--<h3></h3>--%>
            <%--<p></p>--%>
            <%--</div>--%>
            <%--<div class="login_title">--%>
            <%--<span></span>--%>
            <%--</div>--%>
            <div class="login_fields">
                <%--<div class="login_fields__user">--%>
                <%--<div class="icon">--%>
                <%--&lt;%&ndash;<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/user_icon_copy.png">&ndash;%&gt;--%>
                <%--</div>--%>

                <%--<div class="validation">--%>
                <%--<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/tick.png">--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="login_fields__password">--%>
                <%--<div class="icon">--%>
                <%--&lt;%&ndash;<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/lock_icon_copy.png">&ndash;%&gt;--%>
                <%--</div>--%>

                <%--<div class="validation">--%>
                <%--<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/tick.png">--%>
                <%--</div>--%>
                <%--</div>--%>
                <div class="login_fields__submit">
                    <%--<input type="submit" value="" id="loginButton">--%>
                    <div class="signUp">
                        <a href="<c:url value="/login"/>" id="redirect"></a>
                    </div>
                </div>
            </div>

            <div class="feedback success">
                <h2>Registration successfully completed</h2>
                <p>You may now Login...</p>
            </div>

        </div>
    </form>
    <div class="authent">
        <img src="https://image.ibb.co/mco6FL/logo-mini.png" class='authentLogo'>
        <img src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/puff.svg'>
        <p>Registering...</p>
    </div>

</section>

<script src="js/loginAuth.js"></script>

</body>

</html>
