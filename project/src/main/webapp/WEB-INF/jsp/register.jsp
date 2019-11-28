<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<html>
<head>
    <title>QuizBot</title>

    <!--Bootsrap 4 CDN-->
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"--%>
    <%--integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">--%>

    <!--Fontawesome CDN-->
    <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"--%>
    <%--integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">--%>

    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
    <%--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="/css/login.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>--%>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.19.1/jquery.validate.min.js"></script>
    <!--Custom styles-->
    <%--<link rel="stylesheet" type="text/css" href="/css/login-and-register.css">--%>
</head>

<body>
<section id="LoginContent">
    <div class="questionMarks">
        <video loop muted autoplay poster="/images/QuestionMarksBlue.jpg" class="questionMarks_video">
            <source src="/video/QuestionmarkBlue_video.wmv" type="video/wmv">
            <source src="/video/QuestionmarkBlue_video.mp4" type="video/mp4">
        </video>
    </div>
    <spring:form modelAttribute="user" id="registrationForm" action="registerUser" method="post">
        <div class="login">
            <div class="QuizbotHeader">
                <h2><img src="/images/quizbot-logo2-230.png"/></h2>
                <p>Test your knowledge!</p>
            </div>
            <div class="login_title">
                <span>Please Register Here</span>
            </div>
            <div class="login_fields">
                <div class="login_fields__user">
                    <div class="icon">
                        <i class="fas fa-user"></i>
                    </div>
                    <spring:input path="userNickname" cssclass="form-control" placeholder="nickname"/>
                    <spring:errors path="userNickname" cssClass="error"/>
                </div>
                <div class="login_fields__password">
                    <div class="icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <spring:input path="userEmail" cssclass="form-control" placeholder="email"/>
                    <spring:errors path="userEmail" cssClass="error"/>
                </div>
                <div class="login_fields__password">
                    <div class="icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <spring:password id="userPassword" path="userPassword" cssclass="form-control" placeholder="password"/>
                    <spring:errors path="userPassword" cssClass="error"/>
                </div>
                <div class="login_fields__password">
                    <div class="icon">
                        <i class="fas fa-check-square"></i>
                    </div>
                    <spring:password path="retypePassword" cssclass="form-control" placeholder="confirm password"/>
                    <spring:errors path="retypePassword" cssClass="error"/>
                </div>
                <div class="login_fields__submit">
                    <input type="submit" value="Create my account" id="loginButton">
                    <div class="signUp">
                        <p>Already registered?</p>
                        <a href="/login">Sign In</a>
                    </div>
                </div>
            </div>
        </div>
    </spring:form>
</section>

<script src="js/registerValidation.js"></script>

<script>
    const video = document.querySelector(".questionMarks_video");
    video.playbackRate = 0.7;
</script>

</body>

</html>
