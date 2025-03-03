package servlet;

import dao.UserBookDao;
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
import model.UserBook;
import service.BookService;

import java.io.IOException;
import java.util.*;

@WebServlet("/searchuser/*")
public class SearchUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        String search = req.getParameter("search1");
        req.getSession().setAttribute("search", search);
//        User us = new UserDao().getUser(search);
//
//        if (Objects.equals(pathInfo, "/change_username")) {
//            String username = req.getParameter("username");
//            us.setUsername(username);
//            new UserDao().update(us);
//            resp.sendRedirect(req.getContextPath() + "/searchuser");
//
//
//        } else if (Objects.equals(pathInfo, "/change_firstname")) {
//            String firstname = req.getParameter("firstname");
//            us.setFirsName(firstname);
//            new UserDao().update(us);
//            resp.sendRedirect(req.getContextPath() + "/searchuser");
//        }else if (Objects.equals(pathInfo, "/change_lastname")) {
//            String lastname = req.getParameter("lastname");
//            us.setLastName(lastname);
//            new UserDao().update(us);
//            resp.sendRedirect(req.getContextPath() + "/searchuser");
//        }

////                req.getSession().setAttribute("id", id);
////                req.getSession().setAttribute("firstname", user.getFirsName());
////                req.getSession().setAttribute("lastname", user.getLastName());
////                req.getSession().setAttribute("created", user.getCreated());
////                req.getSession().setAttribute("lastlogin", user.getLastLogin());
////                req.getSession().setAttribute("role", user.getRole());
//////                req.getSession().setAttribute("books", user.getUserBook().stream().findAny().orElse(null).);
////                List<UserBook> userBooksByUsersId = new UserBookDao().findUserBooksByUsersId(id);
////                for (UserBook userBook : userBooksByUsersId) {
////                   req.getSession().setAttribute("userBook", userBook);
////                  req.getSession().setAttribute("title", userBook.getBook().getTitle());
////                  req.getSession().setAttribute("bookid", userBook.getBook().getId());
////                  req.getSession().setAttribute("dateofreturn", userBook.getDateOfLoan());
////                  req.getSession().setAttribute("dateofloan", userBook.getDateOfReturn());
//                }
//
//            }
//
//        }

//            req.getSession().setAttribute("username", first.get().getId());
//            req.getSession().setAttribute("username", first.get().getUsername());
//            req.getSession().setAttribute("firstname", first.get().getFirsName());
//            req.getSession().setAttribute("lastname", first.get().getLastName());

//        }
//        User username = new UserDao().getUser(search);
//        req.getSession().setAttribute("username", first.get());
//        resp.sendRedirect(req.getContextPath() + "/searchuser");
        req.getRequestDispatcher("/view/searchbyuser.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Set<Book> result = new HashSet<>();
        String title = req.getParameter("search1");
//        req.getSession().setAttribute("users", allBookDtoByAuthorOrByTitle);
//        String pathInfo = req.getPathInfo();
//        String search = req.getParameter("search1");
//        req.getSession().setAttribute("search", search);


//        if (Objects.equals(pathInfo, "/change_username")) {
//            User us = new UserDao().getUser(search);
//            if (us != null) {
//                String username = req.getParameter("username");
//                us.setUsername(username);
//                new UserDao().update(us);
//                resp.sendRedirect(req.getContextPath() + "/searchuser");
//            }
//            resp.sendRedirect(req.getContextPath() + "/searchuser");
//
//
//        } else if (Objects.equals(pathInfo, "/change_firstname")) {
//            User us = new UserDao().getUser(search);
//            if (us != null) {
//                String firstname = req.getParameter("firstname");
//                us.setFirsName(firstname);
//                new UserDao().update(us);
//                resp.sendRedirect(req.getContextPath() + "/searchuser");
//            }
//            resp.sendRedirect(req.getContextPath() + "/searchuser");
//        } else if (Objects.equals(pathInfo, "/change_lastname")) {
//            User us = new UserDao().getUser(search);
//            if (us != null) {
//                String lastname = req.getParameter("lastname");
//                us.setLastName(lastname);
//                new UserDao().update(us);
//                resp.sendRedirect(req.getContextPath() + "/searchuser");
//            }
//
//            resp.sendRedirect(req.getContextPath() + "/searchuser");
//        }
        resp.sendRedirect(req.getContextPath() + "/searchuser");
    }
}