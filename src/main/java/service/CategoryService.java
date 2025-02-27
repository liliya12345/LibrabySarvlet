package service;

import dao.CategoryDao;
import model.Category;

public class CategoryService {
    public void add(Category category) {
        new CategoryDao().save(category);
    }
    public Category findByCategoryId(Long id) {
        return new CategoryDao().findById(id);
    }
}
