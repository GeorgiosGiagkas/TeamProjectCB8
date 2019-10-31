package com.game.quizbot.dto;

public class AvatarDto {
    private Integer avatarId;
    private String avatarName;
    private int avatarCost;

    public Integer getAvatarId() {
        return avatarId;
    }

    public void setAvatarId(Integer avatarId) {
        this.avatarId = avatarId;
    }

    public String getAvatarName() {
        return avatarName;
    }

    public void setAvatarName(String avatarName) {
        this.avatarName = avatarName;
    }

    public int getAvatarCost() {
        return avatarCost;
    }

    public void setAvatarCost(int avatarCost) {
        this.avatarCost = avatarCost;
    }
}
