package com.game.quizbot.dao;

import com.game.quizbot.model.User;

public interface UserDao {

    public User getUserById(int userId);
}