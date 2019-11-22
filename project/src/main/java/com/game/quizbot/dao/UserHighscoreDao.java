package com.game.quizbot.dao;

import com.game.quizbot.model.UserHighscore;
import com.game.quizbot.model.UserHighscorePK;

import java.util.ArrayList;

public interface UserHighscoreDao {
    public void insertNewUserHighscore(UserHighscorePK userHighscorePK, int highscore);
    public UserHighscore getUserHighscore(UserHighscorePK userHighscorePK);
    public boolean createUserHighscore(UserHighscorePK userHighscorePK);

    public  boolean userHighscoreExistsById(UserHighscorePK userHighscorePK);

    public ArrayList getLeaderboardByCategoryId(int categoryId);

    public ArrayList getLeaderboardByCategoryNameAll(String categoryName);

}
