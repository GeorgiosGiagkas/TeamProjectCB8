package com.game.quizbot.controllers;

import com.game.quizbot.dao.AnswerDao;
import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.dao.QuestionDao;
import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Category;
import com.game.quizbot.model.Question;
import com.game.quizbot.services.questions.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Controller
public class QuestionController {

    @Autowired
    QuestionDao qd;

    @Autowired
    CategoryDao cd;

    @Autowired
    AnswerDao ad;

    @Autowired
    QuestionService qs;


    @GetMapping("/show-create-question")
    public String showCreateQuestion(ModelMap m){
        Question q = new Question();

        m.addAttribute("myquestion", q);

        return "create-question";

    }

    @PostMapping("/create-question")
    public String createQuestion(@ModelAttribute("myquestion") Question q, @RequestParam("answer")List<String> answersStr, @RequestParam("correct") int correctAnswer,
                                 @RequestParam("categoryName") String categoryName){

        qs.createQuestion(q, answersStr, correctAnswer, categoryName);


        return "admin-menu";
    }
}
