package com.service;

import com.util.Condition;
import org.hibernate.criterion.DetachedCriteria;

import com.entity.Scorde;
import com.entity.Student;

public interface ScordeService {

    public Scorde findEndScorde(Student student);//查询最后一次成绩

    public void saveScorde(Scorde Scorde);//存储成绩

    public String selectBySclass(Condition forClass, String sclass, String trem);//显示员工柱状图

    public void updateScorde(Scorde studentScorde);

    void deleteScorde(Scorde scorde);
}
