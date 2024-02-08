package servlets;

import classes.DBManager;
import classes.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.http.HttpRequest;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.valueOf(req.getParameter("id"));

        Tasks task = DBManager.getTask(id);
        req.setAttribute("zadacha", task);
        req.getRequestDispatcher("/WebContent/details.jsp").forward(req, resp);
    }
}
