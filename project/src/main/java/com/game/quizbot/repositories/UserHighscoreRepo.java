package com.game.quizbot.repositories;

import com.game.quizbot.model.UserHighscore;
import com.game.quizbot.model.UserHighscorePK;

import org.springframework.data.domain.Pageable;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface UserHighscoreRepo extends CrudRepository<UserHighscore,UserHighscorePK> {



    @Query(value = "SELECT u.user_nickname, uh.highscore FROM user_highscore uh, user u WHERE category_id = ?1 and u.user_id = uh.user_id order by highscore DESC LIMIT 10;", nativeQuery = true)
    ArrayList getLeaderboardByCategoryId(int categoryId);

    @Query(value = "SELECT u.user_nickname, uh.highscore FROM user_highscore uh, user u WHERE category_name = ?1 and u.user_id = uh.user_id order by highscore DESC;", nativeQuery = true)
    ArrayList getLeaderboardByCategoryNameAll(String categoryName);


    }



