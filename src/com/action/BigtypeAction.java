package com.action;

import com.entity.Bigtype;
import com.entity.Scorde;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.BigtypeService;
import com.service.BigtypeServiceImpl;
import com.util.Page;
import com.util.PageResult;
import com.util.PageUtil;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BigtypeAction extends ActionSupport {
    private int currentPage;//当前页
    private int everyPage = 10;//每一页记录

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getEveryPage() {
        return everyPage;
    }

    public void setEveryPage(int everyPage) {
        this.everyPage = everyPage;
    }

    private Bigtype bigtype=new Bigtype();
    private BigtypeService bigtypeService =new BigtypeServiceImpl();

    public Bigtype getBigtype() {
        return bigtype;
    }

    public void setBigtype(Bigtype bigtype) {
        this.bigtype = bigtype;
    }

    public String add(){
        boolean login = login();
        if(login==false){
            return "teaerror";
        }
        System.out.println(bigtype);
        boolean add =bigtypeService.add(bigtype);
        if (add){
            return "addsuccess";
        }else{
            return "adderror";
        }

    }
    public  String queryall(){
        HttpServletResponse response = ServletActionContext.getResponse();
        List<Bigtype> bigtypes =bigtypeService.queryall();

        JSONArray jsonArray = JSONArray.fromObject(bigtypes);
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
    public String query(){
        HttpServletRequest request = ServletActionContext.getRequest();
        boolean login = login();
        if(login==false){
            return "teaerror";
        }
        Page page = new Page();
        int totalCount = bigtypeService.countBigtype();
        page = PageUtil.createPage(everyPage, totalCount, currentPage);//获取分页信息
        PageResult pageResult = bigtypeService.query(page);
        List<Bigtype> bigtypes = pageResult.getList();
        request.setAttribute("bigtypes", bigtypes);
        request.setAttribute("page", page);
        return "querysuccess";
    }
    public String delete(){
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        boolean login = login();
        if(login==false){
            return "teaerror";
        }
        try{
            bigtypeService.delete(bigtype);
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
    public  boolean login(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("管理员未登录");
            return false;
        }
        return true;
    }
}
