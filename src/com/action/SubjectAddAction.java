package com.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.entity.Subject;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.SubjectService;
import com.service.SubjectServiceImpl;

public class SubjectAddAction extends ActionSupport implements ModelDriven<Subject> {

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private SubjectService subjectService = new SubjectServiceImpl();
    private Subject subject = new Subject();

    @Override
    public Subject getModel() {
        // TODO Auto-generated method stub
        return subject;
    }


    @SuppressWarnings("static-access")
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("老师未登录");
            return "teaerror";
        }
        if (subject.getStAnswer().length() > 1) {
            subject.setStAnswer(subject.getStAnswer().replace(", ", ""));
        }
        if (subjectService.saveSubject(subject)) {
            return this.SUCCESS;
        } else {
            this.addActionError("试题重复，不要重复添加");
            return this.ERROR;
        }
    }

}
