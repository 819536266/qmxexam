package com.dao;

import com.entity.Bigtype;
import com.entity.Centre;

import java.util.List;

public interface CentreDao  extends BaseDao{
    boolean add(Centre centre);
    List<Centre> query(Bigtype centrePid);
    void delete(Centre centre);
    void update();
}
