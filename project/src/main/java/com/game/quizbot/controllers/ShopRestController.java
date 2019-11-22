package com.game.quizbot.controllers;

import com.game.quizbot.dao.UserDao;
import com.game.quizbot.dto.ShopDto;
import com.game.quizbot.dto.UserDto;
import com.game.quizbot.model.User;
import com.game.quizbot.services.shop.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

@RestController
public class ShopRestController {

    @Autowired
    ShopService ss;

    @Autowired
    UserDao ud;

    @GetMapping(value = "/getShopDtoByUserId/{userId}")
    public ShopDto returnShopDtoByUserId(@PathVariable("userId") String userIdString, Pageable pageable, UserDto userDto, HttpSession session, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        userDto = (UserDto)session.getAttribute("login-user");
        int userWallet = 0;
        if(userDto!=null) {
            userWallet = userDto.getWallet();
        }
        int userIdInt = Integer.parseInt(userIdString);
        ShopDto shopDtoByUserId = ss.getShopDtoByUserId(userIdInt, pageable);
        shopDtoByUserId.setUserWallet(userWallet);
        return shopDtoByUserId;

    }

    @GetMapping(value = "/doShopTranscation/{userId}/{avatarId}")
    public boolean returnTranscactionResult(@PathVariable("userId") String userIdString, @PathVariable("avatarId") String avatarIdString, UserDto userDto, HttpSession session){
        userDto = (UserDto)session.getAttribute("login-user");
        int userWallet = 0;
        if(userDto!=null) {
            userWallet = userDto.getWallet();
        }

        int userIdInt = Integer.parseInt(userIdString);

        int avatadIdInt = Integer.parseInt(avatarIdString);

        boolean result = ss.shopTranscaction(userIdInt,avatadIdInt,userWallet);

        // update user's wallet in Session userDto
        if (result==true){
            // get new wallet value from database
            User user = new User();
            user = ud.getUserById(userIdInt);
            int updatedUserWallet = user.getWallet();

            userDto.setWallet(updatedUserWallet);
        }


        return result;
    }





}
