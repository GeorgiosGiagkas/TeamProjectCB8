/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.game.quizbot.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author omiro
 */
@Entity
@Table(name = "question_answer")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "QuestionAnswer.findAll", query = "SELECT q FROM QuestionAnswer q")})
public class QuestionAnswer implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected QuestionAnswerPK questionAnswerPK;
    @Column(name = "question_answer_correct")
    private Boolean questionAnswerCorrect;
    @JoinColumn(name = "answer_id", referencedColumnName = "answer_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Answer answer;
    @JoinColumn(name = "question_id", referencedColumnName = "question_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Question question;

    public QuestionAnswer() {
    }

    public QuestionAnswer(QuestionAnswerPK questionAnswerPK) {
        this.questionAnswerPK = questionAnswerPK;
    }

    public QuestionAnswer(int questionId, int answerId) {
        this.questionAnswerPK = new QuestionAnswerPK(questionId, answerId);
    }

    public QuestionAnswerPK getQuestionAnswerPK() {
        return questionAnswerPK;
    }

    public void setQuestionAnswerPK(QuestionAnswerPK questionAnswerPK) {
        this.questionAnswerPK = questionAnswerPK;
    }

    public Boolean getQuestionAnswerCorrect() {
        return questionAnswerCorrect;
    }

    public void setQuestionAnswerCorrect(Boolean questionAnswerCorrect) {
        this.questionAnswerCorrect = questionAnswerCorrect;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (questionAnswerPK != null ? questionAnswerPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof QuestionAnswer)) {
            return false;
        }
        QuestionAnswer other = (QuestionAnswer) object;
        if ((this.questionAnswerPK == null && other.questionAnswerPK != null) || (this.questionAnswerPK != null && !this.questionAnswerPK.equals(other.questionAnswerPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.game.quizbot.model.QuestionAnswer[ questionAnswerPK=" + questionAnswerPK + " ]";
    }
    
}
