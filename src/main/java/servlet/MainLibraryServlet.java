package servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.CategoryDao;
import org.hibernate.*;

@WebServlet
public class MainLibraryServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryDao categoryDao = new CategoryDao();
        categoryDao.findAll();
        req.getRequestDispatcher("src/main/webapp/index.jsp").forward(req, resp);

    }

    @Override
    public void init() throws ServletException {

    }
}
