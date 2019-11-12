package com.game.quizbot.dto;

import com.game.quizbot.model.Avatar;
import org.springframework.stereotype.Component;

import java.util.ArrayList;


@Component
public class ShopDto {


    private Iterable<Avatar> allAvatars = new ArrayList<>();

    private Iterable<Integer> allOwnedAvatars = new ArrayList<>();

    private int userWallet = 0;

    public Iterable<Avatar> getAllAvatars() {
        return allAvatars;
    }

    public void setAllAvatars(Iterable<Avatar> allAvatars) {
        this.allAvatars = allAvatars;
    }

    public Iterable<Integer> getAllOwnedAvatars() {
        return allOwnedAvatars;
    }

    public void setAllOwnedAvatars(Iterable<Integer> allOwnedAvatars) {
        this.allOwnedAvatars = allOwnedAvatars;
    }

    public int getUserWallet() {
        return userWallet;
    }

    public void setUserWallet(int userWallet) {
        this.userWallet = userWallet;
    }
}
