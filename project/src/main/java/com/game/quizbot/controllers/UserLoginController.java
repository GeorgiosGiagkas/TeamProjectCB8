package com.game.quizbot.controllers;


import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.repositories.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserLoginController {
    @Autowired
    CategoryDao cd;

    @GetMapping(value="/login")
    public ModelAndView showLogin(ModelAndView mv){
        mv.setViewName("login");
        return mv;
    }

    @GetMapping(value="/register")
    public ModelAndView showRegister(ModelAndView mv){
        mv.setViewName("register");
        return mv;
    }

}
