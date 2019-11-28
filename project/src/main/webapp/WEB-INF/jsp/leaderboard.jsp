<%@include file="authorize-admin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Leaderboard</title>

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style>
    .container{

    }

    .row{

    }

    table{
        width: 100%;
    }

    .dropdown{
        display: inline;
        float: right;
    }

    .category-title{
        display: inline;
    }

    .dropdown-item:hover{
        cursor: pointer;
    }

    .ld-cont{
        width: 100%;
        margin: 0 auto;

    }

    .table-cont{
        width: 100%;
        border-radius: 10px;
    }
</style>

</head>
<body>



<div class ="container mt-4 bg-light border shadow mb-5">

    <div class="rowtitle">

        <h2 class = "h1">Leaderboard</h2>
    </div>
    <hr>

    <div class = "ld-cont">

        <div class="col-2 p-0"></div>
            <div class="category-title col p-3 h5">

            </div>
        <div class="dropdown">
            <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Select Category
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <c:forEach items="${allCategories}" var="category">
                    <a class="dropdown-item" id="${category.getCategoryId()}">${category.getCategoryName()}</a>
                </c:forEach>
            </div>
        </div>



    <div class="col-2 p-0">



        <div class="invisible first-category">${allCategories.get(0).getCategoryId()}</div>
    </div>
    <div class="col-md-12 bg-dark text-white p-3 table-cont">

        <table class="bg-dark text-white">
            <thead>
            <tr>
                <th style="width:10%">Pos.</th>
                <th>Player</th>
                <th style="width:20%">Points</th>
            </tr>
            </thead>
            <tbody class="leaderboard" id = "rows">

            </tbody>
        </table>




    </div>
    </div>
</div>





<script src="/js/leaderboardrest.js"></script>

</body>
</html>
