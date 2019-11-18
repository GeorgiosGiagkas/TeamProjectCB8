package com.game.quizbot.dao;

import com.game.quizbot.model.Avatar;
import com.game.quizbot.repositories.AvatarRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import sun.security.x509.AVA;

@Service
public class AvatarDaoImpl implements AvatarDao{

    @Autowired
    AvatarRepo avatarRepo;

    @Override
    public Avatar getAvatarByAvatarName(String avatarName) {
        Avatar avatarByAvatarName = avatarRepo.getAvatarByAvatarName(avatarName);
        return avatarByAvatarName;
    }

    @Override
    public Avatar saveAvatar(Avatar a){

        return avatarRepo.save(a);
    }

    @Override
    public Iterable<Avatar> getAllAvatars(){
        Iterable<Avatar> avatars = avatarRepo.getAllAvatars();
        return avatars;
    }

    @Override
    public Avatar getAvatarById(int id){
        return avatarRepo.getAvatarById(id);
    }

    @Override
    public Page<Avatar> gelAllAvatarsByPageNo(int pageNo, Pageable pageable){
        int pageNumber = pageable.getPageNumber();
        Page avatarPage = avatarRepo.getAllAvatarsByPageNo(pageNumber, pageable);
        return avatarPage;
    }

    @Override
    public Iterable<Integer> getAllOwnedAvatarsByUserId(int id){
        Iterable<Integer> allOwnedAvatarsByUserId = avatarRepo.getAllOwnedAvatarsByUserId(id);
        return allOwnedAvatarsByUserId;
    }

    @Override
    public int getAvatarCount(){
        int avatarCount = avatarRepo.getAvatarCount();
        return avatarCount;
    }

}