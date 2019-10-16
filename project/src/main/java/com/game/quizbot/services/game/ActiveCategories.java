package com.game.quizbot.services.game;


import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.dto.CategoryDto;
import com.game.quizbot.model.Category;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ActiveCategories {
    @Autowired(required = false)
    CategoryDao categoryDao;

    public List<CategoryDto> getActiveCategoriesDto(){
        List<CategoryDto> categoriesDto = new ArrayList<>();
        Iterator<Category> i = categoryDao.getAllActiveCategories().iterator();
        while(i.hasNext()){
            Category category = i.next();
            CategoryDto categoryDto = new CategoryDto();
            categoryDto.setCategoryId(category.getCategoryId());
            categoryDto.setCategoryName(category.getCategoryName());
            categoryDto.setCategoryImage(category.getCategoryImage());
        }

        return categoriesDto;
    }

}
