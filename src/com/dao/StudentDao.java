package com.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.entity.Scorde;
import com.entity.Student;
import com.util.Condition;
import com.util.Page;

public interface StudentDao extends BaseDao {
    public Student findByStudenID(String studentID);//根据员工ID查询一条记录

    public void updateStudent(Student student);//更新员工的信息

    public List<Student> findByStudentName(String name);//根据员工的姓名查找员工

    public List<Student> findByStudentClass(String sclass, Page page);//根据部门查找员工 -分页查询

    public int save(Student student);//保存一个员工记录

    public List<Scorde> findStudentsByPage(Condition forClass, Page page);//根据分页查询结果;

    public int fintStudentCount(Condition forClass);//返回所有员工数量

    int fintStudentCountByClass(String sclass);//返回部门员工数量

    public List<Student> findStudentsByClass(String sclass, Page page);//查询部门员工 -分页查询

    //2019.3.6 牛牛修改
    public void deleteStudent(Integer studentID);

    public void updateStudent(String studentName, String term, String sclass, Integer sysid);

    //根据部门查员工,不分页
    public List<Student> selectBySclass(DetachedCriteria forClass);

    //根据主键查询
    public Student findBySysid(Integer studentID);

    //根据员工身份证查找
    public Student findByPassword(String password);


    public Student login(String studentID, String password);

    //根据部门查询最后的日期
    public Student getStudentBySclass(String sclass);

    public int findBySclass(String sclass, String term);

    //导出员工excel
    public List<Scorde> exportExcel(Condition condition);

}
