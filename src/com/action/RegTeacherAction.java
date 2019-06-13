package com.action;

import java.util.List;

import com.entity.Student;
import com.entity.Teacher;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.service.TeacherService;
import com.service.TeacherServiceImpl;
import com.util.MD5;


public class RegTeacherAction extends ActionSupport implements ModelDriven<Teacher> {
    Teacher teacher = new Teacher();
    private TeacherService teacherService = new TeacherServiceImpl();

    @Override
    public Teacher getModel() {
        // TODO Auto-generated method stub
        return teacher;
    }

    public String regTeacher() {
        String tid = teacher.getTeacherID();
        Teacher data = teacherService.getTeacherInfo(tid);
        if (data == null) {
            //加密
            teacher.setPassword(MD5.Encrypt(teacher.getPassword(), 16));
            //保存数据
            teacherService.saveTeacher(teacher);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

}
