package servlet;

import dao.BookDao;
import dto.BookDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Book;
import service.BookService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@WebServlet("/")
public class MainLibraryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Установка атрибута
        String title = request.getParameter("search");
        Set<BookDto> allBookDtoByAuthorOrByTitle = new BookService().findAllBookDtoByAuthorOrByTitle(title);
        request.getSession().setAttribute("books", new BookDao().findAll());

        // Передача управления на JSP-страницу
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}