package com.service;

import java.io.File;
import java.util.List;

import com.entity.Scorde;
import com.entity.Student;
import com.util.BootstrapTable;
import com.util.Condition;
import com.util.Page;
import com.util.PageResult;
import org.hibernate.criterion.DetachedCriteria;

public interface StudentService {
    //判断是否为合法员工，决定是否登录
    public Student allowLogin(String studentID, String password);

    //获得员工的信息 单个
    public Student getStudentInfo(Integer sid);

    //设置员工成绩
    public void setStudentResult(String studentID, int result);

    //根据员工的姓名查找信息
    public List<Student> getStudentByName(String studentName);

    //根据部门查找员工
    public PageResult getStudentByClass(String sclass, Page page);

    //保存一个员工记录
    public int saveStudent(Student student);

    //根据分页查询员工记录
    public PageResult queryStudentByPage(Condition condition, Page page);

    //获取员工数量
    public int countStudent(Condition condition);

    public int countStudentByClass(String sclass);

    //2019.3.6  牛牛修改
    //删除单条员工信息
    public void deleteStudent(Student sysid);

    //修改员工信息
    public void updateStudent(String studentName, String term, String sclass, Integer sysid);

    //根据部门查询所有员工,显示柱状图
//	public String selectBySclass(String sclass);
    public Student getStudent(String studentID);

    public Student getStudentPassword(String password);

    //根据部门查询最后的日期
    public Student getStudentBySclass(String sclass);

    //批量插入员工
    public List<Student> excelImport(File file, String sclass, String onesclass);

    public Integer findBySclass(String sclass, String term);

    //导出员工
    public List<Scorde> exportExcel(Condition condition);

    void updateStudent(Student studentInfo);

    int countStudentMar(BootstrapTable bootstrapTable, DetachedCriteria condition);

    List<Student> queryStudentByPageMar(DetachedCriteria forClass, BootstrapTable page);

    List<Student> getByCriteria(DetachedCriteria detachedCriteria);
}
