package com.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Target implements Serializable {
    private static final long serialVersionUID = -5740941388816604461L;
    private Integer id;
    private String sclass;//部门名称
    private String name;//标签名称
    private Set<Assess> assess=new HashSet<Assess>();
    @Override
    public String toString() {
        return "Target{" +
                "id=" + id +
                ", sclass='" + sclass + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public Set<Assess> getAssess() {
        return assess;
    }

    public void setAssess(Set<Assess> assess) {
        this.assess = assess;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
