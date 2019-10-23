package com.game.quizbot.controllers;

import com.game.quizbot.dao.*;
import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.model.*;
import com.game.quizbot.services.questions.QuestionBundleAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;



@Controller
public class GameController {


    @Autowired
    QuestionBundleAssembler assembler;

    @Autowired
    AnswerDao answerDao;

    @Autowired
    QuestionDao questionDao;

    @Autowired
    UserDao userDao;

    @Autowired
    UserQuestionDao userQuestionDao;

    @Autowired
    UserHighscoreDao userHighscoreDao;



    @GetMapping("/start-game")
    public ModelAndView startGame(ModelAndView mv, HttpSession session,@RequestParam("category-id") int categoryId){
//        User user = (User)session.getAttribute("login-user");
        assembler.setCategoryId(categoryId);
//        assembler.setUserId(user.getUserId());
        assembler.setUserId(1);
        List<QuestionPackDto>  bundle = assembler.getWeightedQuestionBundle();

        session.setAttribute("round-counter",0);
        session.setAttribute("bundle",bundle);
        session.setAttribute("user-score",0);
        session.setAttribute("category-id",categoryId);

        UserHighscorePK userHighscorePK = new UserHighscorePK(1,categoryId);
        userHighscoreDao.createUserHighscore(userHighscorePK);
        UserHighscore userHighscore = userHighscoreDao.getUserHighscore(userHighscorePK);
        session.setAttribute("user-highscore",userHighscore.getHighscore());


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
    public int verifyAnswer(@RequestParam("question-id") int questionId, @RequestParam("answer-id") int answerId ,
                            @RequestParam("timer") int timer,@RequestParam("points") int points,HttpSession session){
        //check answer
        Answer answer =answerDao.getCorrectAnswerByQuestionId(questionId);
        boolean userAnswerCorrect = false;
        if(answerId==answer.getAnswerId()){
            userAnswerCorrect=true;
        }
        //insert output to database
        Question question = questionDao.getQuestionById(questionId);
        User user =  userDao.getUserById(1);

        UserQuestion userQuestion = new UserQuestion();

        userQuestion.setUserQuestionSuccess(userAnswerCorrect);

        userQuestion.setQuestionId(question);
        userQuestion.setUserId(user);
        LocalDateTime localDateTime = LocalDateTime.now();
        userQuestion.setUserQuestionTimespamp(localDateTime);
        userQuestionDao.insertUserQuestion(userQuestion);


        //calculate points
        if(userAnswerCorrect){
            int resultPoints = timer*points;
            int sum = (int)session.getAttribute("user-score") +resultPoints ;
            System.out.println(sum);
            session.setAttribute("user-score",sum);
            if(sum > (int)session.getAttribute("user-highscore")){
                //update user highscore
                UserHighscorePK userHighscorePK = new UserHighscorePK(1,(int)session.getAttribute("category-id"));
                userHighscoreDao.insertNewUserHighscore(userHighscorePK,sum);
                session.setAttribute("user-highscore",sum);
                System.out.println("new high score");
            }
        }



        //update round
        int roundCounter =(int)session.getAttribute("round-counter");
        session.setAttribute("round-counter",(roundCounter+1));

        return  answer.getAnswerId();
    }



}
