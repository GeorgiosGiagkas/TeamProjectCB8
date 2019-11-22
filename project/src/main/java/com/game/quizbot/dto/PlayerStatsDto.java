package com.game.quizbot.dto;


public class PlayerStatsDto {
    private int categoryId;
    private String category;
    private int score;
    private int position;

    public PlayerStatsDto() {
    }

    public PlayerStatsDto(int categoryId,String category, int score) {
        this.categoryId = categoryId;
        this.category = category;
        this.score = score;
    }

    public PlayerStatsDto(String category, int score, int position) {
        this.categoryId = categoryId;
        this.category = category;
        this.score = score;
        this.position = position;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
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

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }
}
