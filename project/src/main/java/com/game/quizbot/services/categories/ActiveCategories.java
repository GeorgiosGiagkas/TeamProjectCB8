package com.game.quizbot.services.categories;


import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.model.Category;
import org.springframework.beans.factory.annotation.Autowired;



public class ActiveCategories {

    @Autowired
    CategoryDao categoryDao;

    public Iterable<Category> getActiveCategories(){
        return categoryDao.getAllActiveCategories();
    }



}
