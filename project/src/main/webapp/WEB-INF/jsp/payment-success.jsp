<%@include file="authorize-user.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Quizbot</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Payment Success</h1>
<script>
    $(document).ready(function () {
        setTimeout(function () {
            location.href = "/show-shop";
        }, 3000);
    });

</script>
</body>
</html>