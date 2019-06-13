package com.util;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor {

    @Override
    protected String doIntercept(ActionInvocation invocation) throws Exception {
        Map session = ActionContext.getContext().getSession();
        Teacher user = (Teacher) session.get("teacherInfo");
        Student Student = (Student) session.get("studentInfo");
        HttpServletRequest request = ServletActionContext.getRequest();
        String servletPath = request.getServletPath();
        if (servletPath.equals("/struts2/login")) {
            return invocation.invoke();
        }
        if (servletPath.equals("/struts2/login.action")) {
            return invocation.invoke();
        }
        if (servletPath.equals("/teacher/struts2/login.action")) {
            return invocation.invoke();
        }
        if (servletPath.equals("/teacher/login.action")) {
            return invocation.invoke();
        }
        if (servletPath.equals("/login")) {
            return invocation.invoke();
        }
        if (user != null || Student != null) {//合法访问

            return invocation.invoke();
        } else {//user为空说明未经过登陆,保存错误提示信息,跳到登陆页面

            return "tologin";
        }

    }


}