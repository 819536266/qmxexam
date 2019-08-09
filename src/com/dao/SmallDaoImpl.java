package com.dao;

import com.entity.Centre;
import com.entity.Small;
import com.util.HibernateSessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.util.List;

public class SmallDaoImpl implements SmallDao {

    @Override
    public boolean add(Small small) {
        Session session = HibernateSessionFactory.getSession();
        Transaction transaction = session.beginTransaction();
        try{
            Serializable save = session.save(small);

        }catch (Exception e){
            return false;
        }finally {
            transaction.commit();
            session.close();
        }
        return true;
    }

    @Override
    public List<Small> query(Centre centre) {
        Session session = HibernateSessionFactory.getSession();
        Query query=null;
        if (centre==null){
            query = session.createQuery("from Small");
        }else{
            query = session.createQuery("from Small c where c.smallPid=?");
            System.out.println(centre.getCentreId());
            query.setParameter(0,centre);
        }
        List<Small> list = query.list();
        HibernateSessionFactory.closeSession();
        return list;
    }

    @Override
    public void delete(Small small) {
        Session session = HibernateSessionFactory.getSession();
        Transaction transaction = session.beginTransaction();

        session.delete(small);
        transaction.commit();
        session.close();
    }

    @Override
    public void update() {

    }
}
