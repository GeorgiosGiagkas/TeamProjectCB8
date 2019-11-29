package com.game.quizbot.services.questions;

import com.game.quizbot.dao.AnswerDao;
import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.dao.QuestionDao;
import com.game.quizbot.dto.CategoryDto;
import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Category;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


import com.game.quizbot.model.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class QuestionService {

    @Autowired
    QuestionDao qd;

    @Autowired
    CategoryDao cd;

    @Autowired
    AnswerDao ad;

    public void createQuestion(Question q, List<String> answers, int correctAnswer, String categoryName){

        Iterable<Category> categories;
        categories = cd.getCategoriesByName(categoryName);
        Category categoryId = ((ArrayList<Category>) categories).get(0);

        q.setCategoryId(categoryId);

        qd.insertQuestion(q);

        for(int i = 0; i < answers.size(); i++){
            Answer answer = new Answer();
            answer.setAnswerContent(answers.get(i));
            answer.setQuestionId(q);
            answer.setAnswerCorrect(false);
            int answerNo = i + 1;
            if(correctAnswer == answerNo)
                answer.setAnswerCorrect(true);
            ad.insertAnswer(answer);
        }
    }

    public void updateQuestion(Question q, List<Integer> answerIds, List<String> answers, int correctAnswer, String categoryName){

        Iterable<Category> categories;
        categories = cd.getCategoriesByName(categoryName);
        Category categoryId = ((ArrayList<Category>) categories).get(0);

        q.setCategoryId(categoryId);

        qd.insertQuestion(q);

        for(int i = 0; i < answers.size(); i++){
            Answer answer = new Answer();
            answer.setAnswerId(answerIds.get(i));
            answer.setAnswerContent(answers.get(i));
            answer.setQuestionId(q);
            answer.setAnswerCorrect(false);
            int answerNo = i + 1;
            if(correctAnswer == answerNo)
                answer.setAnswerCorrect(true);
            ad.insertAnswer(answer);
        }
    }

    public List<QuestionPackDto> getAllQuestions(){
        List<QuestionPackDto> questionsDto = new ArrayList<>();
        Iterator<Question> questions = qd.getAllQuestions().iterator();
        while (questions.hasNext()){
            Question q = questions.next();
            QuestionPackDto questionPackDto = new QuestionPackDto();
            questionPackDto.setQuestionId(q.getQuestionId());
            questionPackDto.setQuestionContent(q.getQuestionContent());
            questionPackDto.setCategoryName(cd.getCategoryNameById(q.getCategoryId().getCategoryId()));
            questionPackDto.setAnswersDtoFromAnswers(q.getAnswerCollection());
            questionsDto.add(questionPackDto);
        }
        return questionsDto;
    }

    public QuestionPackDto getQuestionPackDtoById(int id){
        Question q = qd.getQuestionById(id);
        QuestionPackDto questionPackDto = new QuestionPackDto();
        questionPackDto.setQuestionId(q.getQuestionId());
        questionPackDto.setQuestionContent(q.getQuestionContent());
        questionPackDto.setCategoryName(cd.getCategoryNameById(q.getCategoryId().getCategoryId()));
        questionPackDto.setAnswersDtoFromAnswers(q.getAnswerCollection());

        return questionPackDto;
    }




}
