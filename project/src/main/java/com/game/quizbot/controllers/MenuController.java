package com.game.quizbot.controllers;


import com.game.quizbot.dto.CategoryDto;
import com.game.quizbot.dto.PlayerStats;
import com.game.quizbot.dto.PlayerStatsDto;
import com.game.quizbot.dto.UserDto;
import com.game.quizbot.model.User;
import com.game.quizbot.services.categories.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
public class MenuController {


    @Autowired
    CategoryService cs;

    @Autowired
    PlayerStats playerStats;

    @GetMapping("/main-menu")
    public ModelAndView showMainMenu(ModelAndView modelAndView){
        modelAndView.setViewName("main-menu");
        return  modelAndView;
    }

    @GetMapping("/show-categories")
    @ResponseBody
    public List<CategoryDto> showCategories(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        return cs.getActiveCategories();
    }

    @ResponseBody
    @GetMapping("/get-user-stats")
    public List<PlayerStatsDto> getPlayerStats(@RequestParam("userId") int userId, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
       return playerStats.getList(userId);
    }


}
