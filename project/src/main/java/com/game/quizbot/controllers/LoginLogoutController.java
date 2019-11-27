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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class LoginLogoutController {

    @Autowired
    UserDao userDao;

    @Autowired
    UserLoginValidator userLoginValidator;

    @GetMapping(value = "/404")
    public String show404Page() {
        return "404page";
    }

    @GetMapping(value = "/403")
    public String show403Page() {
        return "403page";
    }

    @GetMapping(value = "/500")
    public String show500Page() {
        return "500page";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("logoutMessage", "You have been logged out");
        return "redirect:/login";
    }

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
            userDto.setSelectedAvatarId(dbUser.getSelectedAvatarId().getAvatarId());
            if(userDto.getRoleId() == 1){
                session.setAttribute("login-admin", userDto);
            } else {
                session.setAttribute("login-user", userDto);
            }
            return "loginAuth";
        }
    }

    @GetMapping("/loginSuccess")
    public String loginSuccess(HttpSession session){
        String view = "login";
        if(session.getAttribute("login-admin") != null){
            view = "redirect:/admin-menu";
        } else if (session.getAttribute("login-user") != null){
            view = "redirect:/menu";
        }
        return view;
    }
}
