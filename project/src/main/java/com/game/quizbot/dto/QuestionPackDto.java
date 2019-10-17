package com.game.quizbot.dto;

import com.game.quizbot.model.Answer;



public class QuestionPackDto {
    private Integer questionId;
    private String questionContent;
    private Iterable<Answer> answers;

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

    public Iterable<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Iterable<Answer> answers) {
        this.answers = answers;
    }
}
