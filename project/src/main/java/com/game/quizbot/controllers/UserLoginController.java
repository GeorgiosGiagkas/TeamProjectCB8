package com.game.quizbot.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserLoginController {


    @GetMapping(value="/login")
    public ModelAndView showLogin(ModelAndView mv){
        mv.setViewName("login");
        return mv;
    }

}
