package com.game.quizbot.repositories;

import com.game.quizbot.model.UserQuestion;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserQuestionRepo extends CrudRepository<UserQuestion,Integer> {

}
