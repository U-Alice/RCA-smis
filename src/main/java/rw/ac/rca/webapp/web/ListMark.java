package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.MarksDAO;
import rw.ac.rca.webapp.dao.impl.MarksDAOImpl;
import rw.ac.rca.webapp.orm.Marks;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListMark extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MarksDAO marksDAO = MarksDAOImpl.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        Object user = httpSession.getAttribute("authenticatedUser");

        if (user != null) {
            try {
                List<Marks> marks = marksDAO.getAllMarks();
                request.setAttribute("marks", marks);
                request.getRequestDispatcher("WEB-INF/listMarks.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Failed to retrieve marks");
                request.getRequestDispatcher("WEB-INF/listMarks.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "No user found");
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }
    }
}
