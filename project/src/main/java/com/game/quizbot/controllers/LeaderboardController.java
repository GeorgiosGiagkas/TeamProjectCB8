package com.game.quizbot.controllers;

import com.game.quizbot.dto.CategoryDto;
import com.game.quizbot.services.categories.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;

@Controller
public class LeaderboardController {

    @Autowired
    CategoryService cs;

    @GetMapping("/show-leaderboard")
    public ModelAndView showLeaderboard(ModelAndView modelAndView, ModelMap m){
        modelAndView.setViewName("leaderboard");
        List allCategories = cs.getActiveCategories();
        m.addAttribute("allCategories", allCategories);
        return modelAndView;
    }



}
