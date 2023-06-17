package rw.ac.rca.webapp.dao.impl;


import org.hibernate.Session;
import org.hibernate.Transaction;
import rw.ac.rca.webapp.dao.MarksDAO;
import rw.ac.rca.webapp.orm.Marks;
import rw.ac.rca.webapp.util.HibernateUtil;

import java.util.List;

public class MarksDAOImpl implements MarksDAO {
    private static MarksDAOImpl instance;
    private Session session;

    private MarksDAOImpl() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public static MarksDAOImpl getInstance() {
        if (instance == null) {
            instance = new MarksDAOImpl();
        }
        return instance;
    }

    @Override
    public void saveMarks(Marks marks) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(marks);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public void updateMarks(Marks marks) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(marks);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMarks(Marks marks) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(marks);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }


    @Override
    public Marks getMarksById(int id) {
        return (Marks) session.get(Marks.class, id);
    }

    @Override
    public Marks getMarksById(long id) {
        return null;
    }


    @Override
    public List<Marks> getAllMarks() {
        List<Marks> marks = null;
        try {
            marks = session.createQuery("FROM Mark").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return marks;
    }
}
