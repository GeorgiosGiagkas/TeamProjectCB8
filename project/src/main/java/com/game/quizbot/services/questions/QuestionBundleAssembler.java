package com.game.quizbot.services.questions;

import com.game.quizbot.dao.AnswerDao;
import com.game.quizbot.dao.QuestionDao;
import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Category;
import com.game.quizbot.model.Question;
import com.game.quizbot.model.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;


public class QuestionBundleAssembler {
    private User user;
    private Category category;

    @Autowired
    QuestionDao questionDao;

    @Autowired
    AnswerDao answerDao;

    public QuestionBundleAssembler(User user,Category category) {
        this.user = user;
        this.category = category;
    }


    public Set<QuestionPack>  getWeightedQuestionBundle(){
        Set<QuestionPack> bundle = new HashSet<>();

        for(int id : getWeightedQuestionIds()){
            Question question = questionDao.getQuestionById(id);
            Iterable<Answer> answers= answerDao.getAllAnswersByQuestionId(id);

            QuestionPack pack = new QuestionPack();
            pack.setQuestionId(question.getQuestionId());
            pack.setQuestionContent(question.getQuestionContent());
            pack.setAnswersDto(answers);

            bundle.add(pack);
        }
        return  bundle;
    }


    private int[] getWeightedQuestionIds(){
        return questionDao.getWeightedQuestionIds(user.getUserId(), category.getCategoryId());
    }


}
