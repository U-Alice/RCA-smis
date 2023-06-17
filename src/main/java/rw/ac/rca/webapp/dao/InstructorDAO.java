package rw.ac.rca.webapp.dao;

import rw.ac.rca.webapp.orm.Instructor;

import java.util.List;

public interface InstructorDAO {
    void saveInstructor(Instructor instructor);
    void updateInstructor(Instructor instructor);
    void deleteInstructor(Instructor instructor);
    Instructor getInstructorById(long id);
    List<Instructor> getAllInstructors();
}

