package com.dao;

import com.entity.Bigtype;
import com.util.HibernateSessionFactory;
import com.util.Page;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.util.List;

public class BigtypeDaoImpl implements  BigtypeDao{

    @Override
    public boolean add(Bigtype bigtype) {
        Session session = HibernateSessionFactory.getSession();
        Transaction transaction = session.beginTransaction();
        try{
            Serializable save = session.save(bigtype);

        }catch (Exception e){
            return false;
        }finally {
            transaction.commit();
            session.close();
        }
        return true;
    }

    @Override
    public List<Bigtype> query(Page page) {
        Session session = HibernateSessionFactory.getSession();
        Query query = session.createQuery("from Bigtype");
        query.setMaxResults(page.getEveryPage());//每页显示的数量
        query.setFirstResult(page.getBeginIndex());//起始位置
        List<Bigtype> list = query.list();
        HibernateSessionFactory.closeSession();
        return list;
    }

    @Override
    public void delete(Bigtype bigtype) {
        Session session = HibernateSessionFactory.getSession();
        Transaction transaction = session.beginTransaction();
        Bigtype o = (Bigtype) session.get(Bigtype.class, bigtype.getBigId());
        session.delete(o);
        transaction.commit();
        session.close();
    }

    @Override
    public void update() {

    }

    @Override
    public int countBigtype() {
        Session session = HibernateSessionFactory.getSession();
        List<Bigtype> list = session.createQuery("from Bigtype").list();
        HibernateSessionFactory.closeSession();
        return list.size();
    }

    @Override
    public List<Bigtype> queryall() {
        Session session = HibernateSessionFactory.getSession();
        List<Bigtype>  from_bigtype = session.createQuery("from Bigtype").list();
        for (Bigtype bigtype:
        from_bigtype) {
            bigtype.setSr(null);
        }
        session.close();

        return from_bigtype;
    }
}
