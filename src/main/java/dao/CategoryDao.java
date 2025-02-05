package dao;

import model.Category;

public class CategoryDao extends GenericDAO<Category,Long> {
    public CategoryDao() {
        super(Category.class);
    }

}
