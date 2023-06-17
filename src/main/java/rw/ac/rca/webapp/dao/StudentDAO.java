package rw.ac.rca.webapp.dao;

import rw.ac.rca.webapp.orm.Student;

import java.util.List;

public interface StudentDAO {
    void saveStudent(Student student);
    void updateStudent(Student student);
    void deleteStudent(Student student);
    Student getStudentById(int id);
    List<Student> getAllStudent();


}

