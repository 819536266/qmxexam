package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.service.TeacherService;
import com.service.TeacherServiceImpl;
import com.util.MD5;

public class LoginAction extends ActionSupport {
    private static final long serialVersionUID = 1L;
    private String username;
    private String password;
    private String role;// 接受用户角色
    private StudentService studentService = new StudentServiceImpl();
    private TeacherService teacherService = new TeacherServiceImpl();

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @SuppressWarnings({"unchecked", "static-access"})
    public String execute() {
        if ("student".equals(role)) {
            // 如果是员工身份登录的话
            // 判断账号密码正确与否
            Student student = null;
            try {
                student = studentService.allowLogin(username, password);
            } catch (Exception e) {
                addActionError("登陆失败");
                return "studenterror";
            }
            if (student != null) {
                Date date = new Date();
                //获取当前时间,转换格式
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYMM");
                int format = 0;
                int term = 0;
                try {

                    format = Integer.parseInt(simpleDateFormat.format(date));
                    term = Integer.parseInt(student.getTerm());
                } catch (Exception e) {
                    addActionError("登陆失败");
                    return "studenterror";
                }
              /*  //判断如果注册时间超过两个月,则不允许登陆
                if ((format - 2) >= term) {
                    addActionError("日期已结束,请重新报班!");
                    return "studenterror";
                }*/
                Map session = ActionContext.getContext().getSession();//获取session
                session.put("studentInfo", student);//把员工信息封装到session当中
                return "studentSuccess";
            } else {
                addActionError("员工编号不存在或者密码输入不正确");
                return "studenterror";
            }
        } else {
            if (teacherService.allowLogin(username, password)) {
                Teacher teacherInfo = teacherService.getTeacherInfo(username);//获取老师的信息
                Map session = ActionContext.getContext().getSession();
                session.put("teacherInfo", teacherInfo);//将管理员信息封装保存到session当中
                return "teacherSuccess";
            } else {
                addActionError("管理员编号不存在或者密码输入不正确");
                return "terchererror";
            }
        }
    }

}
