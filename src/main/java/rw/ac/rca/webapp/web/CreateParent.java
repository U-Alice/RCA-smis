package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.ParentDAO;
import rw.ac.rca.webapp.dao.impl.ParentDAOImpl;
import rw.ac.rca.webapp.orm.Parent;
import rw.ac.rca.webapp.orm.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CreateParent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ParentDAO parentDAO = ParentDAOImpl.getInstance();

    public CreateParent() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();

        if (pageRedirect != null && pageRedirect.equals("createParent")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String student = request.getParameter("student");
            String phoneNumber = request.getParameter("phoneNumber");

            Parent parent = new Parent();
            parent.setFirstName(firstName);
            parent.setLastName(lastName);
            parent.setStudent(student);
            parent.setPhoneNumber(phoneNumber);

            parentDAO.saveParent(parent);

            httpSession.setAttribute("message", "Parent created successfully");
        }

        request.getRequestDispatcher("WEB-INF/createParent.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

