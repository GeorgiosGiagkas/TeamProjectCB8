package com.game.quizbot.controllers;


import com.game.quizbot.dao.AvatarDao;
import com.game.quizbot.dao.RoleDao;
import com.game.quizbot.dao.UserDao;
import com.game.quizbot.model.Avatar;
import com.game.quizbot.model.Role;
import com.game.quizbot.model.User;
import com.game.quizbot.validators.UserRegisterValidator;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class UserRegisterController {

    @Autowired
    UserDao userDao;

    @Autowired
    RoleDao roleDao;

    @Autowired
    AvatarDao avatarDao;

    @Autowired
    UserRegisterValidator userRegisterValidator;

    @GetMapping(value = "/register")
    public String showRegisterForm(ModelMap mm) {
        User user = new User();
        mm.addAttribute("user", user);
        return "register";
    }

    @InitBinder
    private void InitBinder (WebDataBinder binder) {
        binder.addValidators(userRegisterValidator);
    }

    @PostMapping("/registerUser")
    public String insertUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        System.out.println(user.getRetypePassword());
        System.out.println(user.getUserPassword());
        if (bindingResult.hasErrors()) {
            return "register";
        } else {
            String hashed = BCrypt.hashpw(user.getUserPassword(), BCrypt.gensalt());
            user.setUserPassword(hashed);
            Role role = roleDao.getRoleByRoleName("User");
            user.setRoleId(role);
            Avatar avatar = avatarDao.getAvatarById(1);
            user.setSelectedAvatarId(avatar);
            user.setWallet(0);
            userDao.insertUser(user);
            return "registerAuth";
        }
    }



}
