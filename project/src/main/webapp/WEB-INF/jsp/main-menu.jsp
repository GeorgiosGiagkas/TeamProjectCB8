<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Main Menu</title>


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
                        <h3>Main menu</h3>

                    </div>
                    <div class="card-body">
                        <button id="btn-start-game" class = "btn-warning btn">Start Game</button>
                        <button class = "btn-warning btn">Leaderboard</button>
                        <button class = "btn-warning btn">Show Stats</button>
                        <button class = "btn-warning btn" onclick="window.location.href='/show-shop'">Shop</button>
                        <button class = "btn-warning btn">Live Support</button>
                        <a href="/logout" class = "btn-warning btn">Sign out</a>

                    </div>

                </div>
            </div>
        </div>


    <script type="application/javascript">
        $(document).ready(function(){

            $("#btn-start-game").click(restShowCategories);

            function restShowCategories(){
                $.ajax({
                    url:"/show-categories"
                }).then(function(data){
                    $(".card-body").html("");
                    for(let i in data){
                        const link = document.createElement("a");
                        link.className="btn btn-warning";
                        link.innerText=data[i].categoryName;
                        link.href="/start-game?category-id="+data[i].categoryId;

                        $(".card-body").append(link);
                    }
                });
            }




        });
    </script>
    </body>
</html>
