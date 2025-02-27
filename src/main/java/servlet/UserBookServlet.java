package servlet;

import dto.BookDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import service.BookService;
import service.UserBookService;

import java.io.IOException;
import java.util.List;

@WebServlet("/return/*")
public class UserBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Extract the category ID from the path
            String pathInfo = req.getPathInfo(); // e.g., "/123"
//            if (pathInfo == null || pathInfo.length() <= 1) {
//                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Category ID is missing");
//                return;
//            } else
//            if (pathInfo.startsWith("/return/*")) {
            User user = (User) req.getSession().getAttribute("user");
            int userId = user.getId();
            Long bookId = Long.valueOf(pathInfo.substring(1));
            new UserBookService().returnBook(userId, bookId);


            getServletContext().getRequestDispatcher("/view/userspage.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid category ID");
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        }
    }


}
