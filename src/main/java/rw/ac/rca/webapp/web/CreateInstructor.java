package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.InstructorDAO;
import rw.ac.rca.webapp.dao.impl.InstructorDAOImpl;
import rw.ac.rca.webapp.orm.Instructor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

/**
 * Servlet implementation class CreateInstructor
 */
public class CreateInstructor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private InstructorDAO instructorDAO = InstructorDAOImpl.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateInstructor() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();

        if (pageRedirect != null && pageRedirect.equals("createInstructor")) {
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                double salary = Double.parseDouble(request.getParameter("salary"));
                Date remunerationDate = new Date();


                Instructor instructor = new Instructor();
                instructor.setFirstName(firstName);
                instructor.setLastName(lastName);
                instructor.setSalary(salary);
                instructor.setRemunerationDate(remunerationDate);

                instructorDAO.saveInstructor(instructor);

                httpSession.setAttribute("message", "Instructor created successfully");
            }

            request.getRequestDispatcher("WEB-INF/createInstructor.jsp").forward(request, response);
        }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
