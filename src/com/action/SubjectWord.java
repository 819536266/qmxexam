package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.ActionMessage;

import com.entity.Subject;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.SubjectService;
import com.service.SubjectServiceImpl;

public class SubjectWord extends ActionSupport {
    /**
     *
     */

    private static final long serialVersionUID = 1L;
    private File upload;// 定义一个File ,变量名要与jsp中的input标签的name一致
    private String uploadContentType;// 上传文件的mimeType类型
    private String uploadFileName;// 上传文件的名称
    private String sclass;

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    private SubjectService subjectService = new SubjectServiceImpl();

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

    // contentType:text/plain
    // File:1.txt

    /***
     * 上传文档并解析
     * @return
     */
    public String addWord() {
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
            //解析文档存入session返回页面
            List<Subject> list = subjectService.getWordSubject(file, sclass);
            if (list != null) {
                if (list.size() > 0) {
                    request.getSession().setAttribute("subjectslist", list);
                    return "success";
                } else {
                    //如果失败,返回页面
                    request.setAttribute("error", "文件解析错误");
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

    /***
     * 储存解析的题目
     * @return
     */
    public String saveWord() {
        HttpServletRequest request = ServletActionContext.getRequest();
        //获取session中的题
        List<Subject> list = (List<Subject>) request.getSession().getAttribute("subjectslist");
        List<Subject> listerror = new ArrayList<Subject>();
        //判断session中是否有题
        if (list.size() == 0 || list == null) {
            request.setAttribute("error", "文件解析错误");
            return "error";
        } else {
            //调用servlet中的方法储存,如果失败存入listerror
            for (Subject subject : list) {
                boolean saveSubject = subjectService.saveSubject(subject);
                if (!saveSubject) {
                    listerror.add(subject);
                }
            }
            //如果有失败的题返货到页面
            if (listerror.size() > 0) {
                request.setAttribute("subjectserror", listerror);
                return "listsuccess";
            }
            //消除session中的题
            request.getSession().removeAttribute("subjectslist");
            return "success";
        }

    }

}
