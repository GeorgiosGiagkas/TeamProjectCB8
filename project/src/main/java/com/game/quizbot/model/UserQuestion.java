/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.game.quizbot.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
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
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "user_question_id")
    private Integer userQuestionId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "user_question_success")
    private boolean userQuestionSuccess;
    @Basic(optional = false)
    @NotNull
    @Column(name = "user_question_timespamp")
//    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(iso=DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime userQuestionTimespamp;
    @JoinColumn(name = "question_id", referencedColumnName = "question_id")
    @ManyToOne(optional = false)
    private Question questionId;
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private User userId;

    public UserQuestion() {
    }

    public UserQuestion(Integer userQuestionId) {
        this.userQuestionId = userQuestionId;
    }

    public UserQuestion(Integer userQuestionId, boolean userQuestionSuccess, LocalDateTime userQuestionTimespamp) {
        this.userQuestionId = userQuestionId;
        this.userQuestionSuccess = userQuestionSuccess;
        this.userQuestionTimespamp = userQuestionTimespamp;
    }

    public Integer getUserQuestionId() {
        return userQuestionId;
    }

    public void setUserQuestionId(Integer userQuestionId) {
        this.userQuestionId = userQuestionId;
    }

    public boolean getUserQuestionSuccess() {
        return userQuestionSuccess;
    }

    public void setUserQuestionSuccess(boolean userQuestionSuccess) {
        this.userQuestionSuccess = userQuestionSuccess;
    }

    public LocalDateTime getUserQuestionTimespamp() {
        return userQuestionTimespamp;
    }

    public void setUserQuestionTimespamp(LocalDateTime userQuestionTimespamp) {
        this.userQuestionTimespamp = userQuestionTimespamp;
    }

    public Question getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Question questionId) {
        this.questionId = questionId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userQuestionId != null ? userQuestionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserQuestion)) {
            return false;
        }
        UserQuestion other = (UserQuestion) object;
        if ((this.userQuestionId == null && other.userQuestionId != null) || (this.userQuestionId != null && !this.userQuestionId.equals(other.userQuestionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.game.quizbot.model.UserQuestion[ userQuestionId=" + userQuestionId + " ]";
    }

}
