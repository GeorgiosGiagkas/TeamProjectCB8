package com.game.quizbot.dto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import java.util.List;

@Component
public class QuestionPacksCreator {

    @Autowired
    EntityManager entityManager;

    public List<QuestionPackDto> getQuestions(List<Integer> questionIds){
        List<QuestionPackDto> questions = entityManager.createQuery("select new com.game.quizbot.dto.QuestionPackDto(" +
                " q.questionId, q.questionContent, q.categoryId.categoryName) from Question q where q.questionId in :questionIds").setParameter("questionIds",questionIds).getResultList();
        return questions;
    }


    public List<AnswerDto> getAnswersBasedOnQuestionId(List<Integer> questionIds){
        List<AnswerDto> answers = entityManager.createQuery("select new com.game.quizbot.dto.AnswerDto(" +
                " a.answerId,a.answerContent,a.questionId.questionId,a.answerCorrect) from Answer a where a.questionId.questionId in :questionIds").setParameter("questionIds",questionIds).getResultList();
        return  answers;
    }



}
