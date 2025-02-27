package servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {

            Boolean logout = Boolean.parseBoolean(req.getParameter("logout"));

            // Let's logout the user
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.setAttribute("user", null);
                session.invalidate();
                req.setAttribute("message", "You have been logged out");
            }
            req.getRequestDispatcher("/").forward(req, res);
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }
}
