package com.dao;

import com.entity.Bigtype;
import com.entity.Centre;
import com.util.HibernateSessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.util.List;

public class CentreDaoImpl implements CentreDao {


    @Override
    public boolean add(Centre centre) {
        Session session = HibernateSessionFactory.getSession();
        Transaction transaction = session.beginTransaction();
        try{

            Serializable save = session.save(centre);

        }catch (Exception e){
            return false;
        }finally {
            transaction.commit();
            session.close();
        }
        return true;
    }

    @Override
    public List<Centre> query(Bigtype centrePid) {
        System.out.println(centrePid);
        Session session = HibernateSessionFactory.getSession();
        Query query=null;
        if (centrePid==null){
            query = session.createQuery("from Centre");
        }else{
            query = session.createQuery("from Centre c where c.centrePid=?");
            query.setParameter(0,centrePid);
        }
        List<Centre> list = query.list();
        for (Centre centre:list) {
            Bigtype bigtype = new Bigtype();
            bigtype.setBigId(centre.getCentrePid().getBigId());
            centre.setCentrePid(bigtype);
            centre.setList(null);
        }
        session.close();
        return list;
    }

    @Override
    public void delete(Centre centre) {
        Session session = HibernateSessionFactory.getSession();
        Transaction transaction = session.beginTransaction();
        Centre o = (Centre) session.get(Centre.class, centre.getCentreId());
        session.delete(o);
        transaction.commit();
        session.close();
    }

    @Override
    public void update() {

    }
}
