package com.entity;

public class Teacher {
    private int sysid;//主键
    private String teacherID;//教师的编号
    private String password;//登录的密码
    private String sclass;//老师所带部门
    private String sclass1;
    private String sclass2;
    private String sclass3;

    public Teacher() {
    }

    public int getSysid() {
        return sysid;
    }

    public void setSysid(int sysid) {
        this.sysid = sysid;
    }

    public String getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(String teacherID) {
        this.teacherID = teacherID;
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

    public String getSclass1() {
        return sclass1;
    }

    public void setSclass1(String sclass1) {
        this.sclass1 = sclass1;
    }

    public String getSclass2() {
        return sclass2;
    }

    public void setSclass2(String sclass2) {
        this.sclass2 = sclass2;
    }

    public String getSclass3() {
        return sclass3;
    }

    public void setSclass3(String sclass3) {
        this.sclass3 = sclass3;
    }


}
