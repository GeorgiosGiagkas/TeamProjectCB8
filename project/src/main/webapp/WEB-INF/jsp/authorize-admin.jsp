<%

    if(session!=null){
        if(session.getAttribute("login-user")!=null){
            response.sendRedirect("/forbidden");
        }

    }

%>
