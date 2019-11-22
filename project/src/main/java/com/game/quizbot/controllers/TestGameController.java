package com.game.quizbot.controllers;

import com.game.quizbot.dto.UserDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class TestGameController {

    @GetMapping("/test-main-game")
    public ModelAndView testMainGame(ModelAndView mv,HttpSession session){
        int selectedAvatarId = ((UserDto) session.getAttribute("login-user")).getSelectedAvatarId();
        mv.addObject("selectedAvatarId",selectedAvatarId);
        mv.setViewName("main-game");
        return mv;
    }
}
