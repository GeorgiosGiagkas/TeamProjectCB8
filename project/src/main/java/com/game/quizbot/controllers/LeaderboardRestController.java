package com.game.quizbot.controllers;


import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.model.UserHighscore;
import com.game.quizbot.services.leaderboard.LeaderboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@RestController
public class LeaderboardRestController {

@Autowired
LeaderboardService ls;
@Autowired
CategoryDao cd;

    @GetMapping(value = "/getLeaderboardByCategoryId/{categoryId}")
    public ArrayList<UserHighscore> returnLeaderboardByCategoryId(@PathVariable("categoryId") String categoryIdString, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        int categoryIdInt = Integer.parseInt(categoryIdString);
        ArrayList leaderboardByCategoryId = ls.getLeaderboardByCategoryId(categoryIdInt);
        return leaderboardByCategoryId;

    }

    @GetMapping(value = "/getLeaderboardByCategoryName/{categoryName}")
    public ArrayList<UserHighscore> returnLeaderboardByCategoryName(@PathVariable("categoryName") String categoryName, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        int categoryIdInt = cd.getCategoryIdByName(categoryName);
        ArrayList leaderboardByCategoryName = ls.getLeaderboardByCategoryId(categoryIdInt);
        return leaderboardByCategoryName;

    }

    @GetMapping(value = "/getPositionByCategoryName/{categoryName}")
    public int getPositionByCategoryName(@PathVariable("categoryName") String categoryName, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        ArrayList<UserHighscore> leaderboardByCategoryName = ls.getLeaderboardByCategoryNameAll(categoryName);
        String thisnickname = "user12";
        int position;
        for(int i = 0; i < leaderboardByCategoryName.size(); i++){
            if(leaderboardByCategoryName.get(i).getUser().getUserNickname().equals(thisnickname)){
                position = i + 1;
                return position;
            }
        }
        return -1;
    }



}
