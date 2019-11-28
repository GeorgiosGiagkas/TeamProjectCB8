package com.game.quizbot.controllers;

import com.game.quizbot.dao.AnswerDao;
import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.dao.QuestionDao;
import com.game.quizbot.dto.CategoryDto;
import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Category;
import com.game.quizbot.model.Question;
import com.game.quizbot.services.questions.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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




    @PostMapping("/create-question")
    public String createQuestion(@RequestParam("questionContent") String questionContent, @RequestParam("answer")List<String> answersStr, @RequestParam("correct") int correctAnswer,
                                 @RequestParam("categoryName") String categoryName,
                                 HttpSession session){
        if(session!=null && session.getAttribute("login-admin")!=null) {


            Question q = new Question();
            q.setQuestionContent(questionContent);

            qs.createQuestion(q, answersStr, correctAnswer, categoryName);

        }
        return "redirect:/show-all-questions";
    }

    @PostMapping("/edit-question")
    public String editQuestion(@RequestParam("questionId") int questionId, @RequestParam("questionContent") String questionContent, @RequestParam("answer")List<String> answersStr, @RequestParam("correct") int correctAnswer,
                                 @RequestParam("categoryName") String categoryName, @RequestParam("answerId") List<Integer> answerIds,
                               HttpSession session){
        if(session!=null && session.getAttribute("login-admin")!=null) {
            Question q = new Question();
            q.setQuestionId(questionId);
            q.setQuestionContent(questionContent);

            qs.updateQuestion(q, answerIds, answersStr, correctAnswer, categoryName);

        }
        return "redirect:/show-all-questions";
    }

    @PostMapping("delete-question")
    public String deleteCategory(@RequestParam("questionId") int questionId,HttpSession session){
        if(session!=null && session.getAttribute("login-admin")!=null) {
            qd.deleteQuestionById(questionId);
        }
        return "redirect:/show-all-questions";
    }

    @GetMapping("show-all-questions")
    public String showAllQuestions(ModelMap m,HttpSession session){
        if(session!=null && session.getAttribute("login-admin")!=null) {
            Iterable<Question> questions = qd.getAllQuestions();
            m.addAttribute("allquestions", questions);
        }
        return "edit-question";
    }

    @GetMapping("get-question-by-id/{id}")
    @ResponseBody
    public QuestionPackDto getQuestionById(@PathVariable("id") int id){
        return qs.getQuestionPackDtoById(id);
    }



}
