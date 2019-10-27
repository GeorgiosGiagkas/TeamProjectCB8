package com.game.quizbot.services.game;

import com.game.quizbot.dao.*;
import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Question;
import com.game.quizbot.model.User;
import com.game.quizbot.model.UserQuestion;
import com.game.quizbot.utils.BeanUtil;


import java.time.LocalDateTime;



public class RecordUserAnswer implements GameObserver {

    private int questionId;
    private int answerId;
    private int userId;
    private boolean userAnswerIsCorrect;
    private GameStateSubject gameStateSubject;

    AnswerDao answerDao=BeanUtil.getBean(AnswerDaoImpl.class);;
    QuestionDao questionDao=BeanUtil.getBean(QuestionDaoImpl.class);;
    UserDao userDao=BeanUtil.getBean(UserDaoImpl.class);;
    UserQuestionDao userQuestionDao = BeanUtil.getBean(UserQuestionImpl.class);


    @Override
    public  void update() {
        this.questionId= gameStateSubject.getQuestionPackDto().getQuestionId();
        this.userId = gameStateSubject.getUserId();
        this.answerId = gameStateSubject.getAnswerId();
        if(gameStateSubject.isRecordStateActive()){
            insertUserQuestionOutcome();
        }

    }

    public void setUserAnswerIsCorrect(){
        Answer answer =answerDao.getCorrectAnswerByQuestionId(this.questionId);

        gameStateSubject.setCorrectAnswerId(answer.getAnswerId());

        System.out.println(this.answerId +" "+answer.getAnswerId());
        if(this.answerId==answer.getAnswerId()) {
            userAnswerIsCorrect = true;
        }
        else{
            userAnswerIsCorrect=false;
        }
        gameStateSubject.setUserAnswerIsCorrect(userAnswerIsCorrect);
    }


    public  void insertUserQuestionOutcome(){

        setUserAnswerIsCorrect();

        Question question = questionDao.getQuestionById(this.questionId);
        User user =  userDao.getUserById(this.userId);

        UserQuestion userQuestion = new UserQuestion();
        userQuestion.setUserQuestionSuccess(this.userAnswerIsCorrect);

        userQuestion.setQuestionId(question);
        userQuestion.setUserId(user);
        LocalDateTime localDateTime = LocalDateTime.now();
        userQuestion.setUserQuestionTimespamp(localDateTime);
        userQuestionDao.insertUserQuestion(userQuestion);

    }


    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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
