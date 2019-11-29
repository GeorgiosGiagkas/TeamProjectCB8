package com.game.quizbot.dao;

import com.game.quizbot.dto.QuestionWeight;
import com.game.quizbot.model.Question;
import com.game.quizbot.repositories.QuestionRepo;
import com.game.quizbot.utils.CollectionUtils;
import com.game.quizbot.utils.StatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;

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
    public List<Integer> getWeightedQuestionIds(int userId, int categoryId) {
        Collection<Integer> questionIdsCollection = CollectionUtils.getCollectionFromIteralbe(getQuestionIdsByCategoryId(categoryId));
        LinkedList<Integer> questionIds = new LinkedList<>(questionIdsCollection);
        List<Integer> getWeightedQuestionsIdsList = new ArrayList<>();

        Iterator<Integer> questionIdsIter = questionIds.iterator();
        List<Integer> biasedPartition = new ArrayList<>();

        while(questionIdsIter.hasNext()){
            int questionId = questionIdsIter.next();
            int total = uqr.getTotalNumberOfResponses(questionId, userId);
            double weight = 0.5;

            if(total >= 5){
                int correct = uqr.getNumberOfCorrectResponses(questionId, userId);
                weight = StatUtils.calculateWeight(correct);
            }

            for(int j = 0; j < weight * 100; j++){
                biasedPartition.add(questionId);
            }
        }

        for(int i = 0; i < 10; i++){


            int selectedIndex = StatUtils.randomWithRange(0, biasedPartition.size());
            Integer selectedQuestionId = biasedPartition.get(selectedIndex);
            getWeightedQuestionsIdsList.add(selectedQuestionId);

            biasedPartition.removeAll(Collections.singleton(selectedQuestionId));
            questionIds.remove(selectedQuestionId);
        }


        return getWeightedQuestionsIdsList;
    }

    //TEST
    @Override
    public List<QuestionWeight> getWeights(int userId, int categoryId) {
        Collection<Integer> questionIdsCollection = CollectionUtils.getCollectionFromIteralbe(getQuestionIdsByCategoryId(categoryId));
        LinkedList<Integer> questionIds = new LinkedList<>(questionIdsCollection);


        Iterator<Integer> questionIdsIter = questionIds.iterator();
        List<QuestionWeight> weights = new ArrayList<>();

        while(questionIdsIter.hasNext()){
            QuestionWeight qw = new QuestionWeight();
            int questionId = questionIdsIter.next();
            Question q = getQuestionById(questionId);
            qw.setQuestionId(questionId);
            qw.setContent(q.getQuestionContent());
            int total = uqr.getTotalNumberOfResponses(questionId, userId);
            double weight = 0.5;

            if(total >= 5){
                int correct = uqr.getNumberOfCorrectResponses(questionId, userId);
                weight = StatUtils.calculateWeight(correct);
            }

            qw.setWeight(weight);

            weights.add(qw);

        }
        return weights;
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

    @Override
    public void deleteQuestionById(int questionId){
        Question q = qr.getQuestionById(questionId);
        qr.delete(q);
    }
}
