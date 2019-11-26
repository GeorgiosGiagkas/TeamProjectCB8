package com.game.quizbot.dto;

public class AnswerDto {
    private Integer answerId;
    private String answerContent;
    private Integer questionId;
    private boolean answerCorrect;

    public AnswerDto() {
    }

    public AnswerDto(Integer answerId, String answerContent, Integer questionId, boolean answerCorrect) {
        this.answerId = answerId;
        this.answerContent = answerContent;
        this.questionId = questionId;
        this.answerCorrect = answerCorrect;
    }

    public Integer getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Integer answerId) {
        this.answerId = answerId;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public boolean isAnswerCorrect() {
        return answerCorrect;
    }

    public void setAnswerCorrect(boolean answerCorrenct) {
        this.answerCorrect = answerCorrenct;
    }
}
