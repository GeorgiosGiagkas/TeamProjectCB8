<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Anton|Passion+One|PT+Sans+Caption" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" href="css/errorPage.css">

    <title>500</title>
</head>

<body>
<div class="error">
    <div class="container-fluid">
        <div class="col-xs-12 ground-color text-center">
            <div class="msg">OH!<span class="triangle"></span></div>
            <div class="container-error-404">
                <div class="clip">
                    <div class="shadow"><span class="digit thirdDigit"></span></div>
                </div>
                <div class="clip">
                    <div class="shadow"><span class="digit secondDigit"></span></div>
                </div>

                <div class="clip">
                    <div class="shadow"><span class="digit firstDigit"></span></div>
                </div>
            </div>
            <div class="text bubble">
                <div class="msg">OH!<span class="triangle"></span></div>
            </div>
            <div class="text">
                <h2>Ooops... Something went wrong</h2>
                <h4>Sorry for the inconvenience, we're working on it </h4>
                <a class="home-link" href="/menu">Back to homepage</a>
            </div>
            <div>
                <img class="robot" src="images/robot-error.gif">
            </div>
        </div>
    </div>
</div>

<script src="js/500.js"></script>

</body>

</html>
