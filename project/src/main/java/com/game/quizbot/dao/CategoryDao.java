package com.game.quizbot.dao;

import com.game.quizbot.model.Category;

public interface CategoryDao {

    public Category getCategoryById(int categoryId);

    public Iterable<Category> getAllActiveCategories();

    public Iterable<Category> getAllCategories();

    public void insertCategory(Category c);

    public Iterable<Category> getCategoriesByName(String categoryName);

    public void deleteCategoryById(int id);

    public String getCategoryNameById(int id);

    public int getCategoryIdByName(String CategoryName);
}
