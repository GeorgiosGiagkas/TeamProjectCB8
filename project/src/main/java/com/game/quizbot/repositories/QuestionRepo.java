package com.game.quizbot.repositories;


import com.game.quizbot.model.Question;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionRepo extends CrudRepository<Question,Integer> {

    @Query("SELECT q from Question q WHERE q.questionId=?1")
    Question getQuestionById(int questionId);

    @Query("SELECT q.questionId from Question q WHERE q.categoryId.categoryId = ?1")
    Iterable<Integer> getQuestionIdsByCategoryId(int categoryId);



}
