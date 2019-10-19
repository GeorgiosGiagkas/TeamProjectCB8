package com.game.quizbot.dto;

public class CategoryDto {
    private Integer categoryId;
    private String categoryName;
    private boolean categoryActive;
    private byte[] categoryImage;

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public boolean isCategoryActive() {
        return categoryActive;
    }

    public void setCategoryActive(boolean categoryActive) {
        this.categoryActive = categoryActive;
    }

    public byte[] getCategoryImage() {
        return categoryImage;
    }

    public void setCategoryImage(byte[] categoryImage) {
        this.categoryImage = categoryImage;
    }
}
