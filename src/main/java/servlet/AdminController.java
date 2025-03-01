package servlet;

import dao.AuthorDao;
import dao.BookDao;
import dao.CategoryDao;
import dao.UserDao;
import dto.AuthorDto;
import dto.BookDto;
import dto.UserDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Author;
import model.Book;
import model.Category;
import model.User;
import org.hibernate.service.spi.ServiceException;
import service.AuthorService;
import service.BookService;
import service.CategoryService;
import service.UserService;
import util.HashingUtil;

import java.io.IOException;
import java.util.*;

@WebServlet("/admin/*")
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String title = req.getParameter("admin");
        List<UserDto> allUsers = new UserService().getAllUsers();
        List<BookDto> allBooks = new BookService().findAllBookDto();
        req.getSession().setAttribute("users", allUsers);
        req.getSession().setAttribute("allbooks", allBooks);
        req.getSession().setAttribute("authors", new AuthorDao().findAll());
        req.getSession().setAttribute("category", new CategoryDao().findAll());

        req.getRequestDispatcher("/view/admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (Objects.equals(pathInfo, "/add_category")) {
            String category = req.getParameter("name");
            Category category1 = new Category();
            category1.setName(category);
            try {
                new CategoryService().add(category1);
                resp.sendRedirect(req.getContextPath() + "/view/admin.jsp");
            } catch (ServiceException e) {
                req.setAttribute("error", "Failed to add category: " + e.getMessage());
                req.getRequestDispatcher("/view/admin.jsp").forward(req, resp);
            }
        } else if (Objects.equals(pathInfo, "/add_author")) {
            String firstName = req.getParameter("firstname");
            String lastName = req.getParameter("lastname");
            Author author = new Author();
            author.setFirstName(firstName);
            author.setLastName(lastName);
            new AuthorService().add(author);
            resp.sendRedirect(req.getContextPath() + "/view/admin.jsp");

        } else if (Objects.equals(pathInfo, "/add_user")) {
            String username = req.getParameter("username") == null ? "" : req.getParameter("username");
            String firstname = req.getParameter("firstname") == null ? "" : req.getParameter("firstname");
            String lastname = req.getParameter("lastname") == null ? "" : req.getParameter("lastname");
            String password1 = req.getParameter("password1") == null ? "" : req.getParameter("password1");
            String password2 = req.getParameter("password2") == null ? "" : req.getParameter("password2");
            String error = null;

            if (username.isBlank() || password1.isBlank() || password2.isBlank()) {
                error = "Please fill all the required fields";
            }
            if (!password1.equals(password2)) {
                error = "Passwords do not match";
            }

            if (error != null) {

                req.setAttribute("error", error);
                req.setAttribute("username", username);
                req.setAttribute("firstname", firstname);
                req.setAttribute("lastname", lastname);
                req.setAttribute("password1", password1);
                req.setAttribute("password2", password2);
            }

            User user = new User();
            user.setUsername(username);
            user.setFirsName(firstname);
            user.setLastName(lastname);
            user.setRole("user");
            user.setPassword(HashingUtil.Encrypt(password1));
            UserDao userDAO = new UserDao();
            try {
                Optional<User> first = userDAO.findAll().stream().filter(u -> u.getUsername().equals(username)).findFirst();
                if (first.isEmpty()) {
                    userDAO.save(user);
                    req.setAttribute("success", "Your user has been successfully registered!");
                } else {
                    req.setAttribute("error", "Your username is already exist");

                }
            } catch (Throwable e) {
                req.setAttribute("error", "Your user could not be created");
                System.out.println(e.getMessage());
            }
        resp.sendRedirect(req.getContextPath() + "/view/admin.jsp");
        }


        else if (Objects.equals(pathInfo, "/add_book")) {
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            int year = Integer.parseInt(req.getParameter("year"));
            String imagePath= req.getParameter("imagepath");
            Long categoryId = Long.valueOf(req.getParameter("category"));
            Long authorId = Long.valueOf(req.getParameter("author"));
            Category byCategoryId = new CategoryService().findByCategoryId(categoryId);
            Author byId = new AuthorService().findById(authorId);
            String publisher =req.getParameter("publisher");
            Book book = new Book();
            book.setTitle(title);
            book.setDescription(description);
            book.setYear(year);
            book.setPublisher(publisher);
            book.setImagePath(imagePath);
            book.setCategory(byCategoryId);
            List<Author> authorList =new ArrayList<>();
            authorList.add(byId);
            book.setAuthor(authorList);
            new BookDao().save(book);
            resp.sendRedirect(req.getContextPath() + "/view/admin.jsp");


        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

    }
}

