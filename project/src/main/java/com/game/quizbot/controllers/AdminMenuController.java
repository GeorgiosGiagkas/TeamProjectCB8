package com.game.quizbot.controllers;


import com.game.quizbot.model.Category;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMenuController {

    @GetMapping("/admin-menu")
    public ModelAndView showAdminMenu(ModelAndView modelAndView, ModelMap m){
        modelAndView.setViewName("admin-menu");
        return modelAndView;
    }
}
