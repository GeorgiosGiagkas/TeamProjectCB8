package com.game.quizbot.dao;

import com.game.quizbot.model.UserHighscore;
import com.game.quizbot.model.UserHighscorePK;

public interface UserHighscoreDao {
    public void insertNewUserHighscore(UserHighscorePK userHighscorePK, int highscore);
    public UserHighscore getUserHighscore(UserHighscorePK userHighscorePK);
    public boolean createUserHighscore(UserHighscorePK userHighscorePK);
}
