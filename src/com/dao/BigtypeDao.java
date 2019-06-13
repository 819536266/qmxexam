package com.dao;

import com.entity.Bigtype;
import com.util.Page;

import java.util.List;

public interface BigtypeDao {
    boolean add(Bigtype bigtype);
    List<Bigtype> query(Page page);
    void delete(Bigtype bigtype);
    void update();

    int countBigtype();

    List<Bigtype> queryall();
}
