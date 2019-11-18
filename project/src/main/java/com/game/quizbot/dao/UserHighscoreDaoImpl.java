package com.game.quizbot.dao;

import com.game.quizbot.model.UserHighscore;
import com.game.quizbot.model.UserHighscorePK;
import com.game.quizbot.repositories.UserHighscoreRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UserHighscoreDaoImpl implements UserHighscoreDao {

    @Autowired
    UserHighscoreRepo userHighscoreRepo;

    @Override
    public void insertNewUserHighscore(UserHighscorePK userHighscorePK, int highscore) {


        if(userHighscoreRepo.existsById(userHighscorePK)){
            UserHighscore userHighscore= userHighscoreRepo.findById(userHighscorePK).get();
            userHighscore.setHighscore(highscore);
            userHighscoreRepo.save(userHighscore);
        }
    }

    @Override
    public UserHighscore getUserHighscore(UserHighscorePK userHighscorePK) {
        return  userHighscoreRepo.findById(userHighscorePK).get();
    }

    @Override
    public boolean createUserHighscore(UserHighscorePK userHighscorePK) {
        UserHighscore userHighscore = null;
        if(!userHighscoreRepo.findById(userHighscorePK).isPresent()){
            userHighscore = new UserHighscore(userHighscorePK);
            userHighscore.setHighscore(0);
            userHighscoreRepo.save(userHighscore);
            return  true;
        }
        return false;

    }

    @Override
    public boolean userHighscoreExistsById(UserHighscorePK userHighscorePK) {
        return userHighscoreRepo.existsById(userHighscorePK);
    }


    public ArrayList getLeaderboardByCategoryId(int categoryId){
        ArrayList leaderboardByCategoryid = userHighscoreRepo.getLeaderboardByCategoryId(categoryId);
        return leaderboardByCategoryid;
    }

    public ArrayList getLeaderboardByCategoryNameAll(String categoryName){
        ArrayList leaderdboardByCategoryName = userHighscoreRepo.getLeaderboardByCategoryNameAll(categoryName);
        return leaderdboardByCategoryName;
    }

}
