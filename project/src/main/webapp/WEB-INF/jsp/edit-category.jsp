<%--
  Created by IntelliJ IDEA.
  User: mousa
  Date: 24-Oct-19
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Categories</title>

    <!--Bootsrap 4 CDN-->


    <!--Jquery-->
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!--Custom styles-->
    <%--<link rel="stylesheet" type="text/css" href="/css/categories.css">--%>
    <link rel="stylesheet" type="text/css" href="/css/menu.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>

<body class="menu menu-open">
<header>
    <a href="#" class="menu-toggle"><i class="material-icons">menu</i></a>
    <nav class="menu-side">
        <ul>
            <li id = "home">Home</li>
            <li id = "edit-question">Questions</li>
            <li id = "edit-category">Categories</li>
            <li id = "edit-avatars">Avatars</li>

        </ul>
    </nav>
</header>
<div id="content">
    <div class = "container mt-4 bg-light border shadow mb-5">
        <p class = "h1">Categories</p>
        <table class = "table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Category Name</th>
                <th> </th>
                <th> </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allcategories}" var="category">
                <tr>
                    <td>
                        <c:out value="${category.categoryId}" />
                    </td>
                    <td>
                        <c:out value="${category.categoryName}" />
                    </td>
                    <td>
                        <button class = "btn-edit btn-warning btn" type = "button" data-categoryId = "${category.categoryId}" data-toggle="modal">Edit</button>
                    </td>
                    <td>
                        <button class = "btn-delete btn-danger btn" type = "button" data-categoryId = "${category.categoryId}" data-toggle="modal">Delete</button>
                    </td>
                </tr>
            </c:forEach>

            <tr id = "btn-create-category" data-toggle="modal">
                <td>
                    <i class="fas fa-plus"></i>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            </tbody>
        </table>

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

                        <div class = "form-group">
                            <label for = "label">Active</label>
                            <br>
                            <label class="switch" id = "label">
                                <input type="checkbox" name = "active" id = "active">
                                <span class="slider round"></span>
                            </label>
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

    <div id = "modalEditCategory" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="edit-category" method="POST" enctype = "multipart/form-data">
                    <div class="modal-body">

                        <div class = "form-group">
                            <input type = "hidden" id = "categoryId-edit" name = "categoryId" class = "form-control" />
                        </div>
                        <div class="form-group">

                            <label for = "categoryName">Category Name</label>
                            <br>
                            <input type = "text" id = "categoryName-edit" name = "categoryName" class="form-control"  placeholder = "Enter Name"/>

                        </div>

                        <div class="form-group">
                            <label for="category-image">Category Image</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="category-image-edit" name = "category-image"
                                       aria-describedby="inputGroupFileAddon01">
                                <label class="custom-file-label" for="category-image">Choose file</label>
                            </div>
                        </div>

                        <div class = "form-group">
                            <label for = "label">Active</label>
                            <br>
                            <label class="switch" id = "label-edit">
                                <input type="checkbox" name = "active" id = "active-edit">
                                <span class="slider round"></span>
                            </label>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-warning">Update</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div id = "modalDeleteCategory" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Delete Category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action = "delete-category" method = "POST">
                    <div class="modal-body">

                        <input type = "hidden" id = "categoryId-delete" name = "categoryId">

                        <p>Are you sure you want to delete category <span id = "category-name-delete"></span> ? </p>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">Delete</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){

        $("#btn-create-category").click(function(){
            $("#modalCreateCategory").modal("show");
        });

        $(".btn-edit").click(function(){
            let categoryId = $(this).attr("data-categoryId");
            $.ajax({
                url:"/get-category-by-id/" + categoryId,
                async: false
            }).then(function(data){
                $("#categoryId-edit").val(data.categoryId);
                $("#categoryName-edit").val(data.categoryName);
                if(data.categoryActive === true){
                    $("#active-edit").prop("checked", true);
                }
                else{
                    $("#active-edit").prop("checked", false);
                }

            });
            $("#modalEditCategory").modal("show");
        });

        $(".btn-delete").click(function(){
            let categoryId = $(this).attr("data-categoryId");
            $.ajax({
                url:"/get-category-by-id/" + categoryId,
                async: false
            }).then(function(data){
                $("#categoryId-delete").val(data.categoryId);
                $("#category-name-delete").html("");
                $("#category-name-delete").append(data.categoryName);


            });
            $("#modalDeleteCategory").modal("show");
        });

        $("#home").click(function(){
            location.href = "/admin-menu" ;
        });

        $("#edit-category").click(function () {
            location.href = "/show-all-categories";
        });

        $("#edit-question").click(function () {
            location.href = "/show-all-questions";
        });

        $("#edit-avatars").click(function() {
            location.href = "/show-all-avatars";
        });


        $('.menu-toggle').on('click', function() {
            $('body').toggleClass('menu-open');
        });

    });
</script>

</body>
<%--<body>--%>
    <%----%>

    <%----%>

<%--</body>--%>
</html>
