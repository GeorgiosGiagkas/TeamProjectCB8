package com.game.quizbot.repositories;

import com.game.quizbot.model.UserQuestion;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserQuestionRepo extends CrudRepository<UserQuestion,Integer> {


    @Query(value = "select sum(user_question_success) as num_of_correct_resp from\n" +
            "(select user_question_success from user_question\n" +
            "where question_id =  ?1 and user_id = ?2\n" +
            "order by user_question_timespamp desc\n" +
            "limit 5) as total_responses;", nativeQuery = true)
    int getNumberOfCorrectResponses(Integer questionId, Integer userId);

    @Query(value = "select count(user_question_success) as num_of_total_resp from\n" +
            "(select user_question_success from user_question\n" +
            "where question_id = ?1 and user_id = ?2\n" +
            "order by user_question_timespamp desc\n" +
            "limit 5) as total_responses;", nativeQuery = true)
    int getTotalNumberOfResponses(Integer questionId, Integer userId);

}
