package com.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.entity.Teacher;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import org.json.JSONArray;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/*
 * 2019.3.6
 * niuniu创建
 * */
public class StudentDeleteAction {

    public Integer sysid;
    private  String json;

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

    public Integer getSysid() {
        return sysid;
    }

    public void setSysid(Integer sysid) {
        this.sysid = sysid;
    }

    private StudentService studentService = new StudentServiceImpl();

    public String delete() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            return "teaerror";
        }
        try{
         studentService.deleteStudent(sysid);
            response.getWriter().write("success");
        } catch (Exception e) {
            response.getWriter().write("error");
        }
        return null;
    }
    public String deletecheck() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            return "teaerror";
        }

        try{
            JSONArray jsonArray=new JSONArray(json);
            System.out.println(jsonArray);
            List<Object> objects = jsonArray.toList();
            for (Object object:
                    objects) {
                studentService.deleteStudent(new Integer(((String)object).trim()));

            }
            response.getWriter().write("success");
        } catch (Exception e) {
            response.getWriter().write("error");
        }
        return null;
    }


}
