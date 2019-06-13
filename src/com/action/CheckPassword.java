package com.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.service.StudentServiceImpl;
import com.util.MD5;

public class CheckPassword {

    private String password;
    private StudentServiceImpl studentServiceImpl = new StudentServiceImpl();


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }


    public String execute() throws Exception {
        HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        if (studentServiceImpl.getStudentPassword(MD5.Encrypt(password)) != null) {//如果有重复的话
            out.print("身份证号已存在!请重新输入!");
        } else {
            out.print("可以注册！");
        }
        return null;
    }

}
