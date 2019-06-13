package com.entity;

public class Subject {
    private int stID;
    private String stTitle;
    private String stOptionA;
    private String stOptionB;
    private String stOptionC;
    private String stOptionD;
    private String stOptionE;
    private String stOptionF;
    private String stOptionG;
    private String stOptionH;
    private String stOptionI;
    private String stAnswer;
    private String stParse;
    private String sclass;//部门

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    public int getStID() {
        return stID;
    }

    public void setStID(int stID) {
        this.stID = stID;
    }

    public String getStTitle() {
        return stTitle;
    }

    public void setStTitle(String stTitle) {
        this.stTitle = stTitle;
    }

    public String getStOptionA() {
        return stOptionA;
    }

    public void setStOptionA(String stOptionA) {
        this.stOptionA = stOptionA;
    }

    public String getStOptionB() {
        return stOptionB;
    }

    public void setStOptionB(String stOptionB) {
        this.stOptionB = stOptionB;
    }

    public String getStOptionC() {
        return stOptionC;
    }

    public void setStOptionC(String stOptionC) {
        this.stOptionC = stOptionC;
    }

    public String getStOptionD() {
        return stOptionD;
    }

    public void setStOptionD(String stOptionD) {
        this.stOptionD = stOptionD;
    }

    public String getStAnswer() {
        return stAnswer;
    }

    public void setStAnswer(String stAnswer) {
        this.stAnswer = stAnswer;
    }

    public String getStParse() {
        return stParse;
    }

    public void setStParse(String stParse) {
        this.stParse = stParse;
    }

    @Override
    public String toString() {
        return "Subject [stID=" + stID + ", stTitle=" + stTitle
                + ", stOptionA=" + stOptionA + ", stOptionB=" + stOptionB
                + ", stOptionC=" + stOptionC + ", stOptionD=" + stOptionD
                + ", stAnswer=" + stAnswer + ", stParse=" + stParse
                + ", sclass=" + sclass + "]";
    }

    public Subject() {
        super();
        // TODO Auto-generated constructor stub
    }

    public String getStOptionE() {
        return stOptionE;
    }

    public void setStOptionE(String stOptionE) {
        this.stOptionE = stOptionE;
    }

    public String getStOptionF() {
        return stOptionF;
    }

    public void setStOptionF(String stOptionF) {
        this.stOptionF = stOptionF;
    }

    public String getStOptionG() {
        return stOptionG;
    }

    public void setStOptionG(String stOptionG) {
        this.stOptionG = stOptionG;
    }

    public String getStOptionH() {
        return stOptionH;
    }

    public void setStOptionH(String stOptionH) {
        this.stOptionH = stOptionH;
    }

    public String getStOptionI() {
        return stOptionI;
    }

    public void setStOptionI(String stOptionI) {
        this.stOptionI = stOptionI;
    }

    public Subject(int stID, String stTitle, String stOptionA,
                   String stOptionB, String stOptionC, String stOptionD,
                   String stOptionE, String stOptionF, String stOptionG,
                   String stOptionH, String stOptionI, String stAnswer,
                   String stParse, String sclass) {
        super();
        this.stID = stID;
        this.stTitle = stTitle;
        this.stOptionA = stOptionA;
        this.stOptionB = stOptionB;
        this.stOptionC = stOptionC;
        this.stOptionD = stOptionD;
        this.stOptionE = stOptionE;
        this.stOptionF = stOptionF;
        this.stOptionG = stOptionG;
        this.stOptionH = stOptionH;
        this.stOptionI = stOptionI;
        this.stAnswer = stAnswer;
        this.stParse = stParse;
        this.sclass = sclass;
    }


}
