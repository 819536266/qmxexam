package test.util;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;

import com.entity.Scorde;
import com.entity.Student;
import com.entity.Subject;
import com.util.HibernateSessionFactory;

public class text {

    public static void main(String[] args) {
        Session session = HibernateSessionFactory.getSession();
        Transaction beginTransaction = session.beginTransaction();
        Criteria createCriteria = session.createCriteria(Student.class);
        Student student = new Student();

        student.setSclass("电工");
        String hql2 = "select  count(*)" +
                "from db_student_scorde as db inner join " +
                "(select stu.sysid as stuid ,stu.studentName as stuName,stu.`password` as stupass,stu.studentID as sID ,stu.sclass as stusclass,stu.term as stuterm  , MAX(con.testtime) as time" +
                " from  db_student stu inner join db_student_scorde con on stu.sysid=con.stu_sysid " +
                "where stu.sclass=? and stu.term=? group by stu.sysid) as st " +
                "on st.stuid=db.stu_sysid and st.time=db.testtime ORDER BY db.score asc";
        String hql = "select  count(*)" +
                " from db_student_scorde as db inner join " +
                "(select stu.sysid as stuid ,stu.studentName as stuName,stu.`password` as stupass,stu.studentID as sID ,stu.sclass as stusclass,stu.term as stuterm  , MAX(con.testtime) as time" +
                " from  db_student stu inner join db_student_scorde con on stu.sysid=con.stu_sysid " +
                "  group by stu.sysid) as st " +
                "on st.stuid=db.stu_sysid and st.time=db.testtime ORDER BY db.score desc";
		/*Criteria createCriteria2 = session.createCriteria(Scorde.class);
		DetachedCriteria forClass = DetachedCriteria.forClass(Student.class);
		forClass.add(Restrictions.eq("sclass", "电工"));
		forClass.add(Restrictions.eq("term", "1802"));
		Criteria createCriteria3 = session.createCriteria(Scorde.class, "sco");
		createCriteria3.setProjection(Projections.max("testtime"));
		createCriteria3.add(Property.forName("stuSysid").max(). );
		List<Scorde> list = createCriteria3.list();
		for (Scorde scorde : list) {
			System.out.println(scorde);
		}*/
        SQLQuery createSQLQuery = session.createSQLQuery(hql);
	
	
	/*	createSQLQuery.setParameter(0, "电工");
		createSQLQuery.setParameter(1, "1802");*/

        List<Object> list = createSQLQuery.list();

        System.out.println(Integer.parseInt(list.get(0).toString()));
	/*	for (Object[] objects : list) {
			Scorde scorde = new Scorde();
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
			System.out.println(scorde);
		}*/

    }

}
