package com.game.quizbot.repositories;

import com.game.quizbot.model.Answer;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AnswerRepo extends CrudRepository<Answer,Integer> {

    @Query("SELECT a FROM Answer a WHERE a.questionId=?1")
    Iterable<Answer> getAllAnswersByQuestionId(int questionId);

    @Query("SELECT a FROM Answer a WHERE a.questionId=?1 AND a.answerCorrect=1")
    Answer getCorrectAnswerByQuestionId(int questionId);

}
