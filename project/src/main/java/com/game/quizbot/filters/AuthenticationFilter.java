package com.game.quizbot.filters;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
@Order(1)
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;

        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);

        if(session==null &&( uri.endsWith("login") || uri.endsWith("register")||uri.endsWith("registerUser") || uri.endsWith("loginUser") || uri.endsWith("loginSuccess"))){
            System.out.println("Filter 1 - null session-login/register");
            filterChain.doFilter(servletRequest, servletResponse);
        }

        else if (session == null && !(uri.endsWith("login")) && (!isHelpFile(uri))) {
            System.out.println("Filter 1 - null session- redirect to login");
            res.sendRedirect("login");
        }

        else if(session != null &&
                (uri.endsWith("loginUser") || uri.endsWith("loginSuccess")) &&
                session.getAttribute("login-user") != null &&
                (!isHelpFile(uri))) {
            System.out.println("Filter 1 - USER logged in");
            filterChain.doFilter(servletRequest, servletResponse);

        } else if(session != null &&
                (uri.endsWith("loginUser") || uri.endsWith("loginSuccess")) &&
                session.getAttribute("login-admin") != null &&
                (!isHelpFile(uri))) {
            System.out.println("Filter 1 - ADMIN logged in");
            filterChain.doFilter(servletRequest, servletResponse);

        } else if(session != null &&
                session.getAttribute("login-user") == null &&
                session.getAttribute("login-admin") == null &&
                (!(uri.endsWith("login")|| uri.endsWith("register")||uri.endsWith("registerUser") || uri.endsWith("loginUser") || uri.endsWith("loginSuccess"))) &&
                (!isHelpFile(uri))) {
            System.out.println("Filter 1 - session not null but not logged in");
            res.sendRedirect("login");
        } else {

            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    private boolean isHelpFile (String uri){
        return (uri.endsWith("css") ||
                uri.endsWith("js") ||
                uri.endsWith("mp4") ||
                uri.endsWith("png") ||
                uri.endsWith("jpg") ||
                uri.endsWith("wmv"));
    }


}
