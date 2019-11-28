<%@include file="authorize-admin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Avatars</title>

    <link rel="stylesheet" type="text/css" href="/css/menu.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">

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
    <link rel="stylesheet" type="text/css" href="/css/avatar.css">
</head>

<body class="menu menu-open">
<header>

    <a href="#" class="menu-toggle"><i class="material-icons">menu</i></a>
    <nav class="menu-side">
        <img src="/images/quizbot-logo2-230.png" alt="Quizbot Logo"/>
        <ul>
            <li id = "home">Leaderboard</li>
            <li id = "edit-question">Questions</li>
            <li id = "edit-category">Categories</li>
            <li id = "edit-avatars" class="active">Avatars</li>
            <li id = "chat-admin">Live Support</li>
            <li id = "logout">Sign out</li>
        </ul>
    </nav>
</header>
<div id="content">
    <div class = "container mt-4 bg-light border shadow mb-5">
        <p class = "h1">Avatars</p>
        <table class = "table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Avatar Name</th>
                <th>Avatar Cost</th>
                <th> </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allavatars}" var="avatar">
                <tr>
                    <td>
                        <c:out value="${avatar.avatarId}" />
                    </td>
                    <td>
                        <c:out value="${avatar.avatarName}" />
                    </td>
                    <td>
                        <c:out value="${avatar.avatarCost}" />
                    </td>
                    <td>
                        <button class = "btn-edit btn-warning btn" type = "button" data-avatarId = "${avatar.avatarId}" data-toggle="modal">Edit</button>
                    </td>

                </tr>
            </c:forEach>

            <tr id = "btn-create-avatar" data-toggle="modal">
                <td>
                    <i class="fas fa-plus"></i>
                </td>
                <td></td>
                <td></td>
                <td></td>

            </tr>

            </tbody>
        </table>

        <div id = "modalCreateAvatar" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Import new Avatar</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="create-avatar" method="POST" enctype = "multipart/form-data">
                        <div class="modal-body">


                            <div class="form-group">

                                <label for = "avatarName">Name</label>
                                <br>
                                <input type = "text" id = "avatarName" name = "avatarName" class="form-control"  placeholder = "Enter Name"/>

                            </div>

                            <div class="form-group">

                                <label for = "avatarCost">Cost</label>
                                <br>
                                <input type = "number" id = "avatarCost" name = "avatarCost" class="form-control"  placeholder = "Enter Cost"/>

                            </div>

                            <div class="form-group">
                                <label for="avatar-image">Image</label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="avatar-image" name = "avatar-image"
                                           aria-describedby="inputGroupFileAddon01">
                                    <label class="custom-file-label" for="avatar-image">Choose file</label>
                                </div>
                            </div>



                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-warning">Import</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id = "modalEditAvatar" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Avatar</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="edit-avatar" method="POST" enctype = "multipart/form-data">
                    <div class="modal-body">

                        <input type = "hidden" id = "avatarId-edit" name = "avatarId">
                        <div class="form-group">

                            <label for = "avatarName">Name</label>
                            <br>
                            <input type = "text" id = "avatarName-edit" name = "avatarName" class="form-control"  placeholder = "Enter Name"/>

                        </div>

                        <div class="form-group">

                            <label for = "avatarCost">Cost</label>
                            <br>
                            <input type = "number" id = "avatarCost-edit" name = "avatarCost" class="form-control"  placeholder = "Enter Cost"/>

                        </div>


                        <div id = "image" style = "text-align : center"></div>


                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-warning">Update</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    $(document).ready(function(){

        $("#btn-create-avatar").click(function(){
            $("#modalCreateAvatar").modal("show");
        });

        $(".btn-edit").click(function(){
            let avatarId = $(this).attr("data-avatarId");
            $.ajax({
                url:"/get-avatar-by-id/" + avatarId,
                async: false
            }).then(function(data){
                $("#avatarId-edit").val(data.avatarId);
                $("#avatarName-edit").val(data.avatarName);
                $("#avatarCost-edit").val(data.avatarCost);



                const image = "<img src = /images/"+data.avatarId+".jpg>";

                $("#image").html(image);


            });
            $("#modalEditAvatar").modal("show");
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
            $(this).toggleClass('active');
        });
        $("#chat-admin").click(function() {
            location.href = "/admin-chat";
        });
        $("#logout").click(function() {
            location.href = "/logout";
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
