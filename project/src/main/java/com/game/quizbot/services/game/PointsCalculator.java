package com.game.quizbot.services.game;

import com.game.quizbot.dao.*;
import com.game.quizbot.model.*;
import com.game.quizbot.utils.BeanUtil;



public class PointsCalculator implements GameObserver {

    private int userId;
    private int categoryId;
    private int totalRunPoints;
    private int currentQuestionPoints;
    private int time;
    private int highscore;
    private boolean userAnswerIsCorrect;
    private GameStateSubject gameStateSubject;
    UserHighscoreDao userHighscoreDao= BeanUtil.getBean(UserHighscoreDaoImpl.class);


    @Override
    public  void update() {

        this.userId = gameStateSubject.getUserId();
        this.categoryId= gameStateSubject.getCategoryId();
        this.totalRunPoints = gameStateSubject.getTotalRunPoints();
        this.currentQuestionPoints = gameStateSubject.getCurrentQuestionPoints();
        this.time = gameStateSubject.getTime();
        this.userAnswerIsCorrect=gameStateSubject.isUserAnswerIsCorrect();

        UserHighscorePK userHighscorePK = new UserHighscorePK(this.userId,this.categoryId);

        if(!userHighscoreDao.userHighscoreExistsById(userHighscorePK)){
            userHighscoreDao.createUserHighscore(userHighscorePK);
        }

        gameStateSubject.setHighscore(getHighscore(userHighscorePK));
        this.highscore =gameStateSubject.getHighscore();

        if(gameStateSubject.isRecordStateActive()){
            calculate();
        }

    }

    public int getHighscore(UserHighscorePK userHighscorePK){
        if(userHighscoreDao.userHighscoreExistsById(userHighscorePK)){
            return userHighscoreDao.getUserHighscore(userHighscorePK).getHighscore();
        }
         return  0;
    }

    public void calculate(){

        if(userAnswerIsCorrect){
            int resultPoints = this.time*this.currentQuestionPoints;
            int sum = this.totalRunPoints +resultPoints ;
            gameStateSubject.setTotalRunPoints(sum);
            if(sum > this.highscore){
                UserHighscorePK userHighscorePK = new UserHighscorePK(this.userId,this.categoryId);
                userHighscoreDao.insertNewUserHighscore(userHighscorePK,sum);

                gameStateSubject.setHighscore(sum);
            }
        }
    }


    @Override
    public GameStateSubject getGameStateSubject() {
        return gameStateSubject;
    }

    @Override
    public void setGameStateSubject(GameStateSubject gameStateSubject) {
        this.gameStateSubject = gameStateSubject;
    }
}
