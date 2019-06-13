package com.action;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.entity.Scorde;
import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.util.Condition;

public class ExportExcel extends ActionSupport {
    private String term;//日期
    private String sclass;//部门
    private String type = "1";//1为升序,2为降序
    private String name;
    private StudentService studentService = new StudentServiceImpl();

    public String getType() {
        return type;
    }

    public void setType(String type) {
        if (type == null) {
            this.type = "1";
        } else {

            this.type = type;
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    public String exportExcel() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("老师未登录");
            return "teaerror";
        }
        //状态
        String t = (String) request.getSession().getAttribute("type");
        if (t != null) {
            type = t;
        }
        Condition condition = new Condition();
        condition.setType(type);
        try {
            if (sclass != null && !sclass.equals("")) {
                sclass = new String(sclass.getBytes("ISO-8859-1"), "UTF-8");
                condition.setSclass(sclass);
            }
            if (term != null && !term.equals("")) {
                condition.setTerm(term);
            }
            if (name != null && !name.equals("")) {
                name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
                condition.setName(name);
            }
            List<Scorde> list = studentService.exportExcel(condition);
            if (list.size() > 0) {
                XSSFWorkbook hw = new XSSFWorkbook();
                XSSFSheet createSheet = hw.createSheet("员工");
                XSSFRow Row = createSheet.createRow(0);
                Row.createCell(0).setCellValue("员工排名");
                Row.createCell(1).setCellValue("员工学号");
                Row.createCell(2).setCellValue("员工姓名");
                Row.createCell(3).setCellValue("员工部门");
                Row.createCell(4).setCellValue("员工成绩");
                createSheet.setColumnWidth(1, 5000);
                createSheet.setColumnWidth(2, 4000);
                createSheet.setColumnWidth(3, 4000);
                createSheet.setColumnWidth(4, 3000);
                for (int i = 0; i < list.size(); i++) {
                    XSSFRow createRow = createSheet.createRow(i + 1);

                    createRow.createCell(0).setCellValue(i + 1);
                    createRow.createCell(2).setCellValue(list.get(i).getStuSysid().getStudentName());
                    createRow.createCell(1).setCellValue(list.get(i).getStuSysid().getStudentID());
                    createRow.createCell(3).setCellValue(list.get(i).getStuSysid().getSclass());
                    createRow.createCell(4).setCellValue(list.get(i).getTimescore());
                }
                OutputStream output = response.getOutputStream();
                response.reset();
                response.setContentType("");
                response.setHeader("Content-disposition", "attachment; filename=" + URLEncoder.encode("员工.xlsx", "UTF-8"));
                response.setContentType("application/msexcel");
                hw.write(output);
                output.close();
                return null;
            } else {
                return "success";
            }
        } catch (Exception e) {
            return "success";
        }
    }


}
