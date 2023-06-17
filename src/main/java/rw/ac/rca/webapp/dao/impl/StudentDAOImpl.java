package rw.ac.rca.webapp.dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;
import rw.ac.rca.webapp.dao.StudentDAO;
import rw.ac.rca.webapp.orm.Student;
import rw.ac.rca.webapp.util.HibernateUtil;

import java.util.List;

public class StudentDAOImpl implements StudentDAO {
    private static StudentDAOImpl instance;
    private Session session;

    private StudentDAOImpl() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public static StudentDAOImpl getInstance() {
        if (instance == null) {
            instance = new StudentDAOImpl();
        }
        return instance;
    }

    @Override
    public void saveStudent(Student student) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(student);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public void updateStudent(Student student) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(student);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public void deleteStudent(Student student) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(student);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public Student getStudentById(int id) {
        return (Student) session.get(Student.class, id);
    }

    @Override
    public List<Student> getAllStudent() {
        List<Student> students = null;
        try {
            students = session.createQuery("FROM Student").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }


}
