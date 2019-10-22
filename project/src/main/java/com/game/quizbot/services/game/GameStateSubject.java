package com.game.quizbot.services.game;

import java.util.ArrayList;
import java.util.List;

public class GameStateSubject {
    private int userId;
    private int categoryId;
    private  int round;
    private int answerId;
    private int points;
    private  int time;
    private int highscore;

    private List<GameObserver> gameObservers = new ArrayList<>();

    public void registerGameObserver(GameObserver gameObserver){
        gameObservers.add(gameObserver);
    }

    public void removeGameObserver(GameObserver gameObserver){
        gameObservers.remove(gameObserver);
    }

    public void notifyAllGameObservers(){
        for(GameObserver go : gameObservers){
            go.update();
        }
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getRound() {
        return round;
    }

    public void setRound(int round) {
        this.round = round;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getHighscore() {
        return highscore;
    }

    public void setHighscore(int highscore) {
        this.highscore = highscore;
    }

    public List<GameObserver> getGameObservers() {
        return gameObservers;
    }

    public void setGameObservers(List<GameObserver> gameObservers) {
        this.gameObservers = gameObservers;
    }
}
