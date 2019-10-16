<%--
  Created by IntelliJ IDEA.
  User: giagkas
  Date: 16/10/19
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
</head>
<body>
    <button>Play</button>

    <script type="application/javascript">
        $(document).ready(function(){
            $("button").click(function(){
               callRestShowCategories();
            });

            function callRestShowCategories(){
                $.ajax({
                    url: "/show-categories"
                }).then(function(data){
                    console.log(data);
                });
            }
        });
    </script>
</body>
</html>
