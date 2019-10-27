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
    <title>Edit existing Categories</title>

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Jquery-->
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!--Custom styles-->

</head>
<body>

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

        </tbody>
    </table>

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
                            <input type = "hidden" id = "categoryId" name = "categoryId" class = "form-control" />
                        </div>
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

    <script>
        $(document).ready(function(){

            $(".btn-edit").click(function(){
                let categoryId = $(this).attr("data-categoryId");
                $.ajax({
                    url:"/get-category-by-id/" + categoryId,
                    async: false
                }).then(function(data){
                    $("#categoryId").val(data.categoryId);
                    $("#categoryName").val(data.categoryName);

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

        });
    </script>

</body>
</html>
