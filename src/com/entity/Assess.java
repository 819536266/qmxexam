package com.entity;

import java.util.Date;

public class Assess {
    private static final long serialVersionUID = -7904288675969141897L;
    private Integer id;
    private String type;//0为考核题类型 1为用户考核信息
    private String content;//考试内容
    private Target target;//指标

    private Scorde scorde;//考核分数
    private Integer test1;//这条分数
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
                ", target=" + target +
                ", scorde=" + scorde +
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

    public Scorde getScorde() {
        return scorde;
    }

    public void setScorde(Scorde scorde) {
        this.scorde = scorde;
    }

    public Integer getTest1() {
        return test1;
    }

    public void setTest1(Integer test1) {
        this.test1 = test1;
    }

    public String getTest2() {
        return test2;
    }

    public void setTest2(String test2) {
        this.test2 = test2;
    }
}
