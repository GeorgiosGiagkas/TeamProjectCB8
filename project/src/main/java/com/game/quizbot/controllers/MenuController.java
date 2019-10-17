package com.game.quizbot.controllers;



import com.game.quizbot.model.Category;
import com.game.quizbot.model.User;
import com.game.quizbot.services.categories.ActiveCategories;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class MenuController {

    @GetMapping("/main-menu")
    public ModelAndView showMainMenu(HttpSession session,ModelAndView modelAndView){
        User user =(User)session.getAttribute("login-user");
        modelAndView.setViewName("main-menu");
        return  modelAndView;
    }


    @GetMapping("/show-categories")
    @ResponseBody
    public Iterable<Category> showCategories(){
        ActiveCategories activeCategories = new ActiveCategories();
        return  activeCategories.getActiveCategories();
    }


}
