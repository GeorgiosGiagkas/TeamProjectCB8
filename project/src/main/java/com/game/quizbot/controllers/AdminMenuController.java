package com.game.quizbot.controllers;


import com.game.quizbot.dao.QuestionDao;
import com.game.quizbot.dao.UserQuestionDao;
import com.game.quizbot.model.Category;
import com.game.quizbot.services.categories.CategoryService;
import com.game.quizbot.utils.StatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AdminMenuController {

    @Autowired
    UserQuestionDao uqd;

    @Autowired
    QuestionDao qd;

    @Autowired
    CategoryService cs;

    @GetMapping("/admin-menu")
    public ModelAndView showAdminMenu(ModelAndView modelAndView, ModelMap m){
        List allCategories = cs.getActiveCategories();
        m.addAttribute("allCategories", allCategories);
        modelAndView.setViewName("admin-menu");
        return modelAndView;
    }


    @GetMapping("/show-list")
    @ResponseBody
    public List<Integer> getList(){
        List<Integer> questions = qd.getWeightedQuestionIds(22, 26);
        return questions;
    }
}
