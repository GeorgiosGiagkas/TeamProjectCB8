package com.game.quizbot.dao;

import com.game.quizbot.model.Answer;
import com.game.quizbot.repositories.AnswerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class AnswerDaoImpl implements AnswerDao {

    @Autowired
    AnswerRepo ar;

    @Override
    public Iterable<Answer> getAllAnswersByQuestionId(int questionId) {
        Iterable<Answer> allAnswersByQuestionId = ar.getAllAnswersByQuestionId(questionId);
        return allAnswersByQuestionId;
    }

    @Override
    public Answer getCorrectAnswerByQuestionId(int questionId) {
        Answer correctAnswerByQuestionId = ar.getCorrectAnswerByQuestionId(questionId);
        return correctAnswerByQuestionId;
    }

    @Override
    public void insertAnswer(Answer a){
        ar.save(a);
    }
}
