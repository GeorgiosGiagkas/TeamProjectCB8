<%--
  Created by IntelliJ IDEA.
  User: Workstation
  Date: 19/10/2019
  Time: 1:18 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <!--Custom styles-->
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
                        <button class="btn-warning btn">Create new Question</button>
                        <button id = "btn-create-category" class="btn-warning btn">Create new Category</button>
                        <button class="btn-warning btn">Edit existing Question</button>
                        <button class="btn-warning btn">Edit existing Category</button>
                        <button class="btn-warning btn">Show e-Shop Stats</button>
                        <button class="btn-warning btn">Show Leaderboard</button>
                        <button class="btn-warning btn">Show Stats of all Players</button>
                        <button class="btn-warning btn">Sign out</button>
                    </div>

                </div>
            </div>
        </div>

    <script>
        $(document).ready(function(){
            $("#btn-create-category").click(function(){
               window.location = "/show-create-category";
            });
        });
    </script>
    </body>
</html>
