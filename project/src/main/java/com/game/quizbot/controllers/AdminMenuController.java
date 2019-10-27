package com.game.quizbot.controllers;


import com.game.quizbot.dao.UserQuestionDao;
import com.game.quizbot.model.Category;
import com.game.quizbot.utils.StatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMenuController {

    @Autowired
    UserQuestionDao uqd;

    @GetMapping("/admin-menu")
    public ModelAndView showAdminMenu(ModelAndView modelAndView, ModelMap m){
        modelAndView.setViewName("admin-menu");
        return modelAndView;
    }

    @GetMapping("/show-number")
    @ResponseBody
    public double showNumber(){
        int number = uqd.getNumberOfCorrectResponses(1, 1);
        return number;
    }

    @GetMapping("/show-numbers")
    @ResponseBody
    public int showNumbers(){
        int number = uqd.getTotalNumberOfResponses(1, 1);
        return number;
    }
}
