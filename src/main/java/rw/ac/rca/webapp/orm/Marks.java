package rw.ac.rca.webapp.orm;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Mark class represents a student's mark for a specific course.
 */
@Entity
@Table(name ="mark")
public class Marks {
    private double marksScored;
    private double totalMarks;
    private String gradeGotten;
    private Course course;
    private Student student;

    public Marks() {
        // Default constructor
    }

    public Marks(double marksScored, double totalMarks, String gradeGotten, Course course, Student student) {
        this.marksScored = marksScored;
        this.totalMarks = totalMarks;
        this.gradeGotten = gradeGotten;
        this.course = course;
        this.student = student;
    }

    public double getMarksScored() {
        return marksScored;
    }

    public void setMarksScored(double marksScored) {
        this.marksScored = marksScored;
    }

    public double Marks() {
        return totalMarks;
    }

    public void Marks(double totalMarks) {
        this.totalMarks = totalMarks;
    }

    public String getGradeGotten() {
        return gradeGotten;
    }

    public void setGradeGotten(String gradeGotten) {
        this.gradeGotten = gradeGotten;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
