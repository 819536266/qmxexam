package com.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.entity.Scorde;
import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.util.MD5;

public class StudentAddAction extends ActionSupport {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String studentName;//姓名
    private String password;//密码
    private String sclass;//部门
    private String term;//日期
    private String sclassone;


    public String getSclassone() {
        return sclassone;
    }

    public void setSclassone(String sclassone) {
        this.sclassone = sclassone;
    }


    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    private StudentService studentService = new StudentServiceImpl();

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (teacher == null) {
            addActionError("管理员未登录");
            return "teaerror";
        }
        Student student = new Student();
        student.setPassword(MD5.Encrypt(password));//默认密码
        student.setSclass(sclass);//student class
        Integer count = studentService.findBySclass(sclass, term);
        String ID = null;
        if (count == 0) {
            if (password.length() > 5) {
                ID = sclassone + term + "1" + password.substring(password.length() - 4, password.length());
            } else {
                ID = sclassone + term + "1";
            }
        } else {
            count = count + 1;
            if (password.length() > 5) {
                ID = sclassone + term + count.toString() + password.substring(password.length() - 4, password.length());

            } else {
                ID = sclassone + term + count.toString();
            }
        }
        student.setStudentID(ID);//studentid
        student.setStudentName(studentName);//name
        student.setTerm(term);
        Scorde scorde = new Scorde(student,0,"0",0,new Date());
        Scorde scordeAssess = new Scorde(student,0,"1",1,new Date());
        student.getSr().add(scorde);
        student.getSr().add(scordeAssess);
        try {
            List<Student> arrayList = new ArrayList<Student>();
            Student studentPassword = studentService.getStudentPassword(student.getPassword());
            if (studentPassword != null) {
                arrayList.add(student);
                request.setAttribute("excellist", arrayList);
                return "error";
            }
            int saveStudent = studentService.saveStudent(student);
            if (saveStudent != 0) {
                return SUCCESS;
            }
            arrayList.add(student);
            request.setAttribute("excellist", arrayList);
            return "error";
        } catch (Exception e) {
            // TODO: handle exception
        }
        return "error";
    }

}
