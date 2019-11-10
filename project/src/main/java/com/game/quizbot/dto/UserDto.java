package com.game.quizbot.dto;

public class UserDto {

    private Integer userId;
    private String userNickname;
    private String userPassword;
    private String userEmail;
    private int wallet;
    private Integer roleId;
    private Integer selectedAvatarId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public int getWallet() {
        return wallet;
    }

    public void setWallet(int wallet) {
        this.wallet = wallet;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getSelectedAvatarId() {
        return selectedAvatarId;
    }

    public void setSelectedAvatarId(Integer selectedAvatarId) {
        this.selectedAvatarId = selectedAvatarId;
    }
}
