package com.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opensymphony.xwork2.ModelDriven;
import com.util.*;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.entity.Scorde;
import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.service.StudentService;
import com.service.StudentServiceImpl;

public class QueryStudent extends ActionSupport  {
    private BootstrapTable table;
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String sclass;//部门
    private String name;

    public BootstrapTable getTable() {
        return table;
    }

    public void setTable(BootstrapTable table) {
        this.table = table;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private StudentService studentService = new StudentServiceImpl();


    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    /**
     * 获取所有员工的信息
     */
    @SuppressWarnings({"unchecked", "static-access"})
    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            response.getWriter().write("");
        }
        try {
            DetachedCriteria forClass = DetachedCriteria.forClass(Student.class);
            if (sclass != null && !sclass.equals("")) {
                sclass = new String(sclass.getBytes("ISO-8859-1"), "UTF-8");
                forClass.add(Restrictions.eq("sclass", sclass));
            }
            if (name != null && !name.equals("")) {
                name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
                forClass.add(Restrictions.like("studentName", "%"+name+"%"));
            }

            int totalCount = studentService.countStudentMar(table,forClass);
            Page page = new Page();
            List<Student> List = studentService.queryStudentByPageMar(forClass, table);
            List.forEach(time->time.setSr(null));
            Map<String, Object> map = new HashMap<>();
            map.put("total",totalCount);
            map.put("rows",List);
            JsonConfig jsonConfig = new JsonConfig();
            jsonConfig.setExcludes(new String[] {"sr"});
            JSONObject jsonArray = JSONObject.fromObject(map);
            response.getWriter().write(jsonArray.toString());
        } catch (IOException e) {
            response.getWriter().write("");
        }
        return null;
    }


}
