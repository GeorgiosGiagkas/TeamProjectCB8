package com.game.quizbot.controllers;


import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.dto.UserDto;
import com.game.quizbot.services.game.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


@Controller
public class GameController {

   @Autowired
   GameState gameState;

    @GetMapping("/start-game")
    public ModelAndView startGame(ModelAndView mv, HttpSession session, @RequestParam("category-id") int categoryId){

        session.removeAttribute("gameStateSubject");
        GameStateSubject gameStateSubject = gameState.createGameStateSubject();
        int userId = ((UserDto) session.getAttribute("login-user")).getUserId();
        gameStateSubject.setUserId(userId);
        gameStateSubject.setCategoryId(categoryId);
        gameStateSubject.setRound(1);
        gameStateSubject.setTotalRunPoints(0);
        gameStateSubject.setCurrentQuestionPoints(0);
        gameStateSubject.setRecordStateActive(false);

        gameStateSubject.notifyAllGameObservers();

        session.setAttribute("gameStateSubject",gameStateSubject);
        mv.setViewName("game");
        return mv;
    }

    //Rest return a question . Even the first one.
    @ResponseBody
    @GetMapping("/get-next-question")
    public QuestionPackDto getNextQuestion(HttpSession session) {
        GameStateSubject gameStateSubject = (GameStateSubject)  session.getAttribute("gameStateSubject");
        gameStateSubject.setRecordStateActive(false);
        gameStateSubject.notifyAllGameObservers();
        return gameStateSubject.getQuestionPackDto();
    }


    @ResponseBody
    @GetMapping("/answer-verification")
    public UpdatedScoreStatus verifyAnswer( @RequestParam("answer-id") int answerId ,
                                           @RequestParam("timer") int timer, @RequestParam("points") int points, HttpSession session){
        GameStateSubject gameStateSubject = (GameStateSubject)  session.getAttribute("gameStateSubject");
        gameStateSubject.setRecordStateActive(true);
        gameStateSubject.setAnswerId(answerId);
        gameStateSubject.setTime(timer);
        gameStateSubject.setCurrentQuestionPoints(points);

        gameStateSubject.notifyAllGameObservers();

        gameStateSubject.nextRound();

        return  gameStateSubject.getUpdatedScoreStatus();
    }



}
