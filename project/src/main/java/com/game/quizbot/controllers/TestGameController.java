package com.game.quizbot.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestGameController {

    @GetMapping("/test-main-game")
    public String testMainGame(){
        return "main-game";
    }
}
