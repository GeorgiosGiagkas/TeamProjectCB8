package com.game.quizbot.dao;

import com.game.quizbot.model.Category;
import com.game.quizbot.repositories.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
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
}
