package com.action;

import java.util.List;

import com.entity.Student;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.util.MD5;


public class RegStudentAction extends ActionSupport implements ModelDriven<Student> {
    Student student = new Student();

    private StudentService studentService = new StudentServiceImpl();

    @Override
    public Student getModel() {
        // TODO Auto-generated method stub
        return student;
    }

    public String reg() {
        String sid = student.getStudentID();

        Student data = studentService.getStudent(sid);

        if (data == null) {
            //加密
            String pass = MD5.Encrypt(student.getPassword(), 16);
            student.setPassword(pass);
            //保存数据
            studentService.saveStudent(student);
            return "success";
        } else {
            return ERROR;
        }
    }

}
