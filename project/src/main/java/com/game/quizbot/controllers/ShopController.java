package com.game.quizbot.controllers;

import com.game.quizbot.dto.UserDto;
import com.game.quizbot.services.avatars.AvatarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ShopController {


    @Autowired
    AvatarService as;

    @GetMapping("/show-shop")
    public ModelAndView showShop(ModelAndView modelAndView,  HttpSession session){
        if(session!=null && session.getAttribute("login-user")!=null) {
            UserDto userDto = (UserDto) session.getAttribute("login-user");
            int currentUserId = userDto.getUserId();
            modelAndView.addObject("currentUserId", currentUserId);
            int avatarCount = as.getAvatarCount();
            modelAndView.addObject("avatarCount", avatarCount);
        }
            modelAndView.setViewName("shop");
        return modelAndView;
    }
}
