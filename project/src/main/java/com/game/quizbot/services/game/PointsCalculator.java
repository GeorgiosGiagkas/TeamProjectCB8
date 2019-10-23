package com.game.quizbot.services.game;

public class PointsCalculator implements GameObserver {

    private int userId;
    private int answerId;
    private int questionId;
    private int points;
    private int time;

    private GameStateSubject gameStateSubject;

    @Override
    public void update() {

    }

    public void calculate(){

    }
}
