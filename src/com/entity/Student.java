package com.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.util.MD5;


/*
 * 员工表,保存员工编号，系统密码
 */
public class Student {
    private Integer sysid;//系统编号、primary Key
    private String studentID;//密码
    private String password;//密码
    private String studentName;//员工名字
    private String sclass;//部门
    private Integer state=0;//0为普通员工 1为部门经理,2为总经理
    private String term;//入职月份
    private Date dateTerm;//入职时间

    private BigDecimal internshipsalary;//实习工资
    private Date correctiontime ;//转正时间
    private BigDecimal salary;//转正工资
    private Date departuretime;//离职时间


    private Set<Scorde> sr = new HashSet<Scorde>();

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Student() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Integer getSysid() {
        return sysid;
    }

    public void setSysid(Integer sysid) {
        this.sysid = sysid;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public Date getDateTerm() {
        return dateTerm;
    }

    public void setDateTerm(Date dateTerm) {
        this.dateTerm = dateTerm;
    }

    public Set<Scorde> getSr() {
        return sr;
    }

    public void setSr(Set<Scorde> sr) {
        this.sr = sr;
    }

    public BigDecimal getInternshipsalary() { return internshipsalary; }

    public void setInternshipsalary(BigDecimal internshipsalary) { this.internshipsalary = internshipsalary; }

    public Date getCorrectiontime() {return correctiontime; }

    public void setCorrectiontime(Date correctiontime) { this.correctiontime = correctiontime; }

    public BigDecimal getSalary() { return salary; }

    public void setSalary(BigDecimal salary) { this.salary = salary; }

    public Date getDeparturetime() { return departuretime; }

    public void setDeparturetime(Date departuretime) { this.departuretime = departuretime; }

    @Override
    public String toString() {
        return "Student{" +
                "sysid=" + sysid +
                ", studentID='" + studentID + '\'' +
                ", password='" + password + '\'' +
                ", studentName='" + studentName + '\'' +
                ", sclass='" + sclass + '\'' +
                ", state=" + state +
                ", term='" + term + '\'' +
                ", dateTerm=" + dateTerm +
                ", internshipsalary=" + internshipsalary +
                ", correctiontime=" + correctiontime +
                ", salary=" + salary +
                ", departuretime=" + departuretime +
                '}';
    }
}
