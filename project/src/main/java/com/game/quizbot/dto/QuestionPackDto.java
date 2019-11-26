package com.game.quizbot.dto;


import com.game.quizbot.model.Answer;
import com.game.quizbot.model.Category;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class QuestionPackDto {
    private Integer questionId;
    private String questionContent;
    private String categoryName;
    private Iterable<AnswerDto> answersDto;

    public QuestionPackDto() {
    }

    public QuestionPackDto(Integer questionId, String questionContent, String categoryName) {
        this.questionId = questionId;
        this.questionContent = questionContent;
        this.categoryName = categoryName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }


    public Iterable<AnswerDto> getAnswersDto() {
        return answersDto;
    }

    public void setAnswersDto(Iterable<AnswerDto> answersDto) {
        this.answersDto = answersDto;
    }


    public void addAnswer(AnswerDto answerDto){
        List<AnswerDto> answers = new ArrayList<>();
        Iterator<AnswerDto> itr = this.answersDto.iterator();
        while (itr.hasNext()){
            answers.add(itr.next());
        }
        answers.add(answerDto);
        this.answersDto=answers;

    }

    public void setAnswersDtoFromAnswers(Iterable<Answer> answers) {
        List<AnswerDto> answersDto = new ArrayList<>();
        Iterator<Answer> i = answers.iterator();
        while (i.hasNext()){
            Answer answer = i.next();
            AnswerDto answerDto = new AnswerDto();
            answerDto.setAnswerId(answer.getAnswerId());
            answerDto.setAnswerContent(answer.getAnswerContent());
            answerDto.setAnswerCorrect(answer.getAnswerCorrect());
            answersDto.add(answerDto);
        }


        this.answersDto = answersDto;
    }

}
