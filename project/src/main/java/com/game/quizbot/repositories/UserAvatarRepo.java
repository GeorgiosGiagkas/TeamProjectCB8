package com.game.quizbot.repositories;

import com.game.quizbot.model.Question;
import com.game.quizbot.model.UserAvatar;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAvatarRepo extends CrudRepository<UserAvatar,Integer> {


}
