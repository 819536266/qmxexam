package com.dao;

import com.entity.Scorde;
import com.entity.Student;
import com.util.BootstrapTable;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface ScordeDao extends BaseDao{

    public Scorde findEndScorde(Student student);//查询最后一次成绩

    public int saveScorde(Scorde Scorde);//存储成绩

    public Scorde selectBySclass(Student student);

    public void updateScorde(Scorde studentScorde);

    void deleteScorde(Scorde scorde);

    Scorde findByid(Scorde scorde, int scordeId);

    int getByCriteriaCount(DetachedCriteria detachedCriteria);

    List<Scorde> getByCriteria(DetachedCriteria detachedCriteria, BootstrapTable table);
}
