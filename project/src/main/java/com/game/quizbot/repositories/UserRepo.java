package com.game.quizbot.repositories;

import com.game.quizbot.model.Category;
import com.game.quizbot.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends CrudRepository <User,Integer> {

    @Query("SELECT u FROM User u WHERE u.userId=?1")
    User getUserById(int userId);

    @Query("SELECT u FROM User u WHERE u.userNickname=?1")
    User getUserByNickname(String userNickname);

    @Query("SELECT u FROM User u WHERE u.userEmail=?1")
    User getUserByEmail(String userEmail);

}
