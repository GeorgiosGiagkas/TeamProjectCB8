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

    @Override
    public User getUserByNickname(String userNickname) {
        User userByNickname = ur.getUserByNickname(userNickname);
        return userByNickname;
    }

    @Override
    public User getUserByEmail(String userEmail) {
        User userByEmail = ur.getUserByEmail(userEmail);
        return userByEmail;
    }

    @Override
    public void insertUser(User user) {
        ur.save(user);
    }
}
