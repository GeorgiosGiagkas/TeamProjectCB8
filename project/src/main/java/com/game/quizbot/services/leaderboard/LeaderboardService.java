package com.game.quizbot.services.leaderboard;


import com.game.quizbot.dao.UserHighscoreDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;


@Component
public class LeaderboardService {

    @Autowired
    UserHighscoreDao uhd;

    public ArrayList getLeaderboardByCategoryId(int categoryId){
        ArrayList leaderboardByCategoryId = uhd.getLeaderboardByCategoryId(categoryId);
        return leaderboardByCategoryId;
    }


}
