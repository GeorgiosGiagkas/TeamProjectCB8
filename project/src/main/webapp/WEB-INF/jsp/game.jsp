<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: giagkas
  Date: 16/10/19
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script
                src="https://code.jquery.com/jquery-3.4.1.min.js"
                integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
                crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href = "/css/game.css">
        <title>Game</title>

    </head>
    <body>

        <div class="container-fluid col-md-6" id="container">


        <div class="jumbotron" id="question">

        </div>

        <div id="answers">

        </div>

        <div class="text-center" id="leave">
            <button class="col-md-6 btn btn-outline-dark text-strong">Leave Round</button>
        </div>

            <div class="text-center" id="start">
                <button class="col-md-6 btn btn-outline-dark text-strong">Start</button>
            </div>

        </div>




        <script type="application/javascript">
            $(document).ready(function(){


                //NEXT QUESTION
                $("#start").click(restShowQuestion);

                function restShowQuestion(){
                    $.ajax({
                        url:"/get-next-question"
                    }).then(function(data){

                        if(data.questionId===0){
                            return;
                        }

                        $("#answers").html("");
                        $("#question").text(data.questionContent);
                        $("#question").attr("question-id",data.questionId);
                       for(let a in data.answersDto){
                           const btn = document.createElement("button");
                           btn.className="btn btn-outline-dark btn-rounded";
                           btn.setAttribute("data-answer-id",data.answersDto[a].answerId);
                           const span = document.createElement("span");
                           span.className="letters";
                           span.innerText=data.answersDto[a].answerContent;
                           btn.appendChild(span);
                           $("#answers").append(btn);
                        }


                    });
                }


                //Get Correct Answer
                document.addEventListener("click",restGetCorrectAnswer);

                function restGetCorrectAnswer(e){

                    if(e.target.hasAttribute("data-answer-id")){

                        const id=e.target.getAttribute("data-answer-id");
                        $.ajax({
                            url:"/answer-verification?question-id="+$("#question").attr("question-id")+"&answer-id="+id
                        }).then(function(data){

                            highlightCorrectAnswer(data);
                            setTimeout(restShowQuestion,2000);

                        });

                    }

                }

                function highlightCorrectAnswer(answerId){
                    const buttons = document.querySelectorAll("[data-answer-id]");
                    buttons.forEach(function(b){
                        b.disabled=true;
                        if(b.getAttribute("data-answer-id")==answerId){
                            b.className+=" bg-success";
                        }
                    })

                }



            });
        </script>


    </body>
</html>
