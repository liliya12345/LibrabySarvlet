package servlet;

import dto.BookDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BookService;

import java.io.IOException;
import java.util.List;

@WebServlet("/category/*") // Use wildcard to match paths like /category/123
public class Category extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Extract the category ID from the path
            String pathInfo = req.getPathInfo(); // e.g., "/123"
            if (pathInfo == null || pathInfo.length() <= 1) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Category ID is missing");
                return;
            }
            Long id = Long.valueOf(pathInfo.substring(1)); // Remove the leading "/"

            // Fetch books by category ID
            List<BookDto> books = new BookService().findAllBookDtoByCategoryId(id);

            // Store the result in the request scope
            req.setAttribute("all", books);

            // Forward to the JSP page
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid category ID");
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        }
    }
}
