package servlets;

import classes.DBManager;
import classes.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/tasks")
public class HomeServlets extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Tasks> tasks = DBManager.getAllTasks();
        req.setAttribute("task", tasks);
        req.getRequestDispatcher("/WebContent/tasks.jsp").forward(req, resp);

    }
}
