package servlet;

import dao.UserBookDao;
import dto.BookDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.UserBook;
import service.BookService;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/booking/*")
public class BookingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getSession().getAttribute("user")==null){

            req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
        }
        try {
            // Extract the category ID from the path
            String pathInfo = req.getPathInfo(); // e.g., "/123"
            if (pathInfo == null || pathInfo.length() <= 1) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, " bad request");
                return;
            }
            Long bookId = Long.valueOf(pathInfo.substring(1)); // Remove the leading "/"
            User user = (User) req.getSession().getAttribute("user");
            int userId =  user.getId();
            List<UserBook> usersBookList = new UserBookDao().findUserBooksByUsersId(userId);
            Optional<UserBook> first = usersBookList.stream().filter(userBook -> userBook.getBook().getId().equals(bookId)).findFirst();
            if (first.isEmpty()) {
                new BookService().booking(bookId,userId);
                req.setAttribute("success", "Your book has been successfully added!");
            }
            else  req.setAttribute("error", "Your book is already exist!");

            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid category ID");
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        }
    }

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//       if(req.getSession().getAttribute("user")==null){
//
//           req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
//       }
//        try {
//            // Extract the category ID from the path
//            String pathInfo = req.getPathInfo(); // e.g., "/123"
//            if (pathInfo == null || pathInfo.length() <= 1) {
//                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, " bad request");
//                return;
//            }
//            Long bookId = Long.valueOf(pathInfo.substring(1)); // Remove the leading "/"
//            User user = (User) req.getSession().getAttribute("user");
//            int userId =  user.getId();
//            new BookService().booking(bookId,userId);
//            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
//        } catch (NumberFormatException e) {
//            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid category ID");
//        } catch (Exception e) {
//            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
//        if(req.getSession().getAttribute("user")==null){
//
//            req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
//        }
//        try {
//            // Extract the category ID from the path
//            String pathInfo = req.getPathInfo(); // e.g., "/123"
//            if (pathInfo == null || pathInfo.length() <= 1) {
//                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, " bad request");
//                return;
//            }
//            Long bookId = Long.valueOf(pathInfo.substring(1)); // Remove the leading "/"
//            User user = (User) req.getSession().getAttribute("user");
//            int userId =  user.getId();
//            new BookService().booking(bookId,userId);
//            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
//        } catch (NumberFormatException e) {
//            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid category ID");
//        } catch (Exception e) {
//            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
//        }
//    }
//
}
