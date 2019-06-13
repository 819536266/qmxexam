package com.service;

import com.entity.Bigtype;
import com.entity.Centre;

import java.util.List;

public interface CentreService {
    boolean add(Centre centre);
    List<Centre> query(Bigtype centrePid);
    void delete(Centre centre);
    void update();

    List<Centre> queryByPid(Bigtype centrePid);
}
