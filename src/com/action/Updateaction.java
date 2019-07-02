package com.action;

import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.service.TeacherService;
import com.service.TeacherServiceImpl;
import com.util.MD5;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Updateaction extends ActionSupport {
    private Student student;
    private String studentpd;
    private String teacherpd;
    private Teacher teacher;
    private StudentService studentService=new StudentServiceImpl();
    private TeacherService teacherService=new TeacherServiceImpl();

    public String getStudentpd() {
        return studentpd;
    }

    public void setStudentpd(String studentpd) {
        this.studentpd = studentpd;
    }

    public String getTeacherpd() {
        return teacherpd;
    }

    public void setTeacherpd(String teacherpd) {
        this.teacherpd = teacherpd;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
    public String studentUpdate() throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        Student student1 = (Student) request.getSession().getAttribute("studentInfo");
        if (student1 == null) {
            addActionError("未登录");
            return "error";
        }
        try {
            Student studentInfo = studentService.getStudentInfo(student.getSysid());
            if(studentInfo!=null){
                if(student.getPassword()!=null&&!student.getPassword().equals("")){
                    if(studentInfo.getPassword().equals(MD5.Encrypt(student.getPassword()))){
                        if (studentpd!=null&&!studentpd.equals("")){
                            studentInfo.setPassword(MD5.Encrypt(studentpd));
                            studentService.updateStudent(studentInfo);
                            response.getWriter().write("success");
                            return null;
                        }
                    }
                }
            }
        } catch (IOException e) {
            response.getWriter().write("error");
        }
        response.getWriter().write("error");
        return null;
    }
    public String teacherUpdate() throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacherInfo");
        if (teacher == null) {
            addActionError("管理员未登录");
            return "teaerror";
        }
        try {
            Teacher teacherInfo = teacherService.getTeacherInfo(teacher);
            if(teacherInfo!=null){
                if(teacher.getPassword()!=null&&!teacher.getPassword().equals("")){
                    if(teacherInfo.getPassword().equals(MD5.Encrypt(teacher.getPassword()))){
                        if (teacherpd!=null&&!teacherpd.equals("")){
                            teacherInfo.setPassword(MD5.Encrypt(teacherpd));
                            teacherService.update(teacherInfo);
                            response.getWriter().write("success");
                            return null;
                        }
                    }
                }
            }
        } catch (IOException e) {
            response.getWriter().write("error");
            e.printStackTrace();
        }
        response.getWriter().write("error");
        return null;
    }
}
