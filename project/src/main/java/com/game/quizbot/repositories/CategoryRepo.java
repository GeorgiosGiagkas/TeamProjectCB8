package com.game.quizbot.repositories;

import com.game.quizbot.model.Category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepo extends CrudRepository<Category,Integer> {



    @Query("SELECT c FROM Category c WHERE c.categoryId=?1")
    Category getCategoryById(Integer id);

    @Query("SELECT c FROM Category c WHERE c.categoryActive=true")
    Iterable<Category> getAllActiveCategories();

    @Query("SELECT c FROM Category c")
    Iterable<Category> getAllCategories();

    @Query("SELECT c FROM Category c WHERE c.categoryName = ?1")
    Iterable<Category> getCategoriesByName(String categoryName);

    @Query("SELECT c.categoryName FROM Category c WHERE c.categoryId = ?1")
    String getCategoryNameById(Integer id);

    @Query("SELECT c.categoryId FROM Category c WHERE c.categoryName = ?1")
    int getCategoryIdByName(String categoryName);



}