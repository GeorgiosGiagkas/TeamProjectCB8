package com.game.quizbot.dao;

import com.game.quizbot.model.Question;

import javax.persistence.criteria.CriteriaBuilder;

public interface QuestionDao {

    public Question getQuestionById(int questionId);
    public int[] getWeightedQuestionIds(int userId, int categoryId);
    public void insertQuestion(Question q);
    public Iterable<Question> getAllQuestions();
    public Iterable<Integer> getQuestionIdsByCategoryId(int categoryId);

}
