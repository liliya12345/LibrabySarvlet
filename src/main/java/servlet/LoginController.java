package servlet;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.HashingUtil;

import java.io.IOException;
import java.util.Date;
import java.util.Optional;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {

            Boolean logout = Boolean.parseBoolean(req.getParameter("logout"));
            if(logout) {
                // Let's logout the user
                HttpSession session = req.getSession(false);
                if(session != null) {
                    session.setAttribute("user", null);
                    session.invalidate();
                }
                req.setAttribute("message", "You have been logged out");
            }
            req.getRequestDispatcher("/view/login.jsp").forward(req, res);
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) {

        String username = req.getParameter("username") == null ? "" :
                req.getParameter("username");
        String password = req.getParameter("password") == null ? "" :
                req.getParameter("password");
        String error = "";


        if(username.isBlank() || password.isBlank()) {
            error(req, res, "Please fill all the required fields!", username);
            return;
        }

        UserDao userDAO = new UserDao();
        User user = null;


        Optional<User> first = new UserDao().findAll().stream().filter(u -> u.getUsername().equals(username)).findFirst();
        if(first.isPresent()) {
            user = first.get();
            if(!HashingUtil.Verify(password, user.getPassword())){
                error(req, res, "Invalid password!", username);
                req.setAttribute("message", "You have Invalid password");

            }
        }else req.setAttribute("message", "You have a wrongg username");


        try {
            user = userDAO.getUser(username);
            if(user == null){
                error(req, res, "User not found", username);
                return;
            }
            if(!HashingUtil.Verify(password, user.getPassword())){

                error(req, res, "Wrong password", username);
                res.sendRedirect(req.getContextPath() + "/user");
                return;
            }

            user.setLastLogin(new Date());
            userDAO.update(user);

            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            if (user.getRole().equals("admin")) {
                res.sendRedirect(req.getContextPath() + "/admin");
            }
            else res.sendRedirect(req.getContextPath() + "/user");

        } catch (Exception e) {
            error = e.getMessage();
        }

    }

    private void error(HttpServletRequest req, HttpServletResponse res, String error, String username){
        req.setAttribute("error", error);
        req.setAttribute("username", username);

        try {
            System.out.println("Returning with error: " + error);
            res.sendRedirect(req.getContextPath() + "/login");
//            req.getRequestDispatcher("/view/login.jsp").forward(req, res);
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

}
