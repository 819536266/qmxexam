package com.service;

import com.entity.Bigtype;
import com.util.Page;
import com.util.PageResult;

import java.util.List;

public interface BigtypeService {


    boolean add(Bigtype bigtype);
    PageResult query(Page page);
    void delete(Bigtype bigtype);
    void update();

    int countBigtype();

    List<Bigtype> queryall();
}
