package com.game.quizbot.services.questions;

import com.game.quizbot.dao.AnswerDao;
import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.dao.QuestionDao;
import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Category;

import java.util.ArrayList;
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
}
