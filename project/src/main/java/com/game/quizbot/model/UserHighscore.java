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
@Table(name = "user_highscore")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserHighscore.findAll", query = "SELECT u FROM UserHighscore u")})
public class UserHighscore implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserHighscorePK userHighscorePK;
    @Column(name = "highscore")
    private Integer highscore;
    @JoinColumn(name = "category_id", referencedColumnName = "category_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Category category;
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public UserHighscore() {
    }

    public UserHighscore(UserHighscorePK userHighscorePK) {
        this.userHighscorePK = userHighscorePK;
    }

    public UserHighscore(int userId, int categoryId) {
        this.userHighscorePK = new UserHighscorePK(userId, categoryId);
    }

    public UserHighscorePK getUserHighscorePK() {
        return userHighscorePK;
    }

    public void setUserHighscorePK(UserHighscorePK userHighscorePK) {
        this.userHighscorePK = userHighscorePK;
    }

    public Integer getHighscore() {
        return highscore;
    }

    public void setHighscore(Integer highscore) {
        this.highscore = highscore;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
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
        hash += (userHighscorePK != null ? userHighscorePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserHighscore)) {
            return false;
        }
        UserHighscore other = (UserHighscore) object;
        if ((this.userHighscorePK == null && other.userHighscorePK != null) || (this.userHighscorePK != null && !this.userHighscorePK.equals(other.userHighscorePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.game.quizbot.model.UserHighscore[ userHighscorePK=" + userHighscorePK + " ]";
    }
    
}
