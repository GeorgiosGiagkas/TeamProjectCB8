<%--
  Created by IntelliJ IDEA.
  User: mousa
  Date: 31-Oct-19
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Avatars</title>

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
    <link rel="stylesheet" type="text/css" href="/css/avatars.css">
</head>
<body>
    <div class = container>
        <p class = "h3">Avatars</p>
        <br>
        <br>
        <div id = "avatar-container" class = "container" ></div>
    </div>



    </div>

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

    <script>
        $(document).ready(function(){
            $.ajax({
                url:"/get-all-avatars",
                async: false
            }).then(function(data){
                $("#avatar-container").html("");
                const importDiv = `<div class = "avatar" id = "import-new" data-toggle="modal">
                                            <i class="fas fa-plus"></i>
                                        </div>`;
                for(let avatar in data){
                    const avatarDiv = `<div class = "avatar">
                                            <img src = "/images/quizbot-logo(200x50).png" class = "avatar-img">
                                        </div>`;


                    $("#avatar-container").append(avatarDiv);

                }
                $("#avatar-container").append(importDiv);

            });
            $("#import-new").click(function(){
                $("#modalCreateAvatar").modal("show");
            });

        });
    </script>

</body>
</html>
