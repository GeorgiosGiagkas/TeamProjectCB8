package com.game.quizbot.controllers;

import com.game.quizbot.dto.ShopDto;
import com.game.quizbot.model.UserHighscore;
import com.game.quizbot.services.shop.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@RestController
public class ShopRestController {

    @Autowired
    ShopService ss;

    @GetMapping(value = "/getShopDtoByUserId/{userId}")
    public ShopDto returnShopDtoByUserId(@PathVariable("userId") String userIdString, Pageable pageable, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        int userIdInt = Integer.parseInt(userIdString);
        ShopDto shopDtoByUserId = ss.getShopDtoByUserId(userIdInt, pageable);
        return shopDtoByUserId;

    }





}
