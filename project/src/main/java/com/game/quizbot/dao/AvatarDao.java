package com.game.quizbot.dao;

import com.game.quizbot.model.Avatar;

public interface AvatarDao {

    Avatar getAvatarByAvatarName(String avatarName);
    Avatar saveAvatar(Avatar a);
    Iterable<Avatar> getAllAvatars();
    Avatar getAvatarById(int id);


}
