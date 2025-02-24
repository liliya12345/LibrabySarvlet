package servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/test")
public class MainLibraryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        List<String> list = new ArrayList<>();
        list.add("A");
        list.add("B");
        HttpSession session = req.getSession(false);
        try {

            req.setAttribute("name", "Tom");
            req.setAttribute("age", 34);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, res);


        } catch (Throwable e) {
            e.printStackTrace();
        }

    }

}