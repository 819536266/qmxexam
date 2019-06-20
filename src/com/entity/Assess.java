package com.entity;

import java.util.Date;

public class Assess {
    private static final long serialVersionUID = -7904288675969141897L;
    private Integer id;
    private String type;//0为考核题类型 1为用户考核信息
    private String content;//考试内容
    private Target target;//指标
    private Integer assessScore;//考核分数
    private Integer userId;//考核人
    private String firstName;//初次考核人名称
    private String lastName;//最后一次考核人名称
    private Date scordTime;//考核月份
    private Date time;//考核时间
    private String test1;
    private String test2;

    public Assess() {
        super();
    }

    @Override
    public String toString() {
        return "Assess{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", content='" + content + '\'' +
                ", target='" + target + '\'' +
                ", assessScore=" + assessScore +
                ", userId='" + userId + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", scordTime=" + scordTime +
                ", time=" + time +
                ", test1='" + test1 + '\'' +
                ", test2='" + test2 + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Target getTarget() {
        return target;
    }

    public void setTarget(Target target) {
        this.target = target;
    }

    public Integer getAssessScore() {
        return assessScore;
    }

    public void setAssessScore(Integer assessScore) {
        this.assessScore = assessScore;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getScordTime() {
        return scordTime;
    }

    public void setScordTime(Date scordTime) {
        this.scordTime = scordTime;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getTest1() {
        return test1;
    }

    public void setTest1(String test1) {
        this.test1 = test1;
    }

    public String getTest2() {
        return test2;
    }

    public void setTest2(String test2) {
        this.test2 = test2;
    }
}
