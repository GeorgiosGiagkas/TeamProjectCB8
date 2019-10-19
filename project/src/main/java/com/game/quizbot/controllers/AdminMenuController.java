package com.game.quizbot.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMenuController {

    @GetMapping("/admin-menu")
    public ModelAndView showAdminMenu(ModelAndView modelAndView){
        modelAndView.setViewName("admin-menu");
        return modelAndView;
    }
}
