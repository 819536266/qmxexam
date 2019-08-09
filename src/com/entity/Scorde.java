package com.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 成绩
 */
public class Scorde implements Serializable {
    private static final long serialVersionUID = 4077628088832253194L;
    private int scordeId;//主键

    private Student stuSysid;//对应的员工

    private Integer timescore;//分数

    private String assess; //分数状态 0为考试 1为考核

    private Integer count;//当此考试次数

    private Date testtime;//当此考试提交时间

    private Integer shorttime;//临时分数

    private Set<Assess> set=new HashSet<>();



    public Set<Assess> getSet() {
        return set;
    }

    public void setSet(Set<Assess> set) {
        this.set = set;
    }

    public Scorde(Student stuSysid, Integer timescore, String assess, Integer count, Date testtime) {
        this.stuSysid = stuSysid;
        this.timescore = timescore;
        this.assess = assess;
        this.count = count;
        this.testtime = testtime;
    }

    public Scorde(int scordeId, Student stuSysid, Integer timescore, String assess, Integer count, Date testtime, Integer shorttime) {
        this.scordeId = scordeId;
        this.stuSysid = stuSysid;
        this.timescore = timescore;
        this.assess = assess;
        this.count = count;
        this.testtime = testtime;
        this.shorttime = shorttime;
    }

    public Integer getShorttime() {
        return shorttime;
    }

    public void setShorttime(Integer shorttime) {
        this.shorttime = shorttime;
    }

    public Scorde() {
        super();
    }

    public int getScordeId() {
        return scordeId;
    }

    public void setScordeId(int scordeId) {
        this.scordeId = scordeId;
    }

    public Student getStuSysid() {
        return stuSysid;
    }

    public void setStuSysid(Student stuSysid) {
        this.stuSysid = stuSysid;
    }

    public Integer getTimescore() {
        return timescore;
    }

    public void setTimescore(Integer timescore) {
        this.timescore = timescore;
    }

    public String getAssess() {
        return assess;
    }

    public void setAssess(String assess) {
        this.assess = assess;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Date getTesttime() {
        return testtime;
    }

    public void setTesttime(Date testtime) {
        this.testtime = testtime;
    }

    @Override
    public String toString() {
        return "Scorde{" +
                "scordeId=" + scordeId +
                ", stuSysid=" + stuSysid +
                ", timescore=" + timescore +
                ", assess='" + assess + '\'' +
                ", count=" + count +
                ", testtime=" + testtime +
                ", shorttime=" + shorttime +
                '}';
    }
}
