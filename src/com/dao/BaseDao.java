package com.dao;

import com.entity.Centre;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface BaseDao<T> {
    //增
    public void save(Object object);

    //删
    public void delete(Object object);

    //查
    public Object find(Object object, int id);

    //改
    public void update(Object object);

    List<T> getByCriteria(DetachedCriteria detachedCriteria);
}
