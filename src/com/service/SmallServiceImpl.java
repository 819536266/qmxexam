package com.service;

import com.dao.SmallDao;
import com.dao.SmallDaoImpl;
import com.entity.Centre;
import com.entity.Small;

import java.util.List;

public class SmallServiceImpl implements  SmallService{
    private SmallDao dao=new SmallDaoImpl();
    @Override
    public boolean add(Small small) {
        return dao.add(small);
    }



    @Override
    public void delete(Small small) {
        dao.delete(small);
    }

    @Override
    public void update() {

    }

    @Override
    public List<Small> query(Centre centre) {
        return dao.query(centre);
    }

    @Override
    public List<Small> queryByPid(Centre centre) {

        return dao.query(centre);
    }
}
