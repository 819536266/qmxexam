package com.action;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ModelDriven;
import com.sun.org.apache.xpath.internal.operations.Mod;
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
    private Date dateTerm;//入职日期
    private BigDecimal internshipsalary;//入职工资
    private Date correctiontime;//转正时间
    private BigDecimal salary;//转正工资
    private String sclassone;

    public Date getDateTerm() {
        return dateTerm;
    }

    public void setDateTerm(Date dateTerm) {
        this.dateTerm = dateTerm;
    }

    public BigDecimal getInternshipsalary() {
        return internshipsalary;
    }

    public void setInternshipsalary(BigDecimal internshipsalary) {
        this.internshipsalary = internshipsalary;
    }

    public Date getCorrectiontime() {
        return correctiontime;
    }

    public void setCorrectiontime(Date correctiontime) {
        this.correctiontime = correctiontime;
    }

    public BigDecimal getSalary() {
        return salary;
    }

    public void setSalary(BigDecimal salary) {
        this.salary = salary;
    }

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
        SimpleDateFormat yYmm = new SimpleDateFormat("YYMM");
        String term=yYmm.format(dateTerm);
        String ID = null;
        Integer count = studentService.findBySclass(sclass, term);
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
        student.setDateTerm(dateTerm);
        student.setCorrectiontime(correctiontime);
        student.setInternshipsalary(internshipsalary);
        student.setSalary(salary);
        student.setStudentID(ID);//studentid
        student.setStudentName(studentName);//name

        student.setTerm(term);
        student.setState(0);
        Scorde scorde = new Scorde(student,0,"0",0,new Date());
        Scorde scordeAssess = new Scorde(student,0,"1",1,new Date());
        scorde.setShorttime(0);
        scordeAssess.setShorttime(0);
        student.getSr().add(scorde);
        student.getSr().add(scordeAssess);
        try {
            List<Student> arrayList = new ArrayList<Student>();
            List<Student> studentPassword = studentService.getStudentByName(student.getStudentName());
            if (studentPassword.size() >0) {
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
