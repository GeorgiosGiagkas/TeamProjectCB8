package com.game.quizbot.controllers;

import com.game.quizbot.dao.AnswerDao;
import com.game.quizbot.dao.QuestionDao;
import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.services.questions.QuestionBundleAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import java.util.List;



@Controller
public class GameController {


    @Autowired
    QuestionBundleAssembler assembler;


    @GetMapping("/start-game")
    public ModelAndView startGame(ModelAndView mv, HttpSession session,@RequestParam("category-id") int categoryId){
//        User user = (User)session.getAttribute("login-user");
        assembler.setCategoryId(categoryId);
//        assembler.setUserId(user.getUserId());
        assembler.setUserId(1);
        List<QuestionPackDto>  bundle = assembler.getWeightedQuestionBundle();


        session.setAttribute("question",bundle.get(0));
        session.setAttribute("answers",bundle.get(0).getAnswers());
        bundle.remove(0);
        mv.setViewName("game");
        return mv;
    }

    //Rest return a question . Even the first one.
    @ResponseBody
    @GetMapping("/get-next-question")
    public QuestionPackDto getNextQuestion(HttpSession session){
        session.getAttribute("bundle");
        return null;
    }


    @ResponseBody
    @GetMapping("/answer-verification")
    public boolean verifyAnswer(@RequestParam("question-id") int questionId, @RequestParam("answer-id") int answerId ){
        //check answer
        //insert output to database
        //return boolean result
        //remove a questionpack from the bundle
        return  true;
    }


    //On refresh. Save the state kai run the corresponding rest state??

}
