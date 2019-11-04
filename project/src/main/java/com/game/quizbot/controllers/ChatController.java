package com.game.quizbot.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController {

    @GetMapping("/admin-chat")
    public String showAdminChat(){
        return  "test-chat-admin";
    }
}
