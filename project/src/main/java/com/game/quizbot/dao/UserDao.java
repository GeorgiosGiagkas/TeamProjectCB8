package com.game.quizbot.dao;

import com.game.quizbot.model.User;

public interface UserDao {

    public User getUserById(int userId);

    public User getUserByNickname(String userNickname);

    public User getUserByEmail(String userEmail);

    public void insertUser(User user);

    public boolean checkUserByPassword(User user);
}
