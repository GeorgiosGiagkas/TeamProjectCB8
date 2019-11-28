package com.game.quizbot.controllers;


import com.game.quizbot.dao.CategoryDao;
import com.game.quizbot.dto.CategoryDto;
import com.game.quizbot.model.Category;
import com.game.quizbot.services.categories.CategoryService;
import com.game.quizbot.utils.PartUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.IOException;


@Controller
public class CategoryController {

    @Autowired
    CategoryDao cd;

    @Autowired
    CategoryService cs;


    @PostMapping("/create-category")
    public String createCategory(@RequestParam("categoryName") String categoryName,
                                 HttpSession session, @RequestParam("category-image") Part image, HttpServletRequest request, @RequestParam(value = "active", required = false) String active) {
        if(session!=null && session.getAttribute("login-admin")!=null) {
            Category c = new Category();
            c.setCategoryName(categoryName);

            if (active != null) {
                c.setCategoryActive(true);
            }

            cd.insertCategory(c);


            cs.partWrite(image, categoryName, request);

        }
        return "redirect:/show-all-categories";
    }

    @GetMapping("get-all-categories")
    @ResponseBody
    public Iterable<CategoryDto> showAllCategoriesRest(){

        return cs.getAllCategories();
    }

    @GetMapping("show-all-categories")
    public String showAllCategories(ModelMap m){
        Iterable<Category> categories = cd.getAllCategories();
        m.addAttribute("allcategories", categories);

        return "edit-category";
    }

    @GetMapping("get-category-by-id/{id}")
    @ResponseBody
    public CategoryDto getCategoryById(@PathVariable("id") int id){
        return cs.getCategoryDtoById(id);
    }

    @PostMapping("edit-category")
    public String editCategory(@RequestParam("categoryId") int categoryId,
                               HttpSession session,@RequestParam("categoryName") String categoryName, @RequestParam(value = "active", required = false) String active){
        if(session!=null && session.getAttribute("login-admin")!=null) {
            Category c = new Category();
            c.setCategoryId(categoryId);
            c.setCategoryName(categoryName);

            if (active != null) {
                c.setCategoryActive(true);
            } else {
                c.setCategoryActive(false);
            }

            cd.insertCategory(c);
        }
        return "redirect:/show-all-categories";
    }

    @PostMapping("delete-category")
    public String deleteCategory(@RequestParam("categoryId") int categoryId,HttpSession session){
        if(session!=null && session.getAttribute("login-admin")!=null) {
            cd.deleteCategoryById(categoryId);
        }
        return "redirect:/show-all-categories";
    }


}
