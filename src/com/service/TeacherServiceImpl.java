package com.service;

import com.dao.TeacherDao;
import com.dao.TeacherDaoImpl;
import com.entity.Teacher;
import com.util.MD5;

public class TeacherServiceImpl implements TeacherService {
    //持有dao层
    private TeacherDao teacherDao = new TeacherDaoImpl();

    /**
     * 判断是否是合法的老师，账号密码是否正确，返回boolean
     */
    @Override
    public boolean allowLogin(String teacherID, String password) {
        Teacher teacher = teacherDao.findByTeacherID(teacherID);
        if (teacher == null) {
            //如果没有查询到记录的话
            return false;
        } else {
            if (teacher.getPassword().equals(MD5.Encrypt(password))) {
                //如果查询的记录的密码和传入的密码一致的话
                return true;
            } else {
                return false;
            }
        }
    }

    @Override
    public Teacher getTeacherInfo(String teacherID) {
        return teacherDao.findByTeacherID(teacherID);
    }

    @Override
    public void saveTeacher(Teacher teacher) {
        teacherDao.save(teacher);

    }

    @Override
    public Teacher getTeacherInfo(Teacher teacher) {
        return (Teacher) teacherDao.find(teacher,teacher.getSysid());
    }

    @Override
    public void update(Teacher teacherInfo) {
        teacherDao.update(teacherInfo);
    }
}
