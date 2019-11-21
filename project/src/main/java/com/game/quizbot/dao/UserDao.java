package com.game.quizbot.dao;

import com.game.quizbot.dto.UserDto;
import com.game.quizbot.model.User;


public interface UserDao {

    User getUserById(int userId);

    User getUserByNickname(String userNickname);

    User getUserByEmail(String userEmail);

    void insertUser(User user);

    Iterable<User> getAllUsers();

    void updateUser(User user);


}
