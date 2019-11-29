package com.game.quizbot.controllers;


import com.game.quizbot.dao.QuestionDao;
import com.game.quizbot.dao.UserQuestionDao;
import com.game.quizbot.dto.QuestionWeight;
import com.game.quizbot.dto.UserDto;
import com.game.quizbot.model.Category;
import com.game.quizbot.services.categories.CategoryService;
import com.game.quizbot.utils.StatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
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
    public ModelAndView showAdminMenu(ModelAndView modelAndView, ModelMap m, HttpSession session){
        if(session!=null && session.getAttribute("login-admin")!=null) {
            List allCategories = cs.getActiveCategories();
            m.addAttribute("allCategories", allCategories);
        }
        modelAndView.setViewName("admin-menu");
        return modelAndView;
    }

    //TEST
    @GetMapping("/show-list")
    @ResponseBody
    public List<Integer> showList(HttpSession session){
        int userId = ((UserDto) session.getAttribute("login-user")).getUserId();
        List<Integer> list = qd.getWeightedQuestionIds(userId, 26);
        return  list;
    }

    //TEST
    @GetMapping("/show-weights")
    @ResponseBody
    public List<QuestionWeight> showWeights(){
        List<QuestionWeight> weights = qd.getWeights(22, 26);
        return weights;
    }


}
