package com.game.quizbot.services.questions;

import com.game.quizbot.dao.*;
import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Question;

import com.game.quizbot.utils.BeanUtil;

import java.util.ArrayList;
import java.util.List;




public class QuestionBundleAssembler {
    private int userId;
    private int categoryId;



    QuestionDao questionDao =BeanUtil.getBean(QuestionDaoImpl.class);;


    AnswerDao answerDao =BeanUtil.getBean(AnswerDaoImpl.class);;

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
        List<QuestionPackDto> bundle = new ArrayList<>();

        for(int id : getWeightedQuestionIds()){
            Question question = questionDao.getQuestionById(id);
            Iterable<Answer> answers= answerDao.getAllAnswersByQuestionId(id);

            QuestionPackDto pack = new QuestionPackDto();
            pack.setQuestionId(question.getQuestionId());
            pack.setQuestionContent(question.getQuestionContent());
            pack.setAnswersDtoFromAnswers(answers);

            bundle.add(pack);
        }
        return  bundle;
    }


    private List<Integer> getWeightedQuestionIds(){
        return questionDao.getWeightedQuestionIds(userId, categoryId);

    }


}
