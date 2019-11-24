<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: giagkas
  Date: 15/10/19
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<html>
    <head>
        <title>Login Page</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="/css/login.css">
    </head>

    <body>

        <section id="LoginContent">
            <spring:form modelAttribute="userDto" id="loginForm" action="loginUser" method="post" enctype="application/x-www-form-urlencoded">
                <div class="login">
                    <div class="QuizbotHeader">
                        <h2><img src="/images/quizbot-logo2-230.png"/></h2>
                        <h3>${logoutMessage}</h3>
                        <p>Test your coding skills!</p>
                    </div>
                    <div class="login_title">
                        <span>Login Page</span>
                    </div>
                    <div class="login_fields">
                        <div class="login_fields__user">
                            <div class="icon">
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/user_icon_copy.png">
                            </div>
                            <spring:input path="userNickname" id="userNickname" placeholder="Nickname"/>
                            <spring:errors path="userNickname" class="error"/>
                            <div class="validation">
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/tick.png">
                            </div>
                        </div>
                        <div class="login_fields__password">
                             <div class="icon">
                                 <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/lock_icon_copy.png">
                              </div>
                             <spring:password  path="userPassword" id="userPass" placeholder="Password"/>
                             <spring:errors path="userPassword" class="error"/>
                             <div class="validation">
                                  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/tick.png">
                             </div>
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.19.1/jquery.validate.min.js"></script>
        <script src="js/loginValidation.js"></script>
    </body>


</html>