package com.game.quizbot.dao;

import com.game.quizbot.model.Avatar;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AvatarDao {

    Avatar getAvatarByAvatarName(String avatarName);
    Avatar saveAvatar(Avatar a);
    Iterable<Avatar> getAllAvatars();
    Avatar getAvatarById(int id);
    Iterable<Integer> getAllOwnedAvatarsByUserId(int id);
    Page<Avatar> gelAllAvatarsByPageNo(int pageNo, Pageable pageable);
    int getAvatarCount();
}
