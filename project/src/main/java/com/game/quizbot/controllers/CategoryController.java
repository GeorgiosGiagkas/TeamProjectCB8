package com.game.quizbot.controllers;


import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class CategoryController {

    @Autowired
    CategoryDao cd;

    @GetMapping("/show-create-category")
    public String showCreateCategoryForm(ModelMap m){
        Category c = new Category();
        m.addAttribute("mycategory", c);
        return "create-category";
    }

    @PostMapping("/create-category")
    public String createCategory(@ModelAttribute("mycategory") Category c){
        cd.insertCategory(c);
        return "admin-menu";
    }


}
