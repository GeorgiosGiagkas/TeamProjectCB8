package com.game.quizbot.dao;

import com.game.quizbot.model.Answer;

public interface AnswerDao {

    public Iterable<Answer> getAllAnswersByQuestionId(int questionId);
    public Answer getCorrectAnswerByQuestionId(int questionId);
    public void insertAnswer(Answer a);
}
