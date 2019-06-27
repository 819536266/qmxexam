package com.action;

import com.entity.Scorde;
import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.ScordeService;
import com.service.ScordeServiceImpl;
import com.util.BootstrapTable;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.SimpleFormatter;

public class ScordeAction extends ActionSupport implements ModelDriven<BootstrapTable>{
    private BootstrapTable table=new BootstrapTable();
    @Override
    public BootstrapTable getModel() {
        return table;
    }
    private Scorde scorde = new Scorde();
    private String  term;
    private ScordeService service = new ScordeServiceImpl();
    //根据用户信息获取分数
    public String getUserTable() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Student student= (Student) request.getSession().getAttribute("studentInfo");
        if(student==null||student.getSysid()==null){
            response.getWriter().write("error");
        }else{
            try {
                //设置参数
                DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Scorde.class);
                detachedCriteria.add(Restrictions.eq("stuSysid",student));
                detachedCriteria.add(Restrictions.eq("assess",table.getAssess()));
                detachedCriteria.setProjection(Projections.rowCount());
                //获取总条数
                int count=service.getByCriteriaCount(detachedCriteria);
                //取消获取条数,设置排序参数
                DetachedCriteria detachedCriteria1 = DetachedCriteria.forClass(Scorde.class);
                detachedCriteria1.add(Restrictions.eq("stuSysid",student));
                detachedCriteria1.add(Restrictions.eq("assess",table.getAssess()));
                if(table.getShor()!=null&&!table.getShor().equals("")){
                    if(table.getOrder().equals("asc")){
                        detachedCriteria1.addOrder(Order.asc(table.getShor()));
                    }else{
                        detachedCriteria1.addOrder(Order.desc(table.getShor()));
                    }
                }
                List<Scorde> list=service.getByCriteria(detachedCriteria1,table);

                //设置关联参数,避免转换错误
                list.forEach(time->{time.setSet(null);time.setStuSysid(null);});
                //放入map
                Map<String, Object> map = new HashMap<>();
                map.put("total",count);
                map.put("rows",list);
                JsonConfig jsonConfig = new JsonConfig();
                jsonConfig.setExcludes(new String[] {"set","stuSysid"});
                JSONObject jsonArray = JSONObject.fromObject(map);
                System.out.println(jsonArray.toString());
                response.getWriter().write(jsonArray.toString());
            } catch (IOException e) {
                response.getWriter().write("error");
            }
        }
        return null;
    }

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
                    service.saveScorde(scorde);
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
            Scorde byid = service.getByid(scorde);
            service.deleteScorde(byid);
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
