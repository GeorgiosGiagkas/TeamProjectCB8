package com.game.quizbot.repositories;

import com.game.quizbot.model.Avatar;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AvatarRepo extends CrudRepository<Avatar,Integer> {

    @Query("SELECT a from Avatar a WHERE a.avatarName=?1")
    Avatar getAvatarByAvatarName(String avatarName);
}
