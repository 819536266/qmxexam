package com.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 成绩
 */

public class Centre {
    private int centreId;//主键
    private Bigtype centrePid;//父主键
    private String centreName;//分类名字

    private String centreNano; //
    private Set<Small> list = new HashSet<Small>();

    public Set<Small> getList() {
        return list;
    }

    public void setList(Set<Small> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "Centre{" +
                "centreId=" + centreId +
                ", centreName='" + centreName + '\'' +
                ", centreNano='" + centreNano + '\'' +
                '}';
    }

    public int getCentreId() {
        return centreId;
    }

    public void setCentreId(int centreId) {
        this.centreId = centreId;
    }

    public Bigtype getCentrePid() {
        return centrePid;
    }

    public void setCentrePid(Bigtype centrePid) {
        this.centrePid = centrePid;
    }

    public String getCentreName() {
        return centreName;
    }

    public void setCentreName(String centreName) {
        this.centreName = centreName;
    }

    public String getCentreNano() {
        return centreNano;
    }

    public void setCentreNano(String centreNano) {
        this.centreNano = centreNano;
    }
}


