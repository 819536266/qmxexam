package com.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.entity.Subject;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.service.SubjectService;
import com.service.SubjectServiceImpl;
import com.util.Page;
import com.util.PageResult;
import com.util.PageUtil;

@SuppressWarnings("serial")
public class QuerySubjecLiketAction extends ActionSupport {
    private String subjectTitle;//获取的试题标题
    private int currentPage;//当前页
    private int everyPage = 5;//每一页记录
    private SubjectService subjectService = new SubjectServiceImpl();
    private int totalCount;//总共页
    private String sclass;//部门
    private String panduan;


    public String getPanduan() {
        return panduan;
    }

    public void setPanduan(String panduan) {
        this.panduan = panduan;
    }

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    public String getSubjectTitle() {
        return subjectTitle;
    }

    public void setSubjectTitle(String subjectTitle) {
        this.subjectTitle = subjectTitle;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public SubjectService getSubjectService() {
        return subjectService;
    }

    public void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @SuppressWarnings({"unchecked", "static-access"})
    @Override
    public String execute() throws Exception {
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            DetachedCriteria forClass = DetachedCriteria.forClass(Subject.class);
            Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
            if (student == null) {
                addActionError("管理员未登录");
                return "teaerror";
            }
            if (subjectTitle != null && !"".equals(subjectTitle)) {
                subjectTitle = new String(subjectTitle.getBytes("ISO-8859-1"), "UTF-8");
                forClass.add(Restrictions.like("stTitle", "%" + subjectTitle + "%"));
            }
            if (sclass != null && !"".equals(sclass)) {
                sclass = new String(sclass.getBytes("ISO-8859-1"), "UTF-8");

                forClass.add(Restrictions.eq("sclass", sclass));
            }
            if (panduan != null && !"".equals(panduan)) {
                panduan = new String(panduan.getBytes("ISO-8859-1"), "UTF-8");

                forClass.add(Restrictions.eq("stOptionD", panduan));

            }

            totalCount = subjectService.countLikeSubject(forClass);
            request.setAttribute("subjectTitle", subjectTitle);
            request.setAttribute("sclass", sclass);
            Page page = new Page();
            page = PageUtil.createPage(everyPage, totalCount, currentPage);
            PageResult pageResult = subjectService.likeQueryBySubjectTitle(forClass, page);
            List<Subject> subjects = pageResult.getList();
            List<Subject> newSubjects = new ArrayList<Subject>();
            for (Subject subject : subjects) {
                String newTitle = subject.getStTitle().replaceAll(subjectTitle, "<font color='red'>" + subjectTitle + "</font>");//关键字标红
                subject.setStTitle(newTitle);
                newSubjects.add(subject);
            }
            page = pageResult.getPage();
            request.setAttribute("subjects", newSubjects);
            request.setAttribute("page", page);
            request.setAttribute("panduan", panduan);
            return this.SUCCESS;
        } catch (Exception var11) {
            return "likeerror";
        }
    }


}
