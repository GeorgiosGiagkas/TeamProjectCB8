package com.game.quizbot.dao;

import com.game.quizbot.dto.QuestionWeight;
import com.game.quizbot.model.Question;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface QuestionDao {

    public Question getQuestionById(int questionId);
    public List<Integer> getWeightedQuestionIds(int userId, int categoryId);
    public void insertQuestion(Question q);
    public Iterable<Question> getAllQuestions();
    public Iterable<Integer> getQuestionIdsByCategoryId(int categoryId);
    public void deleteQuestionById(int questionId);
    public List<QuestionWeight> getWeights(int userId, int categoryId);

}
