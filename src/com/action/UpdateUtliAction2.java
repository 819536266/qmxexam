package com.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.Request;

import com.entity.Student;
import com.entity.Subject;
import com.opensymphony.xwork2.ActionSupport;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.service.SubjectService;
import com.service.SubjectServiceImpl;

/**
 * 2019.3.12   niuniu创建
 * 修改时先数据回显
 */
public class UpdateUtliAction2 extends ActionSupport {

    private StudentService ss = new StudentServiceImpl();
    private Integer sysid;//学号


    public Integer getSysid() {
        return sysid;
    }


    public void setSysid(Integer sysid) {
        this.sysid = sysid;
    }


    //数据回显
    public String update() throws Exception {
        Student stu = ss.getStudentInfo(sysid);
        HttpServletRequest req = ServletActionContext.getRequest();
        req.setAttribute("stu", stu);

        return SUCCESS;

    }

}
