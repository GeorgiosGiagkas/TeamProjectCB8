package com.game.quizbot.controllers;

import com.game.quizbot.dao.AnswerDao;
import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.dao.QuestionDao;
import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Category;
import com.game.quizbot.model.Question;
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


    @GetMapping("/show-create-question")
    public String showCreateQuestion(ModelMap m){
        Question q = new Question();

        m.addAttribute("myquestion", q);

        return "create-question";

    }

    @PostMapping("/create-question")
    public String createQuestion(@ModelAttribute("myquestion") Question q, @RequestParam("answer")List<String> answersStr, @RequestParam("correct") int correctAnswer,
                                 @RequestParam("categoryName") String categoryName){


        Iterable<Category> categories = new ArrayList<>();
        categories = cd.getCategoriesByName(categoryName);
        Category categoryId = ((ArrayList<Category>) categories).get(0);

        q.setCategoryId(categoryId);

        qd.insertQuestion(q);

        System.out.println(answersStr.toString());

        for(int i = 0; i < answersStr.size(); i++){
            Answer answer = new Answer();
            answer.setAnswerContent(answersStr.get(i));
            answer.setQuestionId(q);
            answer.setAnswerCorrect(false);
            int answerNo = i + 1;
            if(correctAnswer == answerNo)
                answer.setAnswerCorrect(true);
            ad.insertAnswer(answer);
        }

        return "admin-menu";
    }
}
