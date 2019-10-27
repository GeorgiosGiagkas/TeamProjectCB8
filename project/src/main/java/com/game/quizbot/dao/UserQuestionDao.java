package com.game.quizbot.dao;

import com.game.quizbot.model.UserQuestion;

public interface UserQuestionDao {

    void insertUserQuestion(UserQuestion userQuestion);

    int getNumberOfCorrectResponses(Integer questionId, Integer userId);

    int getTotalNumberOfResponses(Integer questionId, Integer userId);
}
