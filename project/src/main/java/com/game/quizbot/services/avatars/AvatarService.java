package com.game.quizbot.services.avatars;

import com.game.quizbot.dao.AvatarDao;
import com.game.quizbot.dto.AvatarDto;
import com.game.quizbot.model.Avatar;
import com.game.quizbot.utils.PartUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Component
public class AvatarService {

    @Autowired
    AvatarDao ad;

    public List<AvatarDto> getAvatars(){
        List<AvatarDto> avatarsDto = new ArrayList<>();
        Iterable<Avatar> avatars = ad.getAllAvatars();
        Iterator<Avatar> avatarsIter = avatars.iterator();
        while (avatarsIter.hasNext()){
            Avatar a = avatarsIter.next();
            AvatarDto avatarDto = new AvatarDto();
            avatarDto.setAvatarId(a.getAvatarId());
            avatarDto.setAvatarName(a.getAvatarName());
            avatarDto.setAvatarCost(a.getAvatarCost());
            avatarsDto.add(avatarDto);
        }


        return avatarsDto;
    }

    public AvatarDto getAvatarDtoFromAvatar(Avatar a){
        AvatarDto avatarDto = new AvatarDto();
        avatarDto.setAvatarId(a.getAvatarId());
        avatarDto.setAvatarName(a.getAvatarName());
        avatarDto.setAvatarCost(a.getAvatarCost());

        return avatarDto;
    }

    public void partWrite(Part p, int avatarId, HttpServletRequest request){
        String extension = PartUtils.extractFileExtension(p);
        ServletContext context = request.getServletContext();
        String appPath = context.getRealPath("/");
        try {
            p.write(appPath + "images/" + avatarId + "" + extension);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
