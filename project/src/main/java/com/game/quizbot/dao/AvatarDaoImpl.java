package com.game.quizbot.dao;

import com.game.quizbot.model.Avatar;
import com.game.quizbot.repositories.AvatarRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AvatarDaoImpl implements AvatarDao{

    @Autowired
    AvatarRepo avatarRepo;

    @Override
    public Avatar getAvatarByAvatarName(String avatarName) {
        Avatar avatarByAvatarName = avatarRepo.getAvatarByAvatarName(avatarName);
        return avatarByAvatarName;
    }
}
