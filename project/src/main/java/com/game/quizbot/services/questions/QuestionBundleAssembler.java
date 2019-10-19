package com.game.quizbot.services.questions;

import com.game.quizbot.dao.AnswerDao;
import com.game.quizbot.dao.QuestionDao;
import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Category;
import com.game.quizbot.model.Question;
import com.game.quizbot.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Component
public class QuestionBundleAssembler {
    private int userId;
    private int categoryId;

    @Autowired
    QuestionDao questionDao;

    @Autowired
    AnswerDao answerDao;

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
            pack.setAnswers(answers);

            bundle.add(pack);
        }
        return  bundle;
    }


    private int[] getWeightedQuestionIds(){
        return questionDao.getWeightedQuestionIds(userId, categoryId);
    }


}
