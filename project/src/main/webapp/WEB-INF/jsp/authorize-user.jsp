<%

    if(session!=null){
        if(session.getAttribute("login-admin")!=null){
            response.sendRedirect("/forbidden");
        }

    }

%>
