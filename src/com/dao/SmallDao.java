package com.dao;

import com.entity.Centre;
import com.entity.Small;

import java.util.List;

public interface SmallDao {
    boolean add(Small small);
    List<Small> query(Centre centre);
    void delete(Small small);
    void update();
}
