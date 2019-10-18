package com.game.quizbot.dao;

import com.game.quizbot.model.User;
import com.game.quizbot.repositories.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDaoImpl implements UserDao {

    @Autowired
    UserRepo ur;


    @Override
    public User getUserById(int userId) {
        User userById = ur.getUserById(userId);
        return userById;

    }
}
