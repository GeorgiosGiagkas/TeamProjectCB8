package com.game.quizbot.dao;

import com.game.quizbot.model.Question;

public interface QuestionDao {

    public Question getQuestionById(int questionId);
    public int[] getWeightedQuestionIds(int userId, int categoryId);

}
