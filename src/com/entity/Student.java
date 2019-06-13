package com.entity;

import java.util.HashSet;
import java.util.Set;

import com.util.MD5;


/*
 * 员工表,保存员工编号，系统密码
 */
public class Student {
    private Integer sysid;//系统编号、primary Key
    private String studentID;//身份证
    private String password;//密码
    private String studentName;//员工名字
    private String sclass;//部门
    private String term;
    private Set<Scorde> sr = new HashSet<Scorde>();

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

    public Set<Scorde> getSr() {
        return sr;
    }

    public void setSr(Set<Scorde> sr) {
        this.sr = sr;
    }

    @Override
    public String toString() {
        return "Student [sysid=" + sysid + ", studentID=" + studentID
                + ", password=" + password + ", studentName=" + studentName
                + ", sclass=" + sclass + ", term=" + term + "]";
    }


}
