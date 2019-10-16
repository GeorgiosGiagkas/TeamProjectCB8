/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.game.quizbot.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author omiro
 */
@Embeddable
public class QuestionAnswerPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "question_id")
    private int questionId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "answer_id")
    private int answerId;

    public QuestionAnswerPK() {
    }

    public QuestionAnswerPK(int questionId, int answerId) {
        this.questionId = questionId;
        this.answerId = answerId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) questionId;
        hash += (int) answerId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof QuestionAnswerPK)) {
            return false;
        }
        QuestionAnswerPK other = (QuestionAnswerPK) object;
        if (this.questionId != other.questionId) {
            return false;
        }
        if (this.answerId != other.answerId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.game.quizbot.model.QuestionAnswerPK[ questionId=" + questionId + ", answerId=" + answerId + " ]";
    }
    
}
