package com.game.quizbot.controllers;


import com.game.quizbot.dto.CategoryDto;
import com.game.quizbot.model.User;
import com.game.quizbot.services.categories.ActiveCategories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
public class MenuController {

    @Autowired
    ActiveCategories activeCategories;



    @GetMapping("/main-menu")
    public ModelAndView showMainMenu(HttpSession session,ModelAndView modelAndView){
        User user =(User)session.getAttribute("login-user");
        modelAndView.setViewName("main-menu");
        return  modelAndView;
    }


    @GetMapping("/show-categories")
    @ResponseBody
    public List<CategoryDto> showCategories(){

        return  activeCategories.getActiveCategories();

    }


}
