package com.service;

import com.dao.CentreDao;
import com.dao.CentreDaoImpl;
import com.entity.Bigtype;
import com.entity.Centre;

import java.util.List;

public class CentreServiceImpl implements  CentreService{
    private CentreDao dao=new CentreDaoImpl();
    @Override
    public boolean add(Centre centre) {
        return dao.add(centre);
    }

    @Override
    public List<Centre> query(Bigtype centrePid) {
        return  dao.query(centrePid);
    }

    @Override
    public void delete(Centre centre) {
        dao.delete(centre);
    }

    @Override
    public void update() {

    }

    @Override
    public List<Centre> queryByPid(Bigtype centrePid) {
        return  dao.query(centrePid);
    }
}
