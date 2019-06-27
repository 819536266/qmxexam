package com.service;

import com.util.BootstrapTable;
import com.util.Condition;
import org.hibernate.criterion.DetachedCriteria;

import com.entity.Scorde;
import com.entity.Student;

import java.util.List;

public interface ScordeService {

    public Scorde findEndScorde(Student student);//查询最后一次成绩

    public int saveScorde(Scorde Scorde);//存储成绩

    public String selectBySclass(Condition forClass, String sclass, String trem);//显示员工柱状图

    public void updateScorde(Scorde studentScorde);

    void deleteScorde(Scorde scorde);

    Scorde getByid(Scorde scorde);

    int getByCriteriaCount(DetachedCriteria detachedCriteria);

    List<Scorde> getByCriteria(DetachedCriteria detachedCriteria, BootstrapTable table);
}
