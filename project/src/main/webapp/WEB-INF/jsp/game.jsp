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
        <link rel="stylesheet" type="text/css" href = "/css/game.css">
        <title>Game</title>

    </head>
    <body>

        <div class="container-fluid col-md-6" id="container">


        <div class="jumbotron" id="question">
            Which of the programming languages below is NOT object oriented?
        </div>

        <div id="answers">
            <button class="col-md-12 btn btn-outline-dark btn-rounded"><span class="letters">A.</span>Java</button>
            <button class="col-md-12 btn btn-outline-dark btn-rounded"><span class="letters">B.</span>C#</button>

            <button class="col-md-12 btn btn-outline-dark btn-rounded"><span class="letters">C.</span>Python</button>
            <button class="col-md-12 btn btn-outline-dark btn-rounded"><span class="letters">D.</span>C</button>

        </div>

        <div class="text-center" id="leave">
            <button class="col-md-6 btn btn-outline-dark text-strong">Leave Round</button>
        </div>


        </div>

        <footer id="sticky-footer" class="py-4">
            <div class="container text-center">
                <small>Copyright &copy; Your Website</small>
            </div>
        </footer>

    </body>
</html>
