package com.game.quizbot.controllers;

import com.game.quizbot.dao.UserDao;
import com.game.quizbot.dto.UserDto;
import com.game.quizbot.model.User;

import com.game.quizbot.services.chat.AvailableAdmin;
import com.game.quizbot.services.chat.SessionRegistry;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@Controller
public class ChatController {

    @Autowired
    UserDao userDao;

    @GetMapping("/admin-chat")
    public ModelAndView showAdminChat(ModelAndView modelAndView, HttpSession session){
        modelAndView.setViewName("chat-admin");
        if(session!=null && session.getAttribute("login-admin")!=null) {
            String adminNickname = ((UserDto) (session.getAttribute("login-admin"))).getUserNickname();
            Integer adminAvatarId = ((UserDto) (session.getAttribute("login-admin"))).getSelectedAvatarId();
            modelAndView.addObject("adminNickname", adminNickname);
            modelAndView.addObject("adminAvatarId", adminAvatarId);
        }
        return  modelAndView;
    }

    @ResponseBody
    @GetMapping("/admin-get-users")
    public List<UserDto> getAllUsers(){
        List<UserDto> usersDtoList = new ArrayList<>();
        for(User u : userDao.getAllUsers()) {
            UserDto userDto = new UserDto();
            userDto.setUserId(u.getUserId());
            userDto.setUserNickname(u.getUserNickname());
            userDto.setSelectedAvatarId(u.getSelectedAvatarId().getAvatarId());
            usersDtoList.add(userDto);
        }
        return usersDtoList;
    }

    @ResponseBody
    @GetMapping("/user-get-available-admin")
    public AvailableAdmin getAdmin(){
        SessionRegistry sessionRegistry = SessionRegistry.getSessionRegistry();
        return sessionRegistry.getAvailableAdmin();
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
