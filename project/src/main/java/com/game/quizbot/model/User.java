/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.game.quizbot.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
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
//    @Size(min = 1, max = 15)
    @Column(name = "user_nickname")
    private String userNickname;
    @Basic(optional = false)
    @NotNull
//    @Size(min = 1, max = 60)
    @Column(name = "user_password")
    private String userPassword;
    @Basic(optional = false)
    @NotNull
//    @Size(min = 1, max = 60)
    @Column(name = "user_email")
    private String userEmail;
    @Basic(optional = false)
    @NotNull
    @Column(name = "wallet")
    private int wallet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private Collection<UserAvatar> userAvatarCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<UserHighscore> userHighscoreCollection;
    @JoinColumn(name = "selected_avatar_id", referencedColumnName = "avatar_id")
    @ManyToOne(optional = false)
    private Avatar selectedAvatarId;
    @JoinColumn(name = "role_id", referencedColumnName = "role_id")
    @ManyToOne(optional = false)
    private Role roleId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private Collection<UserQuestion> userQuestionCollection;

    @Transient
    private String retypePassword;

    public User() {
    }

    public User(Integer userId) {
        this.userId = userId;
    }

    public User(Integer userId, String userNickname, String userPassword, String userEmail, int wallet) {
        this.userId = userId;
        this.userNickname = userNickname;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
        this.wallet = wallet;
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

    public String getRetypePassword() {
        return retypePassword;
    }

    public void setRetypePassword(String retypePassword) {
        this.retypePassword = retypePassword;
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

    public int getWallet() {
        return wallet;
    }

    public void setWallet(int wallet) {
        this.wallet = wallet;
    }

    @XmlTransient
    public Collection<UserAvatar> getUserAvatarCollection() {
        return userAvatarCollection;
    }

    public void setUserAvatarCollection(Collection<UserAvatar> userAvatarCollection) {
        this.userAvatarCollection = userAvatarCollection;
    }

    @XmlTransient
    public Collection<UserHighscore> getUserHighscoreCollection() {
        return userHighscoreCollection;
    }

    public void setUserHighscoreCollection(Collection<UserHighscore> userHighscoreCollection) {
        this.userHighscoreCollection = userHighscoreCollection;
    }

    public Avatar getSelectedAvatarId() {
        return selectedAvatarId;
    }

    public void setSelectedAvatarId(Avatar selectedAvatarId) {
        this.selectedAvatarId = selectedAvatarId;
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
