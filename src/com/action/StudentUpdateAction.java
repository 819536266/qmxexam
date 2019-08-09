package com.action;

import javax.servlet.http.HttpServletRequest;

import com.util.MD5;
import org.apache.struts2.ServletActionContext;

import com.entity.Student;
import com.entity.Subject;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.service.SubjectService;
import com.service.SubjectServiceImpl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StudentUpdateAction extends ActionSupport {
    /**
     *
     */
    private StudentService ss = new StudentServiceImpl();
    private String studentName;//员工名字
    private String sclass;//部门
    private String term;
    private Date dateTerm;//入职日期
    private Date correctiontime;//转正时间
    private BigDecimal salary;//转正工资
    private Date departuretime;
    private Integer sysid;

    public Date getDeparturetime() {
        return departuretime;
    }

    public void setDeparturetime(Date departuretime) {
        this.departuretime = departuretime;
    }

    public Date getDateTerm() {
        return dateTerm;
    }

    public void setDateTerm(Date dateTerm) {
        this.dateTerm = dateTerm;
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
            addActionError("管理员未登录");
            return "teaerror";
        }
        try {
            Student studentInfo = ss.getStudentInfo(sysid);
            if(studentInfo!=null){
                SimpleDateFormat yYmm = new SimpleDateFormat("YYMM");
                String term=yYmm.format(dateTerm);
                studentInfo.setTerm(term);
                studentInfo.setSalary(salary);
                studentInfo.setCorrectiontime(correctiontime);
                studentInfo.setDeparturetime(departuretime);
                studentInfo.setDateTerm(dateTerm);
                studentInfo.setSclass(sclass);
                studentInfo.setStudentName(studentName);
            }
            ss.updateStudent(studentInfo);
        } catch (Exception e) {
            // TODO: handle exception
            return "error";
        }

        this.addActionMessage("更新成功");
        return this.SUCCESS;
    }

}
