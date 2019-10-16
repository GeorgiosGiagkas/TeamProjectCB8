package com.game.quizbot.services.questions;

import com.game.quizbot.dto.AnswerDto;
import com.game.quizbot.model.Answer;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class QuestionPack {
    private Integer questionId;
    private String questionContent;
    private List<AnswerDto> answersDto;

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

    public List<AnswerDto> getAnswersDto() {
        return answersDto;
    }

    public void setAnswersDto(List<AnswerDto> answersDto) {
        this.answersDto = answersDto;
    }

    public void setAnswersDto(Iterable<Answer> answers) {
        Iterator<Answer> i= answers.iterator();
        while(i.hasNext()){
            List<AnswerDto> answersDto = new ArrayList<>();
            AnswerDto answerDto = new AnswerDto();
            Answer a = i.next();
            answerDto.setAnswerId(a.getAnswerId());
            answerDto.setAnswerContent(a.getAnswerContent());
        }
        this.answersDto = answersDto;
    }
}
