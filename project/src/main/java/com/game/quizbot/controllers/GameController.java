package com.game.quizbot.controllers;


import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.model.Category;
import com.game.quizbot.model.User;
import com.game.quizbot.services.questions.QuestionBundleAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class GameController {

    @Autowired
    CategoryDao categoryDao;


    @GetMapping("/start-game")
    public ModelAndView startGame(ModelAndView mv, HttpSession session, @RequestParam("category-id") int categoryId){
        User user = (User)session.getAttribute("login-user");
        Category category = categoryDao.getCategoryById(categoryId);
        session.setAttribute("selected-category",category);
        QuestionBundleAssembler assembler = new QuestionBundleAssembler(user,category);
        session.setAttribute("question-bundle",assembler.getWeightedQuestionBundle());


        mv.setViewName("game");
        return mv;
    }
}
