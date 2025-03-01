package servlet;

import dao.UserDao;
import dto.BookDto;
import dto.UserDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Book;
import model.User;
import service.BookService;

import java.io.IOException;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@WebServlet("/searchuser")
public class SearchUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search1");
        Optional<User> first = new UserDao().findAll().stream().filter(u -> u.getUsername().equals(search)).findFirst();
        if (first.isPresent()){
           req.getSession().removeAttribute("bookbysearch");
            req.getSession().setAttribute("usersbysearch", first.get());
        }
        resp.sendRedirect(req.getContextPath() + "/admin");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Set<Book> result = new HashSet<>();
        String title = req.getParameter("search1");
        Set<BookDto> allBookDtoByAuthorOrByTitle = new BookService().findAllBookDtoByAuthorOrByTitle(title);
        req.getSession().setAttribute("users", allBookDtoByAuthorOrByTitle);
        req.getRequestDispatcher("/view/admin.jsp").forward(req, resp);

    }
}