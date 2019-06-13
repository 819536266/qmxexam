package com.action;

import com.entity.Small;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.SmallService;
import com.service.SmallServiceImpl;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SmallAction extends ActionSupport implements ModelDriven<Small> {
    private Small small=new Small();
    private SmallService service=new SmallServiceImpl();
    @Override
    public Small getModel() {
        return small;
    }
   /* 添加*/
    public String add(){
        boolean login = login();
        if(login==false){
            return "teaerror";
        }
        boolean add =service.add(small);
        if (add){
            return "addsuccess";
        }else{
            return "adderror";
        }

    }
    /* 查询*/
    public String query(){
        HttpServletRequest request = ServletActionContext.getRequest();
        boolean login = login();
        if(login==false){
            return "teaerror";
        }
        List<Small> smalls = service.query(small==null?null:small.getSmallPid());
        request.setAttribute("smalls", smalls);
        return "querysuccess";
    }
    /* 删除*/
    public String delete(){
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        boolean login = login();
        if(login==false){
            return "teaerror";
        }
        try{
            service.delete(small);
            response.getWriter().write("删除成功");
        }catch (Exception e){
            try {
                response.getWriter().write("删除失败");
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        return null;
    }
    public String update(){
        boolean login = login();
        if(login==false){
            return "teaerror";
        }
        return "";
    }
    /* 根据父级查询返回json*/
    public  String queryByPid(){
        HttpServletResponse response = ServletActionContext.getResponse();
        List<Small> bigtypes =service.queryByPid(small==null?null:small.getSmallPid());
        JSONArray jsonArray = JSONArray.fromObject(bigtypes);
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
    public  boolean login(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("老师未登录");
            return false;
        }
        return true;
    }
}
