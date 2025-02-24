package servlet;

import dao.BookDao;
import dto.BookDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.Category;
import service.BookService;

import java.io.IOException;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@WebServlet("/search")
public class LibraryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("search");
        Set<BookDto> allBookDtoByAuthorOrByTitle = new BookService().findAllBookDtoByAuthorOrByTitle(title);
        req.getSession().setAttribute("books", allBookDtoByAuthorOrByTitle);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Set<Book> result = new HashSet<>();
        String title = req.getParameter("search");
//        List<Book> booksByTitle = new BookService().findByTitle(title);
//        List<Book> byAuthor = new BookService().findByAuthor(title);
//        result = Stream.concat(booksByTitle.stream(), byAuthor.stream()).distinct().collect(Collectors.toSet());
        Set<BookDto> allBookDtoByAuthorOrByTitle = new BookService().findAllBookDtoByAuthorOrByTitle(title);
        req.getSession().setAttribute("books", allBookDtoByAuthorOrByTitle);
        req.getRequestDispatcher("index.jsp").forward(req, resp);

    }
}
