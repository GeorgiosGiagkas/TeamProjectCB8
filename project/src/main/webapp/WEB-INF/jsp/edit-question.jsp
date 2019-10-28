<%--
  Created by IntelliJ IDEA.
  User: mousa
  Date: 24-Oct-19
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Edit existing Question</title>

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
            <th>Question Content</th>
            <th>Category</th>
            <th> </th>
            <th> </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${allquestions}" var="question">
            <tr>
                <td>
                    <c:out value="${question.questionId}" />
                </td>
                <td>
                    <c:out value="${question.questionContent}" />
                </td>
                <td>
                    <c:out value="${question.categoryId.categoryName}" />
                </td>
                <td>
                    <button class = "btn-edit btn-warning btn" type = "button" data-questionId = "${question.questionId}" data-toggle="modal">Edit</button>
                </td>
                <td>
                    <button class = "btn-delete btn-danger btn" type = "button" data-questionId = "${question.questionId}" data-toggle="modal">Delete</button>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

    <div id = "modalEditQuestion" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Question</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="edit-question" method="POST">
                    <div class="modal-body">

                        <input type = "hidden" id = "questionId" name = "questionId" />

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
                            <input type = "hidden" name = "answerId" id = "answerId1">
                            <label for = "answer1">Answer No1</label>
                            <br>
                            <input id = "answer1" name = "answer" type = "text" class = "form-control" placeholder="Enter Answer">
                        </div>

                        <div class="form-group">
                            <input type = "hidden" name = "answerId" id = "answerId2">
                            <label for = "answer2">Answer No2</label>
                            <br>
                            <input id = "answer2" name = "answer" type = "text" class = "form-control" placeholder="Enter Answer">
                        </div>

                        <div class="form-group">
                            <input type = "hidden" name = "answerId" id = "answerId3">
                            <label for = "answer3">Answer No3</label>
                            <br>
                            <input id = "answer3" name = "answer" type = "text" class = "form-control" placeholder="Enter Answer">
                        </div>

                        <div class="form-group">
                            <input type = "hidden" name = "answerId" id = "answerId4">
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
                        <button type="submit" class="btn btn-warning">Update</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div id = "modalDeleteQuestion" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Delete Question</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action = "delete-question" method = "POST">
                    <div class="modal-body">

                        <input type = "hidden" id = "questionId-delete" name = "questionId">

                        <p>Are you sure you want to delete question with ID <span id = "question-name-delete"></span> ? </p>
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
                let id = $(this).attr("data-questionId");
                $("#questionId").val(id);
                $.ajax({
                    url:"/get-all-categories",
                    async: false
                }).then(function(data1){

                    $.ajax({
                        url: "/get-question-by-id/" + id,
                        async: false
                    }).then(function(data2){
                        const selector = document.querySelector("#category-selector");
                        selector.innerHTML = "";
                        for(let i in data1){

                            const option = document.createElement("option");

                            option.innerText = data1[i].categoryName;





                            if(data1[i].categoryName === data2.categoryName) {
                                option.setAttribute("selected", "true");
                            }

                            selector.append(option);
                        }
                        const correctSelector = document.querySelector("#correct-answer-selector");
                        correctSelector.innerHTML = "";
                        for(let i = 0; i < data2.answersDto.length; i++){

                            k = i + 1;
                            const optionCor = document.createElement("option");
                            optionCor.innerHTML = k;
                            correctSelector.append(optionCor);
                            if(data2.answersDto[i].answerCorrect === true){
                                optionCor.setAttribute("selected", "true");
                            }
                            let content = data2.answersDto[i].answerContent;
                            let answerid = data2.answersDto[i].answerId;
                            $("#answer" + k).val(content);
                            $("#answerId" + k).val(answerid);

                        }

                        $("#questionContent").html("");
                        $("#questionContent").append(data2.questionContent)


                    });

                });
                $("#modalEditQuestion").modal("show");
            });


            $(".btn-delete").click(function(){
                let questionId = $(this).attr("data-questionId");
                $.ajax({
                    url:"/get-question-by-id/" + questionId,
                    async: false
                }).then(function(data){
                    $("#questionId-delete").val(data.questionId);
                    $("#question-name-delete").html("");
                    $("#question-name-delete").append(data.questionId);


                });
                $("#modalDeleteQuestion").modal("show");
            });
        });


    </script>

</body>
</html>
