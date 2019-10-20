package com.game.quizbot.dao;

import com.game.quizbot.model.UserQuestion;
import com.game.quizbot.repositories.UserQuestionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserQuestionImpl implements UserQuestionDao {


    @Autowired
    UserQuestionRepo userQuestionRepo;

    @Override
    public void insertUserQuestion(UserQuestion userQuestion) {
        userQuestionRepo.save(userQuestion);
    }
}
