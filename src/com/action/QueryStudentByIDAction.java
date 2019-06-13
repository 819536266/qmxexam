package com.action;

import javax.servlet.http.HttpServletRequest;

import com.entity.Scorde;
import org.apache.struts2.ServletActionContext;

import com.entity.Student;
import com.opensymphony.xwork2.ActionSupport;
import com.service.StudentService;
import com.service.StudentServiceImpl;

import java.util.HashSet;
import java.util.Set;

/**
 * 查找员工信息 -根据员工的id号
 *
 * @author junchuan.Wu
 */
public class QueryStudentByIDAction extends ActionSupport {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private Integer sysid;
    private Integer assess;

    public Integer getAssess() {
        return assess;
    }

    public void setAssess(Integer assess) {
        this.assess = assess;
    }

    private StudentService studentService = new StudentServiceImpl();


    public Integer getSysid() {
        return sysid;
    }


    public void setSysid(Integer sysid) {
        this.sysid = sysid;
    }


    @SuppressWarnings("static-access")
    public String execute() {
        HttpServletRequest request = ServletActionContext.getRequest();
        Student student = studentService.getStudentInfo(sysid);
        if (assess==null){

        }else{
            Set<Scorde> sr = student.getSr();
            HashSet<Scorde> scordes = new HashSet<>();
            for (Scorde scorde : sr) {
                if(scorde.getAssess().equals(assess.toString())){
                    scordes.add(scorde);
                }
            }
            student.setSr(scordes);
        }
        request.setAttribute("students", student);
        return this.SUCCESS;
    }
}
