package com.game.quizbot.dto;

import java.util.Comparator;

public class PlayerHighscoreStatsDto{
    private Integer userId;
    private Integer highscore;

    public PlayerHighscoreStatsDto() {
    }

    public PlayerHighscoreStatsDto(Integer userId, Integer highscore) {
        this.userId = userId;
        this.highscore = highscore;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Integer getHighscore() {
        return highscore;
    }

    public void setHighscore(int highscore) {
        this.highscore = highscore;
    }


}
