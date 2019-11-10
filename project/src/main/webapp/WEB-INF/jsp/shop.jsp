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
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

</head>
<body>


    <div class="invisible" current-user-id="${currentUserId}" avatarCount="${avatarCount}"current-avatar-page="1"></div>
    </div>

<div class ="container mt-4 bg-light border shadow mb-5">

    <div class="row">

        <h1>QuizBot Shop LOGO</h1>
    </div>
    <hr>
    <div class="row carousel">

    


    <div id="tempImage"></div>

    <div class="w3-content w3-display-container">

        <table class="table table-borderless mySlides" style="width:100%">
            <tr>
                <td><img src="/images/1.jpg"></td>
                <td><img src="/images/2.jpg"></td>
                <td><img src="/images/3.jpg"></td>
                <td><img src="/images/4.jpg"></td>
                <td><img src="/images/5.jpg"></td>    
            </tr>         
        </table>

        <table class="table table-borderless mySlides" style="width:100%">
            <tr>
                <td><img src="/images/6.jpg"></td>
                <td><img src="/images/7.jpg"></td>
                <td><img src="/images/8.jpg"></td>
                <td><img src="/images/9.jpg"></td>
                <td><img src="/images/10.jpg"></td>    
            </tr>         
        </table>

        <table class="table table-borderless mySlides" style="width:100%">
            <tr>
                <td><img src="/images/11.jpg"></td>
                <td><img src="/images/12.jpg"></td>
                <td><img src="/images/13.jpg"></td>
                <td><img src="/images/14.jpg"></td>
                <td><img src="/images/15.jpg"></td>    
            </tr>         
        </table>

        <button class="w3-button w3-black w3-display-left">&#10094;</button>
        <button class="w3-button w3-black w3-display-right">&#10095;</button>
    </div>

</div>
<!-- end of carusel row -->




<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="/js/shop.js"></script>


</div>
</body>
</html>
