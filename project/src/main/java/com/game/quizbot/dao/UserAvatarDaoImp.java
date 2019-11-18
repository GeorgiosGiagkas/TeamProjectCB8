package com.game.quizbot.dao;

import com.game.quizbot.model.UserAvatar;
import com.game.quizbot.repositories.UserAvatarRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service

public class UserAvatarDaoImp implements UserAvatarDao{

    @Autowired
    UserAvatarRepo userAvatarRepo;


    @Override
    public UserAvatar saveUserAvatar(UserAvatar userAvatar) {
        return userAvatarRepo.save(userAvatar);
    }


}
