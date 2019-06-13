package com.service;

import com.entity.Centre;
import com.entity.Small;

import java.util.List;

public interface SmallService {
    boolean add(Small small);
    void delete(Small small);
    void update();

    List<Small> query(Centre centre);

    List<Small> queryByPid(Centre centre);
}
