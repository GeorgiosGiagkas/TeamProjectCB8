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
            <div style="margin:auto;" id="countdown"></div>

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

                //set timer state
                let stopTimer = false;
                let timeleft =20;

                //set points modifier
                let pointsModifier = 0;

                //NEXT QUESTION
                $("#start").click(restShowQuestion);

                function restShowQuestion(){
                    pointsModifier=generatePoints();
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

                        //TIMER
                        stopTimer=false;
                            let  time = setInterval(function(){
                                document.getElementById("countdown").innerHTML = timeleft + " seconds remaining";
                                timeleft -= 1;
                                if(stopTimer){
                                    clearInterval(time);
                                    document.getElementById("countdown").innerHTML = "Finished";

                                }
                                if(timeleft<=0){
                                    clearInterval(time);
                                    document.getElementById("countdown").innerHTML = "Finished";
                                    timeleft=20;
                                    disableAnswerButtons();
                                    restGetCorrectAnswer(0,0,0);

                                }
                            }, 1000);

                    });

                }

                //Get Correct Answer
                document.addEventListener("click",getCorrectAnswer);

                function getCorrectAnswer(e){

                    if(e.target.hasAttribute("data-answer-id")){

                        //stop timer
                        stopTimer=true;
                        let timeBonus = timeleft;
                        let points = pointsModifier;
                        timeleft=20;

                        const answerId=e.target.getAttribute("data-answer-id");
                        disableAnswerButtons();
                        restGetCorrectAnswer(answerId,timeBonus,points);
                    }
                }

                function restGetCorrectAnswer(answerId,timeBonus,points){
                    $.ajax({
                        url:"/answer-verification?answer-id="+answerId+"&timer="+timeBonus+"&points="+points
                    }).then(function(data){
                        console.log(data);
                        console.log(data.correctAnswer);
                        highlightCorrectAnswer(data.correctAnswer);
                        setTimeout(restShowQuestion,3000);

                    });
                }


                function disableAnswerButtons(){
                    const buttons = document.querySelectorAll("[data-answer-id]");
                    buttons.forEach(function(b){
                        b.disabled=true;
                    });
                }



                function highlightCorrectAnswer(answerId){
                    const buttons = document.querySelectorAll("[data-answer-id]");
                    buttons.forEach(function(b){
                        if(b.getAttribute("data-answer-id")==answerId){
                            b.className+=" bg-success";
                        }
                    })
                }


                //generate random points//wheel or other visualization
                function generatePoints(){
                    const arrayPoints = [1,2,3,4,5];
                    randomPoints = Math.floor(1+Math.random()*(arrayPoints.length));
                    console.log(randomPoints);
                    return randomPoints;
                }

            });
        </script>


    </body>
</html>
