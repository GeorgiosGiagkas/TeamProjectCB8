package com.game.quizbot.services.shop;

import com.game.quizbot.dao.AvatarDao;
import com.game.quizbot.dto.ShopDto;
import com.game.quizbot.model.Avatar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ShopService {

    @Autowired
    AvatarDao ad;


    @Autowired
    ShopDto sd;


    public ShopDto getShopDtoByUserId(int userId, Pageable pageable) {
        int pageNumber = pageable.getPageNumber();
        Iterable<Avatar> allAvatars = ad.gelAllAvatarsByPageNo(pageNumber, pageable);

        // Repacking allAvatars with only the elements needed by the shop page
        ArrayList<Avatar> avatarPack = new ArrayList<Avatar>();
        for (Avatar avatar : allAvatars) {

            int avatarId = avatar.getAvatarId();
            String avatarName = avatar.getAvatarName();
            int avatarCost = avatar.getAvatarCost();

            Avatar avatarPackItem = new Avatar();
            avatarPackItem.setAvatarId(avatarId);
            avatarPackItem.setAvatarName(avatarName);
            avatarPackItem.setAvatarCost(avatarCost);

            avatarPack.add(avatarPackItem);

        }

        Iterable<Integer> allOwnedAvatarsByUserId = ad.getAllOwnedAvatarsByUserId(userId);


        sd.setAllAvatars(avatarPack);
        sd.setAllOwnedAvatars(allOwnedAvatarsByUserId);
        return sd;


    }

}