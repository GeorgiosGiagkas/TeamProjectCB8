package com.game.quizbot.controllers;

import com.game.quizbot.dto.UserDto;
import com.game.quizbot.model.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class UserRestController {

    @GetMapping("get-user-info")
    public UserDto getUserInfo(HttpSession session){
        UserDto thisuser = (UserDto) session.getAttribute("login-user");
        return thisuser;
    }
}
