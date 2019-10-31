<%--
  Created by IntelliJ IDEA.
  User: Workstation
  Date: 19/10/2019
  Time: 1:18 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<html>
    <head>
        <title>Admin Menu</title>


        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

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
        <link rel="stylesheet" type="text/css" href="/css/categories.css">
        <link rel="stylesheet" type="text/css" href="/css/menu.css">

    </head>

    <body>
        <div class="container">

            <div class="d-flex justify-content-center h-100">

                <div class="card col-md-8">

                    <div class="card-header">
                        <h3>Admin menu</h3>

                    </div>
                    <div class="card-body">
                        <button id = "btn-edit-question" class="btn-warning btn">Questions</button>
                        <button id = "btn-edit-category" class="btn-warning btn">Categories</button>
                        <button id = "btn-edit-avatars" class="btn-warning btn">Avatars</button>
                        <button class="btn-warning btn">e-Shop Stats</button>
                        <button id = "btn-show-leaderboard" class="btn-warning btn">Leaderboard</button>
                        <button class="btn-warning btn">Stats of all Players</button>
                        <button class="btn-warning btn">Sign out</button>
                    </div>
                </div>
            </div>
        </div>







    <script>
        $(document).ready(function(){



            $("#btn-edit-category").click(function () {
                location.href = "/show-all-categories";
            });

            $("#btn-edit-question").click(function () {
                location.href = "/show-all-questions";
            });

            $("#btn-edit-avatars").click(function() {
                location.href = "/show-all-avatars";
            });

            $("#btn-show-leaderboard").click(function(){
               location.href = "/show-leaderboard";
            });
        });


    </script>
    </body>
</html>
