package com.dao;

import com.entity.Target;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.util.HibernateSessionFactory;

public class BaseDaoImpl implements BaseDao {

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

}
