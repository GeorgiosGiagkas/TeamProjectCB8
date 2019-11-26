package com.game.quizbot.services.game;

import com.game.quizbot.dto.QuestionPackDto;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;


public class GameStateSubject {
    private int userId;
    private int categoryId;
    private  int round;
    private  int totalRounds;
    private QuestionPackDto questionPackDto;
    private int answerId;
    private int correctAnswerId;
    private boolean userAnswerIsCorrect;
    private int totalRunPoints;
    private int currentQuestionPoints;
    private  int time;
    private int highscore;
    private boolean recordStateActive;
    private List<GameObserver> gameObservers = new CopyOnWriteArrayList<>();

    public void registerGameObserver(GameObserver gameObserver){
        //order matters
        gameObservers.add(gameObserver);
        gameObserver.setGameStateSubject(this);
    }

    public void removeGameObserver(GameObserver gameObserver){
        gameObservers.remove(gameObserver);
    }

    public void nextRound(){
        this.round++;
    }

    public void notifyAllGameObservers(){
        Iterator<GameObserver> iterator=gameObservers.iterator();
        while (iterator.hasNext()){
            iterator.next().update();
        }
    }

    public UpdatedScoreStatus getUpdatedScoreStatus(){
        UpdatedScoreStatus updatedScoreStatus = new UpdatedScoreStatus();
        updatedScoreStatus.setHighscore(this.highscore);
        updatedScoreStatus.setCorrectAnswer(this.correctAnswerId);
        updatedScoreStatus.setCurrentScore(this.totalRunPoints);
        updatedScoreStatus.setCurrentRound(this.round);
        updatedScoreStatus.setTotalRounds(this.totalRounds);

        return  updatedScoreStatus;
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

    public QuestionPackDto getQuestionPackDto() {
        return questionPackDto;
    }

    public void setQuestionPackDto(QuestionPackDto questionPackDto) {
        this.questionPackDto = questionPackDto;
    }

    public int getTotalRunPoints() {
        return totalRunPoints;
    }

    public void setTotalRunPoints(int totalRunPoints) {
        this.totalRunPoints = totalRunPoints;
    }

    public int getCurrentQuestionPoints() {
        return currentQuestionPoints;
    }

    public void setCurrentQuestionPoints(int currentQuestionPoints) {
        this.currentQuestionPoints = currentQuestionPoints;
    }

    public boolean isUserAnswerIsCorrect() {
        return userAnswerIsCorrect;
    }

    public void setUserAnswerIsCorrect(boolean userAnswerIsCorrect) {
        this.userAnswerIsCorrect = userAnswerIsCorrect;
    }

    public boolean isRecordStateActive() {
        return recordStateActive;
    }

    public void setRecordStateActive(boolean recordStateActive) {
        this.recordStateActive = recordStateActive;
    }

    public int getCorrectAnswerId() {
        return correctAnswerId;
    }

    public void setCorrectAnswerId(int correctAnswerId) {
        this.correctAnswerId = correctAnswerId;
    }

    public int getTotalRounds() {
        return totalRounds;
    }

    public void setTotalRounds(int totalRounds) {
        this.totalRounds = totalRounds;
    }
}
