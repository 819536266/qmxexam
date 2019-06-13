package com.entity;

import java.util.*;

/**
 * 成绩
 */
public class Bigtype{
    private int bigId;//主键

    private String bigName;//大分类名字

    private String bigNano;//大分类简写

    private  Set<Centre> sr = new HashSet<Centre>();

    public Set<Centre> getSr() {
        return sr;
    }

    public void setSr(Set<Centre> sr) {
        this.sr = sr;
    }

    public int getBigId() {
        return bigId;
    }

    public void setBigId(int bigId) {
        this.bigId = bigId;
    }

    public String getBigName() {
        return bigName;
    }

    public void setBigName(String bigName) {
        this.bigName = bigName;
    }

    public String getBigNano() {
        return bigNano;
    }

    public void setBigNano(String bigNano) {
        this.bigNano = bigNano;
    }

    public Bigtype() {
        super();
    }

    @Override
    public String toString() {
        return "Bigtype{" +
                "bigId=" + bigId +
                ", bigName=" + bigName +
                ", bigNano=" + bigNano +
                '}';
    }

    public Bigtype(int bigId, String bigName, String bigNano) {
        this.bigId = bigId;
        this.bigName = bigName;
        this.bigNano = bigNano;
    }
}
