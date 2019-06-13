package com.entity;

/**
 * 成绩
 */

public class Small {
    private int smallId;//主键
    private Centre smallPid;//主键
    private String smallName;//大分类名字
    private String smallNano;//大分类简写
    private Centre centre;

    @Override
    public String toString() {
        return "Small{" +
                "smallId=" + smallId +
                ", smallPid=" + smallPid +
                ", smallName='" + smallName + '\'' +
                ", smallNano='" + smallNano + '\'' +
                ", centre=" + centre +
                '}';
    }

    public int getSmallId() {
        return smallId;
    }

    public void setSmallId(int smallId) {
        this.smallId = smallId;
    }

    public Centre getSmallPid() {
        return smallPid;
    }

    public void setSmallPid(Centre smallPid) {
        this.smallPid = smallPid;
    }

    public String getSmallName() {
        return smallName;
    }

    public void setSmallName(String smallName) {
        this.smallName = smallName;
    }

    public String getSmallNano() {
        return smallNano;
    }

    public void setSmallNano(String smallNano) {
        this.smallNano = smallNano;
    }

    public Centre getCentre() {
        return centre;
    }

    public void setCentre(Centre centre) {
        this.centre = centre;
    }
}
