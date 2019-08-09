package com.dao;

import com.entity.Centre;
import com.entity.Target;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.util.HibernateSessionFactory;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public class BaseDaoImpl<T> implements BaseDao {

    @Override
    public void delete(Object object) {
        Session session = HibernateSessionFactory.getSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.delete(object);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            session.close();
        }
    }

    @Override
    public Object find(Object object, int id) {
        Session session = HibernateSessionFactory.getSession();
        Object returnObject = null;
        returnObject = session.get(object.getClass(), id);
        HibernateSessionFactory.closeSession();
        return returnObject;
    }

    @Override
    public void save(Object object) {
        Session session = HibernateSessionFactory.getSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.save(object);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            session.close();
        }
    }


    @Override
    public void update(Object object) {
        Session session = HibernateSessionFactory.getSession();

        Transaction transaction = session.beginTransaction();
        try {
            session.update(object);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            session.close();
        }
    }

    @Override
    public List<T> getByCriteria(DetachedCriteria detachedCriteria) {
        Session session = HibernateSessionFactory.getSession();
        Criteria executableCriteria =detachedCriteria.getExecutableCriteria(session);
        List<T> list = executableCriteria.list();
        HibernateSessionFactory.closeSession();
        return list;
    }

}
