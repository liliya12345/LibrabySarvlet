package servlet;

import dao.UserBookDao;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.User;
import model.UserBook;
import org.hibernate.service.spi.ServiceException;
import service.BookService;
import service.CategoryService;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@WebServlet("/user/*")
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/view/userspage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String pathInfo = req.getPathInfo();
            User user = (User) req.getSession().getAttribute("user");
            if (Objects.equals(pathInfo, "/change_username")) {
                String username = req.getParameter("username");
                user.setUsername(username);
                new UserDao().update(user);
                resp.sendRedirect(req.getContextPath() + "/user");


            } else if (Objects.equals(pathInfo, "/change_firstname")) {
                String firstname = req.getParameter("firstname");
                user.setFirsName(firstname);
                new UserDao().update(user);
                resp.sendRedirect(req.getContextPath() + "/user");
            }else if (Objects.equals(pathInfo, "/change_lastname")) {
                String lastname = req.getParameter("lastname");
                user.setLastName(lastname);
                new UserDao().update(user);
                resp.sendRedirect(req.getContextPath() + "/user");
            }

        } catch (ServiceException e) {
            req.setAttribute("error", "Failed to add category: " + e.getMessage());

        }
    }
}


