package com.game.quizbot.dto;


public class PlayerStatsDto {

    private String category;
    private int score;

    public PlayerStatsDto() {
    }

    public PlayerStatsDto(String category, int score) {

        this.category = category;
        this.score = score;
    }


    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }


}
