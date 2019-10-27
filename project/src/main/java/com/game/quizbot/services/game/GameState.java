package com.game.quizbot.services.game;

import org.springframework.stereotype.Component;

@Component
public class GameState {


    public GameStateSubject createGameStateSubject(){
        GameStateSubject gameStateSubject = new GameStateSubject();

        QuestionPackHandler questionPackHandler= new QuestionPackHandler();
        RecordUserAnswer recordUserAnswer=new RecordUserAnswer();
        PointsCalculator pointsCalculator= new PointsCalculator();


        //order of game observers matters
        gameStateSubject.registerGameObserver(questionPackHandler);
        gameStateSubject.registerGameObserver(recordUserAnswer);
        gameStateSubject.registerGameObserver(pointsCalculator);

        return gameStateSubject;
    }
}
