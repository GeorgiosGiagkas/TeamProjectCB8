package com.game.quizbot.controllers;

import com.game.quizbot.dao.AvatarDao;
import com.game.quizbot.dto.AvatarDto;
import com.game.quizbot.model.Avatar;
import com.game.quizbot.services.avatars.AvatarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@Controller
public class AvatarController {

    @Autowired
    AvatarService as;

    @Autowired
    AvatarDao ad;



    @PostMapping("create-avatar")
    public String createAvatar(@RequestParam("avatarName") String name, @RequestParam("avatarCost") int cost,
                               @RequestParam("avatar-image") Part image, HttpServletRequest request, HttpSession session){
        if(session!=null && session.getAttribute("login-admin")!=null) {
            Avatar a = new Avatar();
            a.setAvatarName(name);
            a.setAvatarCost(cost);
            Avatar newAvatar = ad.saveAvatar(a);
            int id = newAvatar.getAvatarId();
            as.partWrite(image, id, request);
        }
        return "redirect:/show-all-avatars";
    }

    @PostMapping("edit-avatar")
    public String editAvatar(@RequestParam("avatarId") int id, @RequestParam("avatarName") String name,
                             @RequestParam("avatarCost") int cost, HttpServletRequest request,
                             HttpSession session){
        if(session!=null && session.getAttribute("login-admin")!=null) {

            Avatar a = new Avatar();
            a.setAvatarId(id);
            a.setAvatarName(name);
            a.setAvatarCost(cost);
            ad.saveAvatar(a);
        }
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

        return "edit-avatars";
    }

    @GetMapping("get-avatar-by-id/{id}")
    @ResponseBody
    public AvatarDto getAvatarById(@PathVariable("id") int id){
        Avatar a = ad.getAvatarById(id);
        AvatarDto avatarDto = as.getAvatarDtoFromAvatar(a);

        return avatarDto;
    }
}
