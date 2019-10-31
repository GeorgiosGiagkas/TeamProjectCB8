package com.game.quizbot.controllers;

import com.game.quizbot.dao.AvatarDao;
import com.game.quizbot.dto.AvatarDto;
import com.game.quizbot.model.Avatar;
import com.game.quizbot.services.avatars.AvatarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;


@Controller
public class AvatarController {

    @Autowired
    AvatarService as;

    @Autowired
    AvatarDao ad;

    @GetMapping("show-avatars")
    public String showAvatars(ModelMap m){
        return "edit-avatars";
    }

    @PostMapping("create-avatar")
    public String createAvatar(@RequestParam("avatarName") String name, @RequestParam("avatarCost") int cost, @RequestParam("avatar-image") Part image, HttpServletRequest request){
        Avatar a = new Avatar();

        a.setAvatarName(name);
        a.setAvatarCost(cost);

        Avatar newAvatar = ad.saveAvatar(a);
        int id = newAvatar.getAvatarId();



        as.partWrite(image, id, request);

        return "redirect:/show-all-avatars";
    }

    @GetMapping("get-all-avatars")
    @ResponseBody
    public Iterable<AvatarDto> getAllAvatars(){
        return as.getAvatars();
    }

    @GetMapping("show-all-avatars")
    public String showAllAvatars(ModelMap m){
        Iterable<Avatar> avatars = ad.getAllAvatars();
        m.addAttribute("allavatars", avatars);

        return "edit-avatars2";
    }
}
