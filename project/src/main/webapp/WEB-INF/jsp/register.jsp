<%--
  Created by IntelliJ IDEA.
  User: mousa
  Date: 16-Oct-19
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<html>
    <head>
        <title>Register Page</title>


        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="/css/login-and-register.css">
        <script
                src="https://code.jquery.com/jquery-3.4.1.min.js"
                integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
                crossorigin="anonymous"></script>
    </head>

    <body>
        <div class="container">

            <div class="d-flex justify-content-center h-100">

                <div class="card">

                    <div class="card-header">
                        <h3>Sign up</h3>

                    </div>
                    <div class="card-body">
                            <spring:form modelAttribute="user" id="registrationForm" action="registerUser" method="post">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                                </div>
                                    <spring:input path="userNickname" cssclass="form-control" placeholder="nickname"/>
                                    <spring:errors path="userNickname" cssClass="error"/>
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                                </div>
                                <spring:input path="userEmail" cssclass="form-control" placeholder="email"/>
                                <spring:errors path="userEmail" cssClass="error"/>
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <spring:password id="userPassword" path="userPassword" cssclass="form-control" placeholder="password"/>
                                <spring:errors path="userPassword" cssClass="error"/>
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-repeat"></i></span>
                                </div>
                                <spring:password path="retypePassword" cssclass="form-control" placeholder="confirm password"/>
                                <spring:errors path="retypePassword" cssClass="error"/>
                            </div>
                            <div class="form-group align-items-center">
                                <input type="submit" value="Create my account" class="btn float-right login_btn">
                            </div>
                            </spring:form>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            Already registered?<a href="login.html">Sign In</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.19.1/jquery.validate.min.js"></script>
        <script src="js/validation.js"></script>

    </body>
</html>
