package rw.ac.rca.webapp.dao;

import rw.ac.rca.webapp.orm.Marks;

import java.util.List;

public interface MarksDAO {

    void saveMarks(Marks marks);
    void updateMarks(Marks marks);
    void deleteMarks(Marks marks);
    Marks getMarksById(int id);

    Marks getMarksById(long id);

    List<Marks> getAllMarks();
}
