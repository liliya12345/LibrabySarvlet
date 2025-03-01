package servlet;

import dao.UserBookDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.UserBook;
import service.UserBookService;

import java.io.IOException;
import java.util.List;

@WebServlet("/loan/*")
public class LoanServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String pathInfo = req.getPathInfo(); // e.g., "/123"
            User user = (User) req.getSession().getAttribute("user");
            int userId = user.getId();
            Long bookId = Long.valueOf(pathInfo.substring(1));

            new UserBookService().uppdateDateOfReturn(userId, bookId);

            req.setAttribute("success", "Your has been successfully changed date of return!");
            getServletContext().getRequestDispatcher("/view/userspage.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            req.setAttribute("error", "Your can not rebook the book!");

            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid category ID");
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        }
    }
}
