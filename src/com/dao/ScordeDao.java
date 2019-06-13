package com.dao;

import com.entity.Scorde;
import com.entity.Student;

public interface ScordeDao {

    public Scorde findEndScorde(Student student);//查询最后一次成绩

    public void saveScorde(Scorde Scorde);//存储成绩

    public Scorde selectBySclass(Student student);

    public void updateScorde(Scorde studentScorde);

    void deleteScorde(Scorde scorde);
}
