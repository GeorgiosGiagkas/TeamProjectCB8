package com.game.quizbot.controllers;

import com.game.quizbot.dao.UserDao;
import com.game.quizbot.dto.UserDto;
import com.game.quizbot.model.User;
import com.game.quizbot.validators.UserLoginValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class UserLoginController {

    @Autowired
    UserDao userDao;

    @Autowired
    UserLoginValidator userLoginValidator;

    @InitBinder
    private void initBinder (WebDataBinder binder) {
        binder.addValidators(userLoginValidator);
    }

    @GetMapping(value = "/login")
    public String showLoginForm(ModelMap mm) {
        UserDto loginUser = new UserDto();
        mm.addAttribute("userDto", loginUser);
        return "login";
    }

    @PostMapping("/loginUser")
    public String loginUser(@Valid @ModelAttribute("userDto") UserDto userDto, BindingResult bindingResult, HttpSession session) {
        if (bindingResult.hasErrors()) {
            return "login";
        } else {
            User dbUser = userDao.getUserByNickname(userDto.getUserNickname());
            userDto.setUserPassword(null);
            userDto.setUserId(dbUser.getUserId());
            userDto.setUserEmail(dbUser.getUserEmail());
            userDto.setWallet(dbUser.getWallet());
            userDto.setRoleId(dbUser.getRoleId().getRoleId());
            if(userDto.getRoleId() == 1){
                session.setAttribute("login-admin", userDto);
                return "redirect:/admin-menu";
            } else {
                session.setAttribute("login-user", userDto);
                return "redirect:/main-menu";
            }
        }

    }
}
