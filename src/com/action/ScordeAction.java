package com.action;

import com.entity.Scorde;
import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.ScordeService;
import com.service.ScordeServiceImpl;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.SimpleFormatter;

public class ScordeAction extends ActionSupport {
    private Scorde scorde = new Scorde();
    private String  term;
    private ScordeService service = new ScordeServiceImpl();
    public Scorde getScorde() {
        return scorde;
    }

    public void setScorde(Scorde scorde) {
        this.scorde = scorde;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }
//添加考核分数
    public String add() throws ParseException {
        HttpServletRequest request = ServletActionContext.getRequest();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("老师未登录");
            return "teaerror";
        }
        try {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMM");
        Date parse = simpleDateFormat .parse(term);
        scorde.setTesttime(parse);
        Scorde Scorde = service.findEndScorde(scorde.getStuSysid());
        Scorde studentScorde = new Scorde();


            if (Scorde != null) {
                //如果次数为0则修改最初次数
                if (Scorde.getCount() == 0) {
                    scorde.setCount(1);
                    scorde.setAssess("1");
                    service.updateScorde(scorde);
                } else {
                    scorde.setCount(Scorde.getCount() + 1);
                    scorde.setAssess("1");
                    service.saveScorde(scorde);//把成绩保存到数据库中
                }
            } else {
                scorde.setCount(Scorde.getCount() + 1);
                scorde.setAssess("1");
                service.saveScorde(scorde);
            }
        } catch (Exception e) {
            return "error";
        }
        return "success";
    }
    //删除分数
    public String delete(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("老师未登录");
            return "teaerror";
        }
        try {
            service.deleteScorde(scorde);
            response.getWriter().write("success");
        } catch (Exception e) {
            try {
                response.getWriter().write("error");
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        return null;
    }
}
