package com.game.quizbot.services.shop;

import com.game.quizbot.dao.AvatarDao;
import com.game.quizbot.dao.UserAvatarDao;
import com.game.quizbot.dao.UserDao;
import com.game.quizbot.dto.ShopDto;
import com.game.quizbot.model.Avatar;
import com.game.quizbot.model.User;
import com.game.quizbot.model.UserAvatar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Component
public class ShopService {

    @Autowired
    AvatarDao ad;

    @Autowired
    UserDao ud;


    @Autowired
    ShopDto sd;

    @Autowired
    UserAvatarDao uad;


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

    @Transactional
    public boolean shopTranscaction(int userId, int avatarId, int wallet){

        // get Avatar and Avatar cost

        Avatar avatar = new Avatar();
        avatar = ad.getAvatarById(avatarId);
        int avatarCost = avatar.getAvatarCost();

        // check if user has enough gold

        if (avatarCost>wallet){
            return false;
        }

        // add avatar to user's avatar collection

            // get User
        User user = new User();
        user = ud.getUserById(userId);

            // create new UserAvatar entry
        UserAvatar userAvatar = new UserAvatar();
        userAvatar.setUserId(user);
        userAvatar.setAvatarId(avatar);
        uad.saveUserAvatar(userAvatar);

        // remove cost from User's wallet
            int newWallet = wallet-avatarCost;

        // update user's wallet in database
            user.setWallet(newWallet);

        return true;
        // change return
    }


}