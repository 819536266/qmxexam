package com.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.service.SubjectService;
import com.service.SubjectServiceImpl;
import org.json.JSONArray;

import java.io.IOException;
import java.util.List;

public class SubjectDeleteAction extends ActionSupport {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private int stId;
    private  String json;

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }
    private SubjectService subjectService = new SubjectServiceImpl();

    public int getStId() {
        return stId;
    }

    public void setStId(int stId) {
        this.stId = stId;
    }

    @SuppressWarnings("static-access")
    @Override
    public String execute() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("老师未登录");
            return "teaerror";
        }
        try {
            subjectService.deleteSubject(stId);
            addActionMessage("删除成功!");
            response.getWriter().write("success");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error");
        }
        return null;
    }
    public String subjectDeletecheck() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("老师未登录");
            return "teaerror";
        }
        try {
            JSONArray jsonArray=new JSONArray(json);
            System.out.println(jsonArray);
            List<Object> objects = jsonArray.toList();
            for (Object object:
                    objects) {
                subjectService.deleteSubject(new Integer(((String)object).trim()));
            }
            addActionMessage("删除成功!");
            response.getWriter().write("success");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error");
        }
        return null;
    }

}
