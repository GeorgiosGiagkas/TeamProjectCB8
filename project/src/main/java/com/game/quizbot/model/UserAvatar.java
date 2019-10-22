/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.game.quizbot.model;

import java.io.Serializable;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author omiro
 */
@Entity
@Table(name = "user_avatar")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserAvatar.findAll", query = "SELECT u FROM UserAvatar u")})
public class UserAvatar implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "user_avatar_id")
    private Integer userAvatarId;
    @JoinColumn(name = "avatar_id", referencedColumnName = "avatar_id")
    @ManyToOne(optional = false)
    private Avatar avatarId;
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private User userId;

    public UserAvatar() {
    }

    public UserAvatar(Integer userAvatarId) {
        this.userAvatarId = userAvatarId;
    }

    public Integer getUserAvatarId() {
        return userAvatarId;
    }

    public void setUserAvatarId(Integer userAvatarId) {
        this.userAvatarId = userAvatarId;
    }

    public Avatar getAvatarId() {
        return avatarId;
    }

    public void setAvatarId(Avatar avatarId) {
        this.avatarId = avatarId;
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
        hash += (userAvatarId != null ? userAvatarId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserAvatar)) {
            return false;
        }
        UserAvatar other = (UserAvatar) object;
        if ((this.userAvatarId == null && other.userAvatarId != null) || (this.userAvatarId != null && !this.userAvatarId.equals(other.userAvatarId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.game.quizbot.model.UserAvatar[ userAvatarId=" + userAvatarId + " ]";
    }
    
}
