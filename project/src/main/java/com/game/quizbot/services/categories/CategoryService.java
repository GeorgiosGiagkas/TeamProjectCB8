package com.game.quizbot.services.categories;

import com.game.quizbot.utils.PartUtils;
import org.springframework.stereotype.Component;

import javax.servlet.http.Part;


@Component
public class CategoryService {

    public void partWrite(Part p){
        String filename = PartUtils.extractFileName(p);
//        try {
//            p.write("src/main/webapp/images/" + filename);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }
}
