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
                        <button id = "btn-create-question" class="btn-warning btn" data-toggle="modal" data-target="#modalCreateQuestion">Create new Question</button>
                        <button id = "btn-create-category" class="btn-warning btn" data-toggle="modal" data-target="#modalCreateCategory">Create new Category</button>
                        <button id = "btn-edit-question" class="btn-warning btn">Edit existing Question</button>
                        <button id = "btn-edit-category" class="btn-warning btn">Edit existing Category</button>
                        <button class="btn-warning btn">Show e-Shop Stats</button>
                        <button class="btn-warning btn">Show Leaderboard</button>
                        <button class="btn-warning btn">Show Stats of all Players</button>
                        <button class="btn-warning btn">Sign out</button>
                    </div>
                </div>
            </div>
        </div>

        <div id = "modalCreateCategory" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Create Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="create-category" method="POST" enctype = "multipart/form-data">
                        <div class="modal-body">


                            <div class="form-group">

                                <label for = "categoryName">Category Name</label>
                                <br>
                                <input type = "text" id = "categoryName" name = "categoryName" class="form-control"  placeholder = "Enter Name"/>

                            </div>

                            <div class="form-group">
                                <label for="category-image">Category Image</label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="category-image" name = "category-image"
                                           aria-describedby="inputGroupFileAddon01">
                                    <label class="custom-file-label" for="category-image">Choose file</label>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-warning">Create</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id = "modalCreateQuestion" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Create Question</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="create-question" method="POST">
                        <div class="modal-body">


                            <div class="form-group">

                                <label for = "questionContent">Question Content</label>
                                <br>
                                <textarea id = "questionContent" name = "questionContent" class = "form-control" placeholder = "Enter Content"></textarea>

                            </div>

                            <div class="form-group">

                                <label for = "category-selector">Category</label>
                                <br>
                                <select id = "category-selector" name = "categoryName">

                                </select>

                            </div>

                            <div class="form-group">
                                <label for = "answer1">Answer No1</label>
                                <br>
                                <input id = "answer1" name = "answer" type = "text" class = "form-control" placeholder="Enter Answer">
                            </div>

                            <div class="form-group">
                                <label for = "answer2">Answer No2</label>
                                <br>
                                <input id = "answer2" name = "answer" type = "text" class = "form-control" placeholder="Enter Answer">
                            </div>

                            <div class="form-group">
                                <label for = "answer3">Answer No3</label>
                                <br>
                                <input id = "answer3" name = "answer" type = "text" class = "form-control" placeholder="Enter Answer">
                            </div>

                            <div class="form-group">
                                <label for = "answer4">Answer No4</label>
                                <br>
                                <input id = "answer4" name = "answer" type = "text" class = "form-control" placeholder="Enter Answer">
                            </div>

                            <div class="form-group">

                                <label for = "correct-answer-selector">Correct Answer</label>
                                <br>
                                <select id = "correct-answer-selector" name = "correct">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-warning">Create</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>



    <script>
        $(document).ready(function(){

            $("#btn-create-question").click(function(){
                $.ajax({
                    url:"/get-all-categories"
                }).then(function(data){
                    const selector = document.querySelector("#category-selector");
                    selector.innerHTML = "";
                    for(let i in data){
                        const option = document.createElement("option");

                        option.innerText= data[i].categoryName;


                        selector.append(option);
                    }
                });
             });

            $("#btn-edit-category").click(function () {
                location.href = "/show-all-categories";
            });

            $("#btn-edit-question").click(function () {
                location.href = "/show-all-questions";
            });
        });


    </script>
    </body>
</html>
