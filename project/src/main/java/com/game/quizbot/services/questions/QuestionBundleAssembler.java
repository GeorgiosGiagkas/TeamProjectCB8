package com.game.quizbot.services.questions;

import com.game.quizbot.dao.*;
import com.game.quizbot.dto.AnswerDto;
import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.dto.QuestionPacksCreator;
import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Question;

import com.game.quizbot.utils.BeanUtil;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;


public class QuestionBundleAssembler {
    private int userId;
    private int categoryId;



    QuestionDao questionDao =BeanUtil.getBean(QuestionDaoImpl.class);;
    QuestionPacksCreator questionPacksCreator = BeanUtil.getBean(QuestionPacksCreator.class);
    

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }


    public List<QuestionPackDto> getWeightedQuestionBundle(){

        List<Integer> ids = getWeightedQuestionIds();

        List<QuestionPackDto> bundle = questionPacksCreator.getQuestions(ids);
        List<AnswerDto> answers = questionPacksCreator.getAnswersBasedOnQuestionId(ids);
        bundle.forEach((q)->{
            List<AnswerDto> answerList = answers.stream().filter((a)->a.getQuestionId().equals(q.getQuestionId())).collect(Collectors.toList());
            q.setAnswersDto(answerList);
        });

        return bundle;
    }




    private List<Integer> getWeightedQuestionIds(){
        List<Integer> ids = questionDao.getWeightedQuestionIds(userId, categoryId);
        return ids;

    }


}
