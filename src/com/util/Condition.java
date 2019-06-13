package com.util;


//查询条件
public class Condition {
	private String assess;//考试类型

	public String getAssess() {
		return assess;
	}

	public void setAssess(String assess) {
		this.assess = assess;
	}

	private String term;//日期
	private String sclass;//部门
	private String type;//1为升序,2为降序
	private String name;//姓名
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getSclass() {
		return sclass;
	}
	public void setSclass(String sclass) {
		this.sclass = sclass;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Condition [term=" + term + ", sclass=" + sclass + ", type="
				+ type + ", name=" + name + "]";
	}
	public Condition() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Condition(String term, String sclass, String type, String name) {
		super();
		this.term = term;
		this.sclass = sclass;
		this.type = type;
		this.name = name;
	}
	
}
