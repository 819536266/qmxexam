package com.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.entity.Student;
import com.entity.Subject;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.service.SubjectService;
import com.service.SubjectServiceImpl;

public class StudentUpdateAction extends ActionSupport {
    /**
     *
     */
    private StudentService ss = new StudentServiceImpl();
    private String studentName;//员工名字
    private String sclass;//部门
    private String term;
    private Integer sysid;


    public Integer getSysid() {
        return sysid;
    }


    public void setSysid(Integer sysid) {
        this.sysid = sysid;
    }


    public String getStudentName() {
        return studentName;
    }


    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }


    public String getSclass() {
        return sclass;
    }


    public void setSclass(String sclass) {
        this.sclass = sclass;
    }


    public String getTerm() {
        return term;
    }


    public void setTerm(String term) {
        this.term = term;
    }


    @SuppressWarnings("static-access")
    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("老师未登录");
            return "teaerror";
        }
        try {

            ss.updateStudent(studentName, term, sclass, sysid);
        } catch (Exception e) {
            // TODO: handle exception
            return "error";
        }

        this.addActionMessage("更新成功");
        return this.SUCCESS;
    }

}
