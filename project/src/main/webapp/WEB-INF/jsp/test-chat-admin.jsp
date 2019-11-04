<%--
  Created by IntelliJ IDEA.
  User: giagkas
  Date: 31/10/19
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/admin-chat.css">
    <title>Admin</title>
</head>
<body>



    <ul></ul>



<script>
    const ul = document.querySelector("ul");


    const createUserDataBox= (id, nickname) =>{
        //create td element to click containing a user info
        const userData = document.createElement("li");
        userData.className+="userBox";

        userData.setAttribute("id",id);
        userData.innerText=nickname;

        //create row and append

        ul.appendChild(userData)
    }


    createUserDataBox("1","akuma");


</script>
</body>
</html>
