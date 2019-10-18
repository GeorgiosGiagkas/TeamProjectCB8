package com.game.quizbot.repositories;


import com.game.quizbot.model.Question;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionRepo extends CrudRepository<Question,Integer> {

    @Query("SELECT q from QUESTION q WHERE questionId=?1")
    Question getQuestionById(int questionId);




}
