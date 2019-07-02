package com.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.service.SubjectService;
import com.service.SubjectServiceImpl;

public class StudentExcel extends ActionSupport {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private File upload;// 定义一个File ,变量名要与jsp中的input标签的name一致
    private String uploadContentType;// 上传文件的mimeType类型
    private String uploadFileName;// 上传文件的名称
    private String sclass;
    private String sclassone;

    public String getSclassone() {
        return sclassone;
    }

    public void setSclassone(String sclassone) {
        this.sclassone = sclassone;
    }

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    private StudentService service = new StudentServiceImpl();

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    //导入
    public String Excel() {
        HttpServletRequest request = ServletActionContext.getRequest();
        Teacher student = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (student == null) {
            addActionError("管理员未登录");
            return "teaerror";
        }
        if (uploadFileName != null) {
            String path = ServletActionContext.getServletContext().getRealPath(
                    "/upload");
            // 创建一个服务器端的文件
            File dest = new File(path, uploadFileName);
            try {
                FileUtils.copyFile(upload, dest);
            } catch (IOException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            File file = new File(dest.getPath());
            List<Student> list = service.excelImport(file,sclass,sclassone);
            if (list != null) {
                if (list.size() <= 0) {

                    return "success";
                } else {
                    //如果失败,返回页面
                    request.setAttribute("excellist", list);
                    request.setAttribute("error", "员工已存在!");
                    return "error";
                }
            } else {
                request.setAttribute("error", "文件解析错误");
                return "error";
            }
        } else {
            ValueStack valueStack = ActionContext.getContext().getValueStack();
            valueStack.set("error", "文件未上传!");
            return "error";
        }
    }
}
