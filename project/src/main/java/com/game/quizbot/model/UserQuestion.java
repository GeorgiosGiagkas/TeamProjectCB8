/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.game.quizbot.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author omiro
 */
@Entity
@Table(name = "user_question")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserQuestion.findAll", query = "SELECT u FROM UserQuestion u")})
public class UserQuestion implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserQuestionPK userQuestionPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "user_question_success")
    private boolean userQuestionSuccess;
    @Basic(optional = false)
    @NotNull
    @Column(name = "user_question_timestamp")
//    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(iso=DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime userQuestionTimestamp;
    @JoinColumn(name = "question_id", referencedColumnName = "question_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Question question;
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public UserQuestion() {
    }

    public UserQuestion(UserQuestionPK userQuestionPK) {
        this.userQuestionPK = userQuestionPK;
    }

    public UserQuestion(UserQuestionPK userQuestionPK, boolean userQuestionSuccess, Date userQuestionTimespamp) {
        this.userQuestionPK = userQuestionPK;
        this.userQuestionSuccess = userQuestionSuccess;
        this.userQuestionTimestamp = userQuestionTimestamp;
    }

    public UserQuestion(int userId, int questionId) {
        this.userQuestionPK = new UserQuestionPK(userId, questionId);
    }

    public UserQuestionPK getUserQuestionPK() {
        return userQuestionPK;
    }

    public void setUserQuestionPK(UserQuestionPK userQuestionPK) {
        this.userQuestionPK = userQuestionPK;
    }

    public boolean getUserQuestionSuccess() {
        return userQuestionSuccess;
    }

    public void setUserQuestionSuccess(boolean userQuestionSuccess) {
        this.userQuestionSuccess = userQuestionSuccess;
    }

    public LocalDateTime getUserQuestionTimestamp() {
        return userQuestionTimestamp;
    }

    public void setUserQuestionTimestamp(LocalDateTime userQuestionTimestamp) {
        this.userQuestionTimestamp = userQuestionTimestamp;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userQuestionPK != null ? userQuestionPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserQuestion)) {
            return false;
        }
        UserQuestion other = (UserQuestion) object;
        if ((this.userQuestionPK == null && other.userQuestionPK != null) || (this.userQuestionPK != null && !this.userQuestionPK.equals(other.userQuestionPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.game.quizbot.model.UserQuestion[ userQuestionPK=" + userQuestionPK + " ]";
    }
    
}
