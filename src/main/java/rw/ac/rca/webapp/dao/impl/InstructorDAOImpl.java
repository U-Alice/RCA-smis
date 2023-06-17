package rw.ac.rca.webapp.dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;
import rw.ac.rca.webapp.dao.InstructorDAO;
import rw.ac.rca.webapp.orm.Instructor;
import rw.ac.rca.webapp.util.HibernateUtil;

import java.util.List;

public class InstructorDAOImpl implements InstructorDAO {
    private static InstructorDAOImpl instance;
    private Session session;

    private InstructorDAOImpl() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public static InstructorDAOImpl getInstance() {
        if (instance == null) {
            instance = new InstructorDAOImpl();
        }
        return instance;
    }

    @Override
    public void saveInstructor(Instructor instructor) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(instructor);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public void updateInstructor(Instructor instructor) {

    }

    @Override
    public void deleteInstructor(Instructor instructor) {

    }

    @Override
    public Instructor getInstructorById(long id) {
        return null;
    }

    @Override
    public List<Instructor> getAllInstructors() {
        List<Instructor> instructors = null;
        try {
            instructors = session.createQuery("FROM Instructor").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return instructors;
    }
}
