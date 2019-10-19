package com.game.quizbot.dao;

import com.game.quizbot.model.Category;
import com.game.quizbot.repositories.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;


@Service
@Transactional
public class CategoryDaoImpl implements CategoryDao {

    @Autowired
    CategoryRepo cr;

    @Override
    public Category getCategoryById(int categoryId) {
        Category categoryById = cr.getCategoryById(categoryId);
        return categoryById;
    }

    @Override
    public Iterable<Category> getAllActiveCategories() {
        Iterable allActiveCategories = cr.getAllActiveCategories();
        return allActiveCategories;
    }



    @Override
    public void insertCategory(Category c){
        cr.save(c);
    }

    @Override
    public Iterable<Category> getCategoriesByName(String categoryName){
        Iterable<Category> categories = cr.getCategoriesByName(categoryName);
        return categories;
    }
}
