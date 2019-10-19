package com.game.quizbot.dto;


import com.game.quizbot.model.Answer;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class QuestionPackDto {
    private Integer questionId;
    private String questionContent;
    private Iterable<AnswerDto> answersDto;


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

    public void setAnswersDtoFromAnswers(Iterable<Answer> answers) {
        List<AnswerDto> answersDto = new ArrayList<>();
        Iterator<Answer> i = answers.iterator();
        while (i.hasNext()){
            Answer answer = i.next();
            AnswerDto answerDto = new AnswerDto();
            answerDto.setAnswerId(answer.getAnswerId());
            answerDto.setAnswerContent(answer.getAnswerContent());
            answersDto.add(answerDto);
        }
        this.answersDto = answersDto;
    }

}
