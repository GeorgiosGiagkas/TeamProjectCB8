package com.game.quizbot.repositories;

import com.game.quizbot.model.UserHighscore;
import com.game.quizbot.model.UserHighscorePK;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserHighscoreRepo extends CrudRepository<UserHighscore,UserHighscorePK> {



}
