package com.game.quizbot.controllers;


import com.game.quizbot.dao.AvatarDao;
import com.game.quizbot.dao.UserDao;
import com.game.quizbot.dto.CategoryDto;
import com.game.quizbot.dto.PlayerStats;
import com.game.quizbot.dto.PlayerStatsDto;
import com.game.quizbot.dto.UserDto;
import com.game.quizbot.model.User;
import com.game.quizbot.services.avatars.AvatarService;
import com.game.quizbot.services.categories.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

    @Autowired
    AvatarService as;



    @GetMapping("/menu")
    public ModelAndView showMenu(ModelAndView modelAndView, HttpSession session){
        modelAndView.setViewName("menu");
        if(session!=null && session.getAttribute("login-user")!=null){
            String userNickname=((UserDto)(session.getAttribute("login-user"))).getUserNickname();
            Integer userAvatarId=((UserDto)(session.getAttribute("login-user"))).getSelectedAvatarId();
            modelAndView.addObject("userNickname",userNickname);
            modelAndView.addObject("userAvatarId",userAvatarId);
        }

        return  modelAndView;
    }

    @GetMapping("/show-categories")
    @ResponseBody
    public List<CategoryDto> showCategories(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        return cs.getActiveCategories();
    }

    @ResponseBody
    @GetMapping("/get-user-stats-by-id")
    public List<PlayerStatsDto> getPlayerStatsById(@RequestParam("userId") int userId, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
       return playerStats.getFullList(userId);
    }

    @ResponseBody
    @GetMapping("/get-user-stats")
    public List<PlayerStatsDto> getPlayerStats(HttpServletResponse response, HttpSession session){
        response.setHeader("Access-Control-Allow-Origin", "*");
        int userId = ((UserDto)session.getAttribute("login-user")).getUserId();
        return playerStats.getFullList(userId);
    }

    @PostMapping("/set-selected-avatar")
    @ResponseBody
    public void setSelectedAvatar(@RequestParam("avatarId") int avatarId, HttpSession session){
        as.setSelectedAvatar(avatarId, session);
    }


}
