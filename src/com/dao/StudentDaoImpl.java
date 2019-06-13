package com.dao;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.entity.Scorde;
import com.entity.Student;
import com.entity.Subject;
import com.util.Condition;
import com.util.HibernateSessionFactory;
import com.util.Page;

public class StudentDaoImpl extends BaseDaoImpl implements StudentDao {
	@Override
	public Student findBySysid(Integer sysid) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Student student where sysid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, sysid);
		Student student = (Student) query.uniqueResult();
		System.out.println(student.getSr());
		HibernateSessionFactory.closeSession();
		return student;
	}
	/**
	 * 根据学号查找员工
	 * 
	 */
	@Override
	public Student findByStudenID(String studentID) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Student student where studentID=?";
		Query query = session.createQuery(hql);
		query.setString(0, studentID);
		Student student = (Student) query.uniqueResult();
		HibernateSessionFactory.closeSession();
		return student;
	}
	/**
	 * 根据员工部门查找员工 -分页查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> findByStudentClass(String sclass,Page page) {
		String hql = "from Student as stu where stu.sclass=:sclass";
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery(hql);
		query.setString("sclass", sclass);
		query.setMaxResults(page.getEveryPage());//每页显示的数量
		query.setFirstResult(page.getBeginIndex());//起始位置
		List<Student> list = query.list();
		HibernateSessionFactory.closeSession();
		return list;
	}
	/**
	 * 根据员工姓名查找
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> findByStudentName(String name) {
		String hql = "from Student as stu where stu.studentName=:studentName";
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery(hql);
		query.setString("studentName", name);
		List<Student> list = query.list();
		HibernateSessionFactory.closeSession();
		return list;
	}
	/**
	 * 更新员工信息
	 */
	@Override
	public void updateStudent(Student student) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.update(student);
			transaction.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			transaction.rollback();//回滚事务
		}finally{
			HibernateSessionFactory.closeSession();
		}

	}
	/**
	 * 保存一条员工记录
	 */
	@Override
	public int save(Student student) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = session.beginTransaction();
		 Serializable save=0;
		try {
			 save = session.save(student);
			  transaction.commit();
			return (Integer) save;
		} catch (HibernateException e) {
			e.printStackTrace();
			transaction.rollback();
		}finally{
			HibernateSessionFactory.closeSession();
		}
		return (Integer) save;
	}
	/**
	 * 查询所有员工 -分页查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Scorde> findStudentsByPage(Condition condition,Page page) {
		Session session = HibernateSessionFactory.getSession();
		String type="desc";
		if(condition.getType()!=null&&condition.getType().equals("2")){
				type="asc";
		}
		String where="";
		boolean equals = where.equals("");
		if(condition.getSclass()!=null){

			where+=" stu.sclass=? ";
		}
		if(condition.getAssess()!=null){
			equals = where.equals("");
			if(!equals){
				where+=" and ";
			}
			where+=" con.assess=? ";
		}

		if(condition.getTerm()!=null){
			equals = where.equals("");
			if(!equals){
				where+=" and ";
			}
			where+="  DATE_FORMAT( con.testtime, '%Y%m' ) = DATE_FORMAT( ? , '%Y%m' ) ";
		}
		if(condition.getName()!=null){
			equals = where.equals("");
			if(!equals){
				where+=" and ";
			}
			where+="  stu.studentName like ? ";
		}
		equals = where.equals("");
		String where1="";
		if(!equals){
			where1=" where ";
		}

		String hql="select  *"+
				"from db_student_scorde as db inner join "+
				"(select stu.sysid as stuid ,stu.studentName as stuName,stu.`password` as stupass,stu.studentID" +
				" as sID ,stu.sclass as stusclass,stu.term as stuterm  , MAX(con.count) as time"+
				" from  db_student stu inner join db_student_scorde con on stu.sysid=con.stu_sysid "+
				where1+where+" group by stu.sysid) as st "+
				"on st.stuid=db.stu_sysid and st.time=db.count ORDER BY db.score "+type;
		SQLQuery createSQLQuery = session.createSQLQuery(hql);
		int Parameter=0;
		if(condition.getSclass()!=null){
			createSQLQuery.setParameter(0, condition.getSclass());
			Parameter+=1;
		}
		if(condition.getAssess()!=null){
			createSQLQuery.setParameter(Parameter, condition.getAssess());
			Parameter+=1;
		}
		if(condition.getTerm()!=null){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yymm");
			try {
				Date parse = simpleDateFormat.parse(condition.getTerm());
				simpleDateFormat.applyPattern("yyyy-mm-dd");
				System.out.println(simpleDateFormat.format(parse));
				createSQLQuery.setParameter(Parameter, simpleDateFormat.format(parse));
				Parameter+=1;
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if(condition.getName()!=null){
			createSQLQuery.setParameter(Parameter, "%"+condition.getName()+"%");
		}
		if(page!=null){
			createSQLQuery.setMaxResults(page.getEveryPage());//每页显示的数量
			createSQLQuery.setFirstResult(page.getBeginIndex());//起始位置
		}
		List<Scorde> arrayList = new ArrayList<Scorde>();
		List<Object[]> list = createSQLQuery.list();
		for (Object[] objects : list) {
			Scorde scorde = new Scorde();
			Student student = new Student();
			scorde.setScordeId((int) objects[0]);
			scorde.setTimescore((Integer) objects[2]);
			scorde.setCount((Integer) objects[3]);
			scorde.setTesttime((Date) objects[4]);
			scorde.setAssess((String) objects[5]);
			student.setSysid((Integer) objects[6]);
			student.setStudentName((String) objects[7]);
			student.setPassword((String) objects[8]);
			student.setStudentID((String) objects[9]);
			student.setSclass((String) objects[10]);
			student.setTerm((String) objects[11]);
			student.getSr().add(scorde);
			scorde.setStuSysid(student);
			arrayList.add(scorde);
		}
		HibernateSessionFactory.closeSession();
		return arrayList;
	}
	/**
	 * 查询部门员工 -分页查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> findStudentsByClass(String sclass, Page page) {
		String hql = "from Student as stu where stu.sclass=:sclass";
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery(hql);
		query.setString("sclass", sclass);
		query.setMaxResults(page.getEveryPage());//每页显示的数量
		query.setFirstResult(page.getBeginIndex());//起始位置
		List<Student> list = query.list();
		HibernateSessionFactory.closeSession();
		return list;
	}
	/**
	 * 返回所有员工数量
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int fintStudentCount(Condition condition) {
		Session session = HibernateSessionFactory.getSession();
		/*Criteria createCriteria = forClass.getExecutableCriteria(session);
		createCriteria.setProjection(Projections.rowCount());
		int parseInt = Integer.parseInt(createCriteria.uniqueResult().toString());*/
		SQLQuery createSQLQuery =null;
		String hql=null;
		String type="desc";
		if(condition.getType().equals("2")){
				type="asc";
		}

		String where="";
		boolean equals = where.equals("");
		if(condition.getSclass()!=null){
			where+=" stu.sclass=? ";

		}
		if(condition.getAssess()!=null){
			equals = where.equals("");
			if(!equals){
				where+=" and ";
			}
			where+=" con.assess=? ";
		}
		if(condition.getTerm()!=null){
			equals = where.equals("");
			if(!equals){
				where+=" and ";
			}
			where+="  DATE_FORMAT( con.testtime, '%Y%m' ) = DATE_FORMAT( ? , '%Y%m' ) ";
		}
		if(condition.getName()!=null){
			equals = where.equals("");
			if(!equals){
				where+=" and ";
			}
			where+="  stu.studentName like ? ";
		}
		equals = where.equals("");
		String where1="";
		if(!equals){
			where1=" where ";
		}
		hql="select  count(*)"+
				" from db_student_scorde as db inner join "+
				"(select stu.sysid as stuid ,stu.studentName as stuName,stu.`password` as stupass,stu.studentID as sID ,stu.sclass as stusclass,stu.term as stuterm  , MAX(con.count) as time"+
				" from  db_student stu inner join db_student_scorde con on stu.sysid=con.stu_sysid "+
				where1+ where+" group by stu.sysid) as st "+
				"on st.stuid=db.stu_sysid and st.time=db.count ORDER BY db.score "+type;
		createSQLQuery = session.createSQLQuery(hql);
		int Parameter=0;
		if(condition.getSclass()!=null){
			createSQLQuery.setParameter(0, condition.getSclass());
			Parameter+=1;
		}
		if(condition.getAssess()!=null){
			createSQLQuery.setParameter(Parameter, condition.getAssess());
			Parameter+=1;
		}
		if(condition.getTerm()!=null){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yymm");
			try {
				Date parse = simpleDateFormat.parse(condition.getTerm());
				simpleDateFormat.applyPattern("yyyy-mm-dd");
				System.out.println(simpleDateFormat.format(parse));
				createSQLQuery.setParameter(Parameter, simpleDateFormat.format(parse));
				Parameter+=1;
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}

		if(condition.getName()!=null){
			createSQLQuery.setParameter(Parameter, "%"+condition.getName()+"%");
		}
		List<Object> list = createSQLQuery.list();
		
		HibernateSessionFactory.closeSession();
		return Integer.parseInt(list.get(0).toString());
	}
	/**
	 * 返回部门员工数量
	 */
	@Override
	public int fintStudentCountByClass(String sclass) {
		String hql = "from Student as stu where stu.sclass=:sclass";
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery(hql);
		query.setString("sclass", sclass);
		int count = query.list().size();
		HibernateSessionFactory.closeSession();
		return count;
	}
	
	/*
	 * 2019.3.6 牛牛修改
	 * 删除单条员工信息
	 * */
	
	@Override
	public void deleteStudent(Integer sysid) {
		Set<Scorde>  sr=new HashSet<Scorde>();
		Session session = HibernateSessionFactory.getSession();
		Student object = (Student) session.get(Student.class,sysid);
		sr= object.getSr();
		if(sr.size()>0){
			session.close();
			Session session2 = HibernateSessionFactory.getSession();
			Transaction beginTransaction2 = session2.beginTransaction();
			for (Scorde scorde : sr) {
				session2.delete(scorde);
			}
			beginTransaction2.commit();
			session2.close();
		}
		Session session3 = HibernateSessionFactory.getSession();
		Transaction beginTransaction3 = session3.beginTransaction();
		session3.delete(object);
		beginTransaction3.commit();
		session3.close();
	}
	/*
	 *按照员工ID修改信息
	 * */
	@Override
	public void updateStudent(String studentName,String term,String sclass,Integer sysid) {
		// TODO Auto-generated method stub
		String sql= "UPDATE Student SET studentName = ?,sclass=? ,term=? WHERE sysid =?";
	     
		  Session  session = HibernateSessionFactory.getSession();
		  Transaction beginTransaction = session.beginTransaction();
		  Query query=session.createQuery(sql);
		  
        //query类中索引从0开始，0代表第一个问号；
		  query.setParameter(0,studentName);
		  query.setParameter(1,sclass);
		  query.setParameter(2,term);
		  query.setParameter(3, sysid);

		  query.executeUpdate();

		  beginTransaction.commit();
		 session.close();
	}
	@Override
	public List<Student> selectBySclass(DetachedCriteria forClass) {
		Session session = HibernateSessionFactory.getSession();

		Criteria criteria = forClass.getExecutableCriteria(session);
		List<Student> list = criteria.list();
		HibernateSessionFactory.closeSession();
		return list;
	}
	//根据身份证查找
	@Override
	public Student findByPassword(String password) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Student student where password=?";
		Query query = session.createQuery(hql);
		query.setString(0, password);
		Student student = (Student) query.uniqueResult();
		HibernateSessionFactory.closeSession();
		return student;
	}
	@Override
	public Student login(String studentID, String password) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Student student where studentName=? and password=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, studentID);
		query.setParameter(1, password);
		Student student = (Student) query.uniqueResult();
		System.out.println(student.getSr());
		HibernateSessionFactory.closeSession();
		return student;
	}
	@Override
	public Student getStudentBySclass(String sclass) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "select * from db_student where sclass=?  order by cast(term as UNSIGNED INTEGER) desc";
		SQLQuery query = session.createSQLQuery(hql);
		query.setParameter(0, sclass);
		List<Object[]> list = query.list();
		if(list.size()>0){
			Student student = new Student();
			Object[] objects = list.get(0);
			student.setSysid((Integer) objects[0]);
			student.setStudentName((String) objects[1]);
			student.setPassword((String) objects[2]);
			student.setStudentID((String) objects[3]);
			student.setSclass((String) objects[4]);
			student.setTerm((String) objects[5]);
			return student;
		}
		HibernateSessionFactory.closeSession();
		return null;
	}
	@Override
	public int findBySclass(String sclass,String term) {
		Session session = HibernateSessionFactory.getSession();
		Criteria createCriteria = session.createCriteria(Student.class);
		createCriteria.add(Restrictions.eq("term", term));
		createCriteria.add(Restrictions.eq("sclass", sclass));
		createCriteria.setProjection(Projections.rowCount());
		int parseInt = Integer.parseInt(createCriteria.uniqueResult().toString());
		
		return parseInt;
	}
	///导出excel
	
	@Override
	public List<Scorde> exportExcel(Condition condition) {
		Session session = HibernateSessionFactory.getSession();
		SQLQuery createSQLQuery =null;
		String hql=null;
		String type="desc";
		if(condition.getType().equals("2")){
				type="asc";
		}
		if(condition.getTerm()!=null && condition.getSclass()!=null && condition.getName()!=null){
			 hql="select  *"+
					"from db_student_scorde as db inner join "+
					"(select stu.sysid as stuid ,stu.studentName as stuName,stu.`password` as stupass,stu.studentID as sID ,stu.sclass as stusclass,stu.term as stuterm  , MAX(con.count) as time"+ 
					 " from  db_student stu inner join db_student_scorde con on stu.sysid=con.stu_sysid "+
					"where stu.sclass=? and stu.term=? and stu.studentName like ? group by stu.sysid) as st "+
					"on st.stuid=db.stu_sysid and st.time=db.count ORDER BY db.score "+type;
			 
			  createSQLQuery = session.createSQLQuery(hql);
			 createSQLQuery.setParameter(0, condition.getSclass());
			 createSQLQuery.setParameter(1, condition.getTerm());
			 createSQLQuery.setParameter(2, "%"+condition.getName()+"%");
		}else if(condition.getName()!=null&&condition.getTerm()==null && condition.getSclass()==null){
			hql="select *"+
					" from db_student_scorde as db inner join "+
					"(select stu.sysid as stuid ,stu.studentName as stuName,stu.`password` as stupass,stu.studentID as sID ,stu.sclass as stusclass,stu.term as stuterm  , MAX(con.count) as time"+ 
					 " from  db_student stu inner join db_student_scorde con on stu.sysid=con.stu_sysid "+
					"where  stu.studentName like ? group by stu.sysid) as st "+
					"on st.stuid=db.stu_sysid and st.time=db.count ORDER BY db.score "+type;
			createSQLQuery = session.createSQLQuery(hql);
			 createSQLQuery.setParameter(0, "%"+condition.getName()+"%");
		}else if(condition.getTerm()!=null && condition.getSclass()!=null&&condition.getName()==null){
			hql="select *"+
					" from db_student_scorde as db inner join "+
					"(select stu.sysid as stuid ,stu.studentName as stuName,stu.`password` as stupass,stu.studentID as sID ,stu.sclass as stusclass,stu.term as stuterm  , MAX(con.count) as time"+ 
					 " from  db_student stu inner join db_student_scorde con on stu.sysid=con.stu_sysid "+
					"where stu.sclass=? and stu.term=?   group by stu.sysid) as st "+
					"on st.stuid=db.stu_sysid and st.time=db.count ORDER BY db.score "+type;
			createSQLQuery = session.createSQLQuery(hql);
			 createSQLQuery.setParameter(0, condition.getSclass());
			 createSQLQuery.setParameter(1, condition.getTerm());
		}else{
			hql="select  *"+
					" from db_student_scorde as db inner join "+
					"(select stu.sysid as stuid ,stu.studentName as stuName,stu.`password` as stupass,stu.studentID as sID ,stu.sclass as stusclass,stu.term as stuterm  , MAX(con.count) as time"+ 
					 " from  db_student stu inner join db_student_scorde con on stu.sysid=con.stu_sysid "+
					"  group by stu.sysid) as st "+
					"on st.stuid=db.stu_sysid and st.time=db.count ORDER BY db.score "+type;
			createSQLQuery = session.createSQLQuery(hql);
		}
		List<Scorde> arrayList = new ArrayList<Scorde>();
		List<Object[]> list = createSQLQuery.list();
		for (Object[] objects : list) {
			Scorde scorde = new Scorde();
			Student student = new Student();
			scorde.setScordeId((int) objects[0]);
			scorde.setTimescore((Integer) objects[2]);
			scorde.setCount((Integer) objects[3]);
			scorde.setTesttime((Date) objects[4]);
			
			student.setSysid((Integer) objects[5]);
			student.setStudentName((String) objects[6]);
			student.setPassword((String) objects[7]);
			student.setStudentID((String) objects[8]);
			student.setSclass((String) objects[9]);
			student.setTerm((String) objects[10]);
			student.getSr().add(scorde);
			scorde.setStuSysid(student);
			arrayList.add(scorde);
		}
		
		HibernateSessionFactory.closeSession();
		return arrayList;
	}
	

	
}
