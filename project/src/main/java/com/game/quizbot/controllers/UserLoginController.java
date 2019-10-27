package com.game.quizbot.controllers;

import com.game.quizbot.dao.UserDao;
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

    @GetMapping(value = "/login")
    public String showLoginForm(ModelMap mm) {
        User loginUser = new User();
        mm.addAttribute("user", loginUser);
        return "login";
    }

    @InitBinder
    private void InitBinder (WebDataBinder binder) {
        binder.addValidators(userLoginValidator);
    }

    @PostMapping("/loginUser")
    public String loginUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult, HttpSession session) {
        if (userDao.checkUserByPassword(user)) {
            session.setAttribute("loginUser", user);
            return "main-menu";
        } else
            return "login";
    }
}
