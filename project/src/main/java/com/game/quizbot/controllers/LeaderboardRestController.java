package com.game.quizbot.controllers;


import com.game.quizbot.model.UserHighscore;
import com.game.quizbot.services.leaderboard.LeaderboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class LeaderboardRestController {

@Autowired
LeaderboardService ls;

    @GetMapping(value = "/getLeaderboardByCategoryId/{categoryId}")
    public ArrayList<UserHighscore> returnLeaderboardByCategoryId(@PathVariable("categoryId") String categoryIdString){
        int categoryIdInt = Integer.parseInt(categoryIdString);
        ArrayList leaderboardByCategoryId = ls.getLeaderboardByCategoryId(categoryIdInt);
        return leaderboardByCategoryId;

    }



}
