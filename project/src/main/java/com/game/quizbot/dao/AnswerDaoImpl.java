package com.game.quizbot.dao;

import com.game.quizbot.model.Answer;
import org.springframework.stereotype.Service;

@Service
public class AnswerDaoImpl implements AnswerDao {
    @Override
    public Iterable<Answer> getAllAnswersByQuestionId(int questionId) {
        return null;
    }

    @Override
    public Answer getCorrectAnswerByQuestionId(int questionId) {
        return null;
    }
}
