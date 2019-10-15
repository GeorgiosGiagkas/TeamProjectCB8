/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.game.quizbot.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author omiro
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")})
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "user_id")
    private Integer userId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "user_nickname")
    private String userNickname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "user_password")
    private String userPassword;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "user_email")
    private String userEmail;
    @JoinTable(name = "user_avatar", joinColumns = {
        @JoinColumn(name = "user_id", referencedColumnName = "user_id")}, inverseJoinColumns = {
        @JoinColumn(name = "avatar_id", referencedColumnName = "avatar_id")})
    @ManyToMany
    private Collection<Avatar> avatarCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<UserHighscore> userHighscoreCollection;
    @JoinColumn(name = "role_id", referencedColumnName = "role_id")
    @ManyToOne(optional = false)
    private Role roleId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<UserQuestion> userQuestionCollection;

    public User() {
    }

    public User(Integer userId) {
        this.userId = userId;
    }

    public User(Integer userId, String userNickname, String userPassword, String userEmail) {
        this.userId = userId;
        this.userNickname = userNickname;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    @XmlTransient
    public Collection<Avatar> getAvatarCollection() {
        return avatarCollection;
    }

    public void setAvatarCollection(Collection<Avatar> avatarCollection) {
        this.avatarCollection = avatarCollection;
    }

    @XmlTransient
    public Collection<UserHighscore> getUserHighscoreCollection() {
        return userHighscoreCollection;
    }

    public void setUserHighscoreCollection(Collection<UserHighscore> userHighscoreCollection) {
        this.userHighscoreCollection = userHighscoreCollection;
    }

    public Role getRoleId() {
        return roleId;
    }

    public void setRoleId(Role roleId) {
        this.roleId = roleId;
    }

    @XmlTransient
    public Collection<UserQuestion> getUserQuestionCollection() {
        return userQuestionCollection;
    }

    public void setUserQuestionCollection(Collection<UserQuestion> userQuestionCollection) {
        this.userQuestionCollection = userQuestionCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.game.quizbot.model.User[ userId=" + userId + " ]";
    }
    
}
