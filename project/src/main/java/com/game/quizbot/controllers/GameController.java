package com.game.quizbot.controllers;

import com.game.quizbot.dao.AnswerDao;
import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.model.Answer;
import com.game.quizbot.services.questions.QuestionBundleAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;



@Controller
public class GameController {


    @Autowired
    QuestionBundleAssembler assembler;

    @Autowired
    AnswerDao answerDao;



    @GetMapping("/start-game")
    public ModelAndView startGame(ModelAndView mv, HttpSession session,@RequestParam("category-id") int categoryId){
//        User user = (User)session.getAttribute("login-user");
        assembler.setCategoryId(categoryId);
//        assembler.setUserId(user.getUserId());
        assembler.setUserId(1);
        List<QuestionPackDto>  bundle = assembler.getWeightedQuestionBundle();

        session.setAttribute("round-counter",0);
        session.setAttribute("bundle",bundle);

        mv.setViewName("game");
        return mv;
    }

    //Rest return a question . Even the first one.
    @ResponseBody
    @GetMapping("/get-next-question")
    public QuestionPackDto getNextQuestion(HttpSession session, HttpServletResponse response) {
        List<QuestionPackDto> bundle = (ArrayList<QuestionPackDto>)session.getAttribute("bundle");
        int roundCounter =(int) session.getAttribute("round-counter");
        if(roundCounter>=bundle.size()){
            QuestionPackDto emptyPack = new QuestionPackDto();
            return  emptyPack;
        }

        return bundle.get(roundCounter);
    }


    @ResponseBody
    @GetMapping("/answer-verification")
    public int verifyAnswer(@RequestParam("question-id") int questionId, @RequestParam("answer-id") int answerId ,HttpSession session){
        //check answer
        Answer answer =answerDao.getCorrectAnswerByQuestionId(questionId);
        if(answerId==answer.getAnswerId()){
            //
        }
        //insert output to database
        //return result

        //update round
        int roundCounter =(int)session.getAttribute("round-counter");
        session.setAttribute("round-counter",(roundCounter+1));

        return  answer.getAnswerId();
    }


    //On refresh. Save the state kai run the corresponding rest state??

}
