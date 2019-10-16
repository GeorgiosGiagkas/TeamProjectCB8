package com.game.quizbot.dao;

import com.game.quizbot.model.Category;
import org.springframework.stereotype.Service;

@Service
public class CategoryDaoImpl implements CategoryDao {
    @Override
    public Category getCategoryById(int categoryId) {
        return null;
    }

    @Override
    public Iterable<Category> getAllActiveCategories() {
        return null;
    }
}
