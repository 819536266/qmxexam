package com.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.Condition;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.service.ScordeService;
import com.service.ScordeServiceImpl;
import com.service.StudentService;
import com.service.StudentServiceImpl;

public class StudentJfreeChar extends ActionSupport {
    //接收部门
    private String sclass;
    private String term;
    private String assess;

    public String getAssess() {
        return assess;
    }

    public void setAssess(String assess) {
        this.assess = assess;
    }

    private ScordeService scordeService = new ScordeServiceImpl();
    private StudentService Service = new StudentServiceImpl();

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }


    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    @SuppressWarnings("deprecation")
    public String jfree() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        //设置错误显示图片
        String error = "error";
        //调用service
        Condition condition = new Condition();
        if (sclass != null && !sclass.equals("")) {
            try {
                sclass = new String(sclass.getBytes("ISO-8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            condition.setSclass(sclass);
        }
        if (term != null && !term.equals("")) {
            condition.setTerm(term);
        }
        if (assess != null && !assess.equals("")) {
            condition.setAssess(assess);
        }
        String file = scordeService.selectBySclass(condition, sclass, term);
        try {
            if (sclass != null) {
                if (file != null) {
                    response.getWriter().write(request.getContextPath() + "\\images\\temp\\" + file);

                } else {
                    response.getWriter().write(error);
                }
            } else {
                response.getWriter().write(error);
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
}
