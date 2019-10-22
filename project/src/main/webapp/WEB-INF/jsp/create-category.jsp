<%--
  Created by IntelliJ IDEA.
  User: Workstation
  Date: 19/10/2019
  Time: 1:48 μμ
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<html>

    <head>
        <title>Create new Category</title>


        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="/css/login-and-register.css">
    </head>

    <body>

        <div class="container">

            <div class="d-flex justify-content-center h-100">

                <div class="card">

                    <div class="card-header">
                        <h3>Create new Category</h3>

                    </div>
                    <div class="card-body">

                        <spring:form modelAttribute="mycategory" action="create-category" method="POST" enctype = "multipart/form-data">

                            <div class="form-group">

                                <spring:label path = "categoryName">Category Name</spring:label>
                                <br>
                                <spring:input path = "categoryName" cssclass = "form-control" placeholder = "Enter Name"/>

                            </div>

                            <div class="form-group">

                                <label for="category-image">Category Image</label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="category-image" name = "category-image"
                                           aria-describedby="inputGroupFileAddon01">
                                    <label class="custom-file-label" for="category-image">Choose file</label>
                                </div>
                            </div>


                            <div class="form-group align-items-center">
                                <input type="submit" value="Create" class="btn float-right login_btn">
                            </div>
                        </spring:form>
                    </div>

                </div>
            </div>
        </div>

    </body>

</html>