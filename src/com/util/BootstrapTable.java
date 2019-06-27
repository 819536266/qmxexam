package com.util;

import java.io.Serializable;

public class BootstrapTable implements Serializable {

    private static final long serialVersionUID = -3906418642517182707L;
    private String shor;//排序名称
    private String order;//排序规则
    private Integer limit;//条数
    private Integer offset;//开始条数
    private String assess;

    public BootstrapTable(String shor, String order, Integer limit, Integer offset, String assess) {
        this.shor = shor;
        this.order = order;
        this.limit = limit;
        this.offset = offset;
        this.assess = assess;
    }

    @Override
    public String toString() {
        return "BootstrapTable{" +
                "shor='" + shor + '\'' +
                ", order='" + order + '\'' +
                ", limit=" + limit +
                ", offset=" + offset +
                ", assess='" + assess + '\'' +
                '}';
    }

    public String getAssess() {
        return assess;
    }

    public void setAssess(String assess) {
        this.assess = assess;
    }

    public BootstrapTable() {
        super();
    }








    public String getShor() {
        return shor;
    }

    public void setShor(String shor) {
        this.shor = shor;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }
}
