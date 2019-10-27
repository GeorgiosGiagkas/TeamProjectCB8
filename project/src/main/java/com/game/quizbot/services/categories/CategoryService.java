package com.game.quizbot.services.categories;

import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.dto.CategoryDto;
import com.game.quizbot.model.Category;
import com.game.quizbot.utils.PartUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.Part;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


@Component
public class CategoryService {

    @Autowired
    CategoryDao categoryDao;

    Iterable<Category> categories;

    public List<CategoryDto> getCategories(){
        List<CategoryDto> categoriesDto = new ArrayList<>();
        Iterator<Category> categories = this.categories.iterator();
        while (categories.hasNext()){
            Category c =categories.next();
            CategoryDto categoryDto = new CategoryDto();
            categoryDto.setCategoryId(c.getCategoryId());
            categoryDto.setCategoryName(c.getCategoryName());
            categoryDto.setCategoryActive(c.getCategoryActive());
            categoriesDto.add(categoryDto);
        }


        return categoriesDto;
    }



    public List<CategoryDto> getAllCategories() {
        this.categories = categoryDao.getAllCategories();
        return getCategories();
    }

    public List<CategoryDto> getActiveCategories() {
        this.categories = categoryDao.getAllActiveCategories();
        return getCategories();
    }

    public CategoryDto getCategoryDtoById(int id){
        Category c = categoryDao.getCategoryById(id);
        CategoryDto categoryDto = new CategoryDto();
        categoryDto.setCategoryId(c.getCategoryId());
        categoryDto.setCategoryName(c.getCategoryName());
        categoryDto.setCategoryActive(c.getCategoryActive());

        return categoryDto;
    }

    public void partWrite(Part p){
        String filename = PartUtils.extractFileName(p);
//        try {
//            p.write("src/main/webapp/images/" + filename);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }
}
