package servlet;

import com.sun.jdi.Bootstrap;
import dao.BookDao;
import dto.BookDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import service.BookService;

import java.io.IOException;
import java.util.Objects;

@WebServlet("/bookinfo/*")
public class BookInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo(); // e.g., "/123"
        if (pathInfo == null || pathInfo.length() <= 1) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Category ID is missing");
            return;
        }

        Long id = Long.valueOf(pathInfo.substring(1));
        Book book = new BookService().findById(id);
        if (book != null) {
            req.getSession().setAttribute("books", book);
            req.getSession().setAttribute("book", book);
            req.getRequestDispatcher("/view/bookinfo.jsp").forward(req, resp);
            // Forward to the JSP page

        }

    }
}
