package com.game.quizbot.dao;

import com.game.quizbot.model.Question;
import com.game.quizbot.repositories.QuestionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionDaoImpl implements QuestionDao {

    @Autowired
    QuestionRepo qr;

    @Override
    public Question getQuestionById(int questionId) {
        Question questionById = qr.getQuestionById(questionId);

        return questionById;
    }

    @Override
    public int[] getWeightedQuestionIds(int userId, int categoryId) {
        int [] getWeightedQuestionIdsArray =  {1,2,3,4,5,6,7,8,9,10};
        return getWeightedQuestionIdsArray;
        // NEEDS IMPLEMETATION
    }
}
