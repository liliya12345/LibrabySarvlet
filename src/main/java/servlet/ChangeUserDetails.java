package servlet;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.util.Objects;

@WebServlet("/change/*")
public class ChangeUserDetails extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pathInfo = req.getPathInfo();
        String search = req.getParameter("search1");

        if (Objects.equals(pathInfo, "/change_username")) {
            User us = new UserDao().getUser(search);
            if (us != null) {
                String username = req.getParameter("username");
                us.setUsername(username);
                new UserDao().update(us);
                resp.sendRedirect(req.getContextPath() + "/searchuser");
            }
            resp.sendRedirect(req.getContextPath() + "/searchuser");


        } else if (Objects.equals(pathInfo, "/change_firstname")) {
            User us = new UserDao().getUser(search);
            if (us != null) {
                String firstname = req.getParameter("firstname");
                us.setFirsName(firstname);
                new UserDao().update(us);
                resp.sendRedirect(req.getContextPath() + "/searchuser");
            }
        } else if (Objects.equals(pathInfo, "/change_lastname")) {
            User us = new UserDao().getUser(search);
            if (us != null) {
                String lastname = req.getParameter("lastname");
                us.setLastName(lastname);
                new UserDao().update(us);
                resp.sendRedirect(req.getContextPath() + "/searchuser");
            }


        }
//        resp.sendRedirect(req.getContextPath() + "/searchuser");
    }
}
