package com.game.quizbot.controllers;

import com.game.quizbot.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ShopController {



    @GetMapping("/show-shop")
    public ModelAndView showShop(ModelAndView modelAndView, UserDto userDto, ModelMap m, HttpSession session){
        userDto = (UserDto)session.getAttribute("login-user");
        if(userDto!=null) {
            int currentUserId = userDto.getUserId();
            m.addAttribute("currentUserId", currentUserId);
            modelAndView.setViewName("shop");

        }else {
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
}
