package com.game.quizbot.controllers;


import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.model.Category;
import com.game.quizbot.services.categories.CategoryService;
import com.game.quizbot.utils.PartUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Part;
import java.io.IOException;


@Controller
public class CategoryController {

    @Autowired
    CategoryDao cd;

    @Autowired
    CategoryService cs;


    @PostMapping("/create-category")
    public String createCategory(@RequestParam("categoryName") String categoryName, @RequestParam("category-image") Part p) {

        Category c = new Category();
        c.setCategoryName(categoryName);

        cd.insertCategory(c);

        cs.partWrite(p);


        return "admin-menu";
    }


}
