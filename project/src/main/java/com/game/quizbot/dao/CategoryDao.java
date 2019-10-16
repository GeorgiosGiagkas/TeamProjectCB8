package com.game.quizbot.dao;

import com.game.quizbot.model.Category;

public interface CategoryDao {

    public Iterable<Category> getAllActiveCategories();
}
