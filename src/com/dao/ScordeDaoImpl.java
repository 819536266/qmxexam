package com.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.entity.Scorde;
import com.entity.Student;
import com.util.HibernateSessionFactory;

public class ScordeDaoImpl implements ScordeDao{

	@Override
	public Scorde findEndScorde(Student student) {
		Session session = HibernateSessionFactory.getSession();
		Criteria createCriteria = session.createCriteria(Scorde.class);
		createCriteria.add(Restrictions.eq("stuSysid", student));
		createCriteria.setProjection(Projections.max("count"));
		List<Integer> list = createCriteria.list();
		if(list.size()>0){
			session.close();
			Session session1 = HibernateSessionFactory.getSession();
			Criteria createCriteria1 = session1.createCriteria(Scorde.class);
			createCriteria1.add(Restrictions.eq("stuSysid", student));
			createCriteria1.add(Restrictions.eq("count", list.get(0)));
			List<Scorde> list2 = createCriteria1.list();
			if(list.size()>0){
				session1.close();
				return list2.get(0);
			}
		}
		return null;
	}

	@Override
	public void saveScorde(Scorde studentScorde) {
		Session session = HibernateSessionFactory.getSession();
		Transaction beginTransaction = session.beginTransaction();
		try {
			
			Serializable save = session.save(studentScorde);
			beginTransaction.commit();
		} catch (Exception e) {
			new Exception("储存失败");
		}finally{
			session.close();
		}
	}

	//查询最近一次考试成绩
	@Override
	public Scorde selectBySclass(Student sclass) {
		Session session = HibernateSessionFactory.getSession();
		Transaction beginTransaction = session.beginTransaction();
		Criteria createCriteria = session.createCriteria(Scorde.class);
		createCriteria.add(Restrictions.eq("stuSysid", sclass));
		createCriteria.setProjection(Projections.max("testtime"));
		List<Date> list = createCriteria.list();
	
		if(list.size()>0){
			Query createQuery = session.createQuery("from Scorde where testtime=? and stuSysid=?");
			createQuery.setParameter(0, list.get(0));
			createQuery.setParameter(1,sclass);
			List<Scorde> scordelist = createQuery.list();
			if(scordelist.size()>0){
				return scordelist.get(0);
			}
			return null;
					
		}
		return null;
	}

	@Override
	public void updateScorde(Scorde studentScorde) {
		Session session = HibernateSessionFactory.getSession();
		Transaction beginTransaction = session.beginTransaction();
		try {
			
			session.update(studentScorde);
			beginTransaction.commit();
		} catch (Exception e) {
			new Exception("储存失败");
		}finally{
			session.close();
		}
		
	}

	@Override
	public void deleteScorde(Scorde scorde) {
		Session session = HibernateSessionFactory.getSession();
		Transaction beginTransaction = session.beginTransaction();
		try {
			session.delete(scorde);
			beginTransaction.commit();
		} catch (Exception e) {
			new Exception("删除");
		}finally{
			session.close();
		}
	}


}
