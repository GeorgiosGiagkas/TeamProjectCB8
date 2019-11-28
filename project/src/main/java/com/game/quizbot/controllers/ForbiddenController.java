package com.game.quizbot.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ForbiddenController {

    @RequestMapping(value = "/forbidden", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity sendViaResponseEntity() {
        return new ResponseEntity(HttpStatus.FORBIDDEN);
    }

}
