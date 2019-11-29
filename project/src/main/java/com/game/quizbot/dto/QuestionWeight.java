package com.game.quizbot.dto;

public class QuestionWeight {

    private Integer questionId;
    private String content;
    private Double weight;

    public QuestionWeight() {
    }

    public QuestionWeight(Integer questionId, String content, Double weight) {
        this.questionId = questionId;
        this.content = content;
        this.weight = weight;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }
}
