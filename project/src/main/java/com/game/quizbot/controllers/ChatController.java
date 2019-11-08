package com.game.quizbot.controllers;

import com.game.quizbot.dao.UserDao;
import com.game.quizbot.dto.UserDto;
import com.game.quizbot.model.User;

import com.game.quizbot.services.chat.SessionRegistry;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.ArrayList;
import java.util.List;


@Controller
public class ChatController {

    @Autowired
    UserDao userDao;

    @GetMapping("/admin-chat")
    public String showAdminChat(){
        return  "test-chat-admin";
    }

    @GetMapping("/user-chat")
    public String showUserChat(){
        return  "test-chat-user";
    }

    @ResponseBody
    @GetMapping("/admin-get-users")
    public List<UserDto> getAllUsers(){
        List<UserDto> usersDtoList = new ArrayList<>();
        for(User u : userDao.getAllUsers()) {
            UserDto userDto = new UserDto();
            userDto.setUserId(u.getUserId());
            userDto.setUserNickname(u.getUserNickname());
            usersDtoList.add(userDto);
        }
        return usersDtoList;
    }

    @ResponseBody
    @GetMapping("/user-get-available-admin")
    public String getAdmin(){
        SessionRegistry sessionRegistry = SessionRegistry.getSessionRegistry();
        return sessionRegistry.getAvailableAdminSessionId();
    }

    @ResponseBody
    @GetMapping("/admin-get-user-session-id")
    public String getUser(@RequestParam("user-id") int userId){
        SessionRegistry sessionRegistry = SessionRegistry.getSessionRegistry();
        return  sessionRegistry.getUserSessionId(userId);
    }

    @ResponseBody
    @GetMapping("/admin-get-user-id-by-nickname")
    public int getUserIdByNickname(@RequestParam("userNickname") String userNickname){
        SessionRegistry sessionRegistry = SessionRegistry.getSessionRegistry();
        return sessionRegistry.getUserIdByNickname(userNickname);
    }


}
