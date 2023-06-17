package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.MarksDAO;
import rw.ac.rca.webapp.dao.impl.MarksDAOImpl;
import rw.ac.rca.webapp.orm.Course;
import rw.ac.rca.webapp.orm.Marks;
import rw.ac.rca.webapp.orm.Student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateMark
 */
public class CreateMark extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MarksDAO marksDAO = MarksDAOImpl.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateMark() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();

        if (pageRedirect != null && pageRedirect.equals("createMark")) {
            String studentName = request.getParameter("student_name");
            double marksScored = Double.parseDouble(request.getParameter("marks_scored"));
            double marks = Double.parseDouble(request.getParameter("total_marks"));
            String gradeGotten = request.getParameter("grade_gotten");
            String courseName = request.getParameter("course_name");

            // Retrieve student and course objects from the database using their names or IDs
            Student student = getStudentByName(studentName);
            Course course = getCourseByName(courseName);

            Marks mark = new Marks();
            mark.setMarksScored(marksScored);
            mark.Marks(marks);
            mark.setGradeGotten(gradeGotten);
            mark.setCourse(course);
            mark.setStudent(student);

            marksDAO.saveMarks(mark);

            httpSession.setAttribute("message", "Mark created successfully");
        }

        request.getRequestDispatcher("WEB-INF/createMark.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    // Helper method to retrieve a student by name from the database
    private Student getStudentByName(String studentName) {
        // Implement your logic here to retrieve the student object from the database using the name
        // You can use the StudentDAO or any other method to fetch the student based on the name
        // Example implementation:
        // StudentDAO studentDAO = StudentDAOImpl.getInstance();
        // return studentDAO.getStudentByName(studentName);
        return null;
    }

    // Helper method to retrieve a course by name from the database
    private Course getCourseByName(String courseName) {
        // Implement your logic here to retrieve the course object from the database using the name
        // You can use the CourseDAO or any other method to fetch the course based on the name
        // Example implementation:
        // CourseDAO courseDAO = CourseDAOImpl.getInstance();
        // return courseDAO.getCourseByName(courseName);
        return null;
    }
}
