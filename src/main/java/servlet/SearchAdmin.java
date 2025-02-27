package servlet;

import dto.BookDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import service.BookService;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@WebServlet("/searchadmin")
public class SearchAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("search");
        Set<BookDto> allBookDtoByAuthorOrByTitle = new BookService().findAllBookDtoByAuthorOrByTitle(title);
        req.getSession().setAttribute("bookbysearch", allBookDtoByAuthorOrByTitle);
////        User user = (User) req.getSession().getAttribute("user");
//        int userId = user.getId();

//        req.getSession().setAttribute("status", new UserBookService().findStatus());
        req.getRequestDispatcher("/view/admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Set<Book> result = new HashSet<>();
        String title = req.getParameter("search");
         Set<BookDto> allBookDtoByAuthorOrByTitle = new BookService().findAllBookDtoByAuthorOrByTitle(title);
        req.getSession().setAttribute("bookbysearch", allBookDtoByAuthorOrByTitle);
        req.getRequestDispatcher("/view/admin.jsp").forward(req, resp);

    }
}
