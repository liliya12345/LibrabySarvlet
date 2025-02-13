import dao.CategoryDao;
import model.Category;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        CategoryDao categoryDao = new CategoryDao();
        List<Category> all = categoryDao.findAll();
        System.out.println(all);

    }
}
