package com.game.quizbot.services.categories;


import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.dto.CategoryDto;
import com.game.quizbot.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Component
public class ActiveCategories {

    @Autowired
    CategoryDao categoryDao;

    public ActiveCategories() {
    }

    public List<CategoryDto> getActiveCategories(){
        List<CategoryDto> categoriesDto = new ArrayList<>();
        Iterator<Category> categories =  categoryDao.getAllActiveCategories().iterator();
        while (categories.hasNext()){
            Category c =categories.next();
            CategoryDto categoryDto = new CategoryDto();
            categoryDto.setCategoryId(c.getCategoryId());
            categoryDto.setCategoryName(c.getCategoryName());

            categoriesDto.add(categoryDto);
        }


        return categoriesDto;
    }



}
