package rw.ac.rca.webapp.dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;
import rw.ac.rca.webapp.dao.ParentDAO;
import rw.ac.rca.webapp.orm.Parent;
import rw.ac.rca.webapp.util.HibernateUtil;

import java.util.List;

public class ParentDAOImpl implements ParentDAO {
    private static ParentDAOImpl instance;
    private Session session;

    private ParentDAOImpl() {
        session = HibernateUtil.getSessionFactory().openSession();
    }

    public static ParentDAOImpl getInstance() {
        if (instance == null) {
            instance = new ParentDAOImpl();
        }
        return instance;
    }

    @Override
    public Parent saveParent(Parent parent) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(parent);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return parent;
    }

    @Override
    public Parent updateParent(Parent parent) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(parent);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return parent;
    }

    @Override
    public Parent saveOrUpdateParent(Parent parent) {
        return null;
    }

    @Override
    public boolean deleteParent(Parent parent) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(parent);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Parent getParentById(int parentId) {
        return null;
    }

    @Override
    public Parent getParentById(long id) {
        Parent parent = null;
        try {
            parent = (Parent) session.get(Parent.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return parent;
    }

    @Override
    public List<Parent> getAllParents() {
        List<Parent> parents = null;
        try {
            parents = session.createQuery("FROM Parent").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return parents;
    }
}
