package com.game.quizbot.controllers;


import com.game.quizbot.dao.UserDao;
import com.game.quizbot.model.Avatar;
import com.game.quizbot.model.Role;
import com.game.quizbot.model.User;
import com.game.quizbot.validators.UserValidator;
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
    UserValidator userValidator;

    @GetMapping(value = "/register")
    public String showRegisterForm(ModelMap mm) {
        User user = new User();
        mm.addAttribute("user", user);
        return "register";
    }

    @InitBinder
    private void InitBinder (WebDataBinder binder) {
        binder.addValidators(userValidator);
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
            Role role = new Role();
            role.setRoleId(2);
            user.setRoleId(role);
            Avatar avatar = new Avatar();
            avatar.setAvatarId(1);
            user.setSelectedAvatarId(avatar);
            user.setWallet(0);
            userDao.insertUser(user);
            return "main-menu";
        }
    }

}
