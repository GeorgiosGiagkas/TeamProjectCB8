/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.game.quizbot.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
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
@Table(name = "avatar")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Avatar.findAll", query = "SELECT a FROM Avatar a")})
public class Avatar implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "avatar_id")
    private Integer avatarId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "avatar_name")
    private String avatarName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "avatar_cost")
    private BigDecimal avatarCost;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Column(name = "avatar_image")
    private byte[] avatarImage;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "avatarId")
    private Collection<UserAvatar> userAvatarCollection;

    public Avatar() {
    }

    public Avatar(Integer avatarId) {
        this.avatarId = avatarId;
    }

    public Avatar(Integer avatarId, String avatarName, BigDecimal avatarCost, byte[] avatarImage) {
        this.avatarId = avatarId;
        this.avatarName = avatarName;
        this.avatarCost = avatarCost;
        this.avatarImage = avatarImage;
    }

    public Integer getAvatarId() {
        return avatarId;
    }

    public void setAvatarId(Integer avatarId) {
        this.avatarId = avatarId;
    }

    public String getAvatarName() {
        return avatarName;
    }

    public void setAvatarName(String avatarName) {
        this.avatarName = avatarName;
    }

    public BigDecimal getAvatarCost() {
        return avatarCost;
    }

    public void setAvatarCost(BigDecimal avatarCost) {
        this.avatarCost = avatarCost;
    }

    public byte[] getAvatarImage() {
        return avatarImage;
    }

    public void setAvatarImage(byte[] avatarImage) {
        this.avatarImage = avatarImage;
    }

    @XmlTransient
    public Collection<UserAvatar> getUserAvatarCollection() {
        return userAvatarCollection;
    }

    public void setUserAvatarCollection(Collection<UserAvatar> userAvatarCollection) {
        this.userAvatarCollection = userAvatarCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (avatarId != null ? avatarId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Avatar)) {
            return false;
        }
        Avatar other = (Avatar) object;
        if ((this.avatarId == null && other.avatarId != null) || (this.avatarId != null && !this.avatarId.equals(other.avatarId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.game.quizbot.model.Avatar[ avatarId=" + avatarId + " ]";
    }
    
}
