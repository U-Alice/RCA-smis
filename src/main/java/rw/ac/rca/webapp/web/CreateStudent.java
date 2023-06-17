package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.StudentDAO;
import rw.ac.rca.webapp.dao.impl.StudentDAOImpl;
import rw.ac.rca.webapp.orm.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

public class CreateStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private StudentDAO studentDAO = StudentDAOImpl.getInstance();

    public CreateStudent() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();

        if (pageRedirect != null && pageRedirect.equals("createStudent")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            Date dateOfBirth = new Date(); // Set the appropriate date of birth
            String phoneNumber = request.getParameter("phoneNumber");
            String studentId = request.getParameter("studentId");
            String major = request.getParameter("major");

            Student student = new Student();
            student.setFirstName(firstName);
            student.setLastName(lastName);
            student.setDateOfBirth(dateOfBirth);
            student.setPhoneNumber(phoneNumber);
            student.setStudentId(studentId);
            student.setMajor(major);

            studentDAO.saveStudent(student);

            httpSession.setAttribute("message", "Student created successfully");
        }

        request.getRequestDispatcher("WEB-INF/createStudent.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
