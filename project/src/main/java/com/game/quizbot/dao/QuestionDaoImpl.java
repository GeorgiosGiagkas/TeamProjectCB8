package com.game.quizbot.dao;

import com.game.quizbot.model.Question;
import com.game.quizbot.repositories.QuestionRepo;
import com.game.quizbot.utils.StatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

@Service
@Transactional
public class QuestionDaoImpl implements QuestionDao {

    @Autowired
    QuestionRepo qr;

    @Autowired
    UserQuestionDao uqr;

    @Override
    public Question getQuestionById(int questionId) {
        Question questionById = qr.getQuestionById(questionId);

        return questionById;
    }

    @Override
    public int[] getWeightedQuestionIds(int userId, int categoryId) {
        Iterable<Integer> questionIds;
        questionIds = getQuestionIdsByCategoryId(categoryId);

        Iterator<Integer> questionIdsIter = questionIds.iterator();
        List<Integer> biasedPartition = new ArrayList<>();
        List<Integer> getWeightedQuestionsIdsList = new ArrayList<>();

        while(questionIdsIter.hasNext()){
            int questionId = questionIdsIter.next();
            int total = uqr.getTotalNumberOfResponses(questionId, userId);
            double weight = 0.5;

            if(total >= 5){
                int correct = uqr.getNumberOfCorrectResponses(questionId, userId);
                weight = StatUtils.calculateWeight(correct);
            }

            for(int i = 0; i < weight * 100; i++){
                biasedPartition.add(questionId);
            }
        }

        for(int i = 0; i < 10; i++){
            int selectedIndex = StatUtils.randomWithRange(0, biasedPartition.size());
            int selectedQuestionId = ((LinkedList<Integer>) questionIds).get(selectedIndex);
            getWeightedQuestionsIdsList.add(selectedQuestionId);
            //To be continued

        }


        int [] getWeightedQuestionIdsArray =  {1,2,3,4,5,6,7,8,9,10};
        return getWeightedQuestionIdsArray;
        // NEEDS IMPLEMETATION
    }

    @Override
    public void insertQuestion(Question q){
        qr.save(q);
    }

    @Override
    public Iterable<Question> getAllQuestions(){
        Iterable<Question> questions = qr.findAll();
        return questions;
    }

    @Override
    public Iterable<Integer> getQuestionIdsByCategoryId(int categoryId){
        return qr.getQuestionIdsByCategoryId(categoryId);
    }
}
