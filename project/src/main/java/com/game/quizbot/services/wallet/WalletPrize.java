package com.game.quizbot.services.wallet;

public class WalletPrize {
    private int userId;
    private int totalRunPoints;
    private int wallet;


    public int calculateWalletPrize(){
        return  totalRunPoints;
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTotalRunPoints() {
        return totalRunPoints;
    }

    public void setTotalRunPoints(int totalRunPoints) {
        this.totalRunPoints = totalRunPoints;
    }


    public int getWallet() {
        return wallet;
    }

    public void setWallet(int wallet) {
        this.wallet = wallet;
    }
}
