package servlet;

import dao.UserDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.HashingUtil;

import java.util.Optional;
import java.util.stream.Stream;


@WebServlet("/register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {
            req.getRequestDispatcher("view/register.jsp").forward(req, res);
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) {

        String username = req.getParameter("username") == null ? "" : req.getParameter("username");
        String firstname = req.getParameter("firstname") == null ? "" : req.getParameter("firstname");
        String lastname = req.getParameter("lastname") == null ? "" : req.getParameter("lastname");
        String password1 = req.getParameter("password1") == null ? "" : req.getParameter("password1");
        String password2 = req.getParameter("password2") == null ? "" : req.getParameter("password2");
        String error = null;

        if (username.isBlank() || password1.isBlank() || password2.isBlank()) {
            error = "Please fill all the required fields";
        }
        if (!password1.equals(password2)) {
            error = "Passwords do not match";
        }

        if (error != null) {

            req.setAttribute("error", error);
            req.setAttribute("username", username);
            req.setAttribute("firstname", firstname);
            req.setAttribute("lastname", lastname);
            req.setAttribute("password1", password1);
            req.setAttribute("password2", password2);

            try {
                System.out.println("Returning with error: " + error);
                req.getRequestDispatcher("view/register.jsp").forward(req, res);
            } catch (Throwable e) {
                throw new RuntimeException(e);
            }
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setFirsName(firstname);
        user.setLastName(lastname);
        user.setPassword(HashingUtil.Encrypt(password1));
        UserDao userDAO = new UserDao();
        try {
            Optional<User> first = userDAO.findAll().stream().filter(u -> u.getUsername().equals(username)).findFirst();
           if( first.isEmpty()){
               userDAO.save(user);
               req.setAttribute("success", "Your user has been successfully registered!");
               req.getRequestDispatcher("/index.jsp").forward(req, res);
           }
            else {
                req.setAttribute("error", "Your username is already exist");

           }
        } catch (Throwable e) {
            req.setAttribute("error", "Your user could not be created");
            System.out.println(e.getMessage());
        }
//        try {
////            req.getRequestDispatcher("/index.jsp").forward(req, res);
//        }
//        catch (Throwable e) {
//            throw new RuntimeException(e);
//        }
    }

}
