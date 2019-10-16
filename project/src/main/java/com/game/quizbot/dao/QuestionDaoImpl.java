package com.game.quizbot.dao;

import com.game.quizbot.model.Question;
import org.springframework.stereotype.Service;

@Service
public class QuestionDaoImpl implements QuestionDao {
    @Override
    public Question getQuestionById(int questionId) {
        return null;
    }

    @Override
    public int[] getWeightedQuestionIds(int userId, int categoryId) {
        return new int[0];
    }
}
