package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.entity.Scorde;
import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.util.Condition;
import com.util.Page;
import com.util.PageResult;
import com.util.PageUtil;

public class StudentQuery extends ActionSupport {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private int currentPage;//当前页
    private int everyPage = 10;//每一页记录
    private String term;//日期
    private String assess;//考试类型
    private String sclass;//部门
    private String type = "1";//1为升序,2为降序
    private String name;

    public String getAssess() {
        return assess;
    }

    public void setAssess(String assess) {
        this.assess = assess;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        if (type == null) {
            this.type = "1";
        } else {

            this.type = type;
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private StudentService studentService = new StudentServiceImpl();

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getEveryPage() {
        return everyPage;
    }

    public void setEveryPage(int everyPage) {
        this.everyPage = everyPage;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    /**
     * 获取所有员工的信息
     */
    @SuppressWarnings({"unchecked", "static-access"})
    @Override
    public String execute() throws Exception {
        this.setAssess("0");
        HttpServletRequest request = ServletActionContext.getRequest();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("老师未登录");
            return "teaerror";
        }

        //状态request
        String t = (String) request.getSession().getAttribute("type");
        if (t != null) {
            type = t;
        }
        Condition condition = new Condition();
        condition.setType(type);
        /*DetachedCriteria forClass = DetachedCriteria.forClass(Student.class);*/
        if (sclass != null && !sclass.equals("")) {
            sclass = new String(sclass.getBytes("ISO-8859-1"), "UTF-8");
            //forClass.add(Restrictions.eq("sclass", sclass));
            condition.setSclass(sclass);
        }
        if (term != null && !term.equals("")) {
            condition.setTerm(term);
            //forClass.add(Restrictions.eq("term", term));
        }

        if (name != null && !name.equals("")) {
            name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
            condition.setName(name);
            //forClass.add(Restrictions.like("studentName", "%"+name+"%"));
        }
        if (assess != null && !assess.equals("")) {
            condition.setAssess(assess);
            //forClass.add(Restrictions.like("studentName", "%"+name+"%"));
        }
        int totalCount = studentService.countStudent(condition);

        request.setAttribute("stusclass", sclass);
        request.setAttribute("term", term);
        request.setAttribute("name", name);
        //request.setAttribute("type", type);
        Page page = new Page();
        page = PageUtil.createPage(everyPage, totalCount, currentPage);//获取分页信息
        PageResult pageResult = studentService.queryStudentByPage(condition, page);
        List<Scorde> students = pageResult.getList();
        request.setAttribute("students", students);
        request.setAttribute("page", page);
        return this.SUCCESS;
    }
}
