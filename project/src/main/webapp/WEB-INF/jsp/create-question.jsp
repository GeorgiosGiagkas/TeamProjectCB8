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
        <title>Create new Question</title>


        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="/css/login-and-register.css">

        <!--Jquery-->
        <script
                src="https://code.jquery.com/jquery-3.4.1.min.js"
                integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
                crossorigin="anonymous"></script>
    </head>

    <body>

        <div class="container">

            <div class="d-flex justify-content-center h-100">

                <div class="card">

                    <div class="card-header">
                        <h3>Create new Category</h3>

                    </div>
                    <div class="card-body">

                        <spring:form modelAttribute="myquestion" action="create-question" method="POST">

                            <div class="form-group">

                                <spring:label path = "questionContent">Question Content</spring:label>
                                <br>
                                <spring:textarea path = "questionContent" cssclass = "form-control" placeholder = "Enter Content"/>

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


                            <div class="form-group align-items-center">
                                <input type="submit" value="Create" class="btn float-right login_btn">
                            </div>
                        </spring:form>
                    </div>

                </div>
            </div>
        </div>

    <script>
        $(document).ready(function() {

            $.ajax({
                url:"/show-categories"
            }).then(function(data){
                const selector = document.querySelector("#category-selector");
                for(let i in data){
                    const option = document.createElement("option");
                    //link.className="btn btn-warning";
                    option.innerText= data[i].categoryName;


                    selector.append(option);
                }
            });
        });
    </script>

    </body>

</html>