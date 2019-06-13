package com.service;

import com.dao.BigtypeDao;
import com.dao.BigtypeDaoImpl;
import com.entity.Bigtype;
import com.util.Page;
import com.util.PageResult;
import com.util.PageUtil;

import java.util.List;

public class BigtypeServiceImpl implements  BigtypeService{
    private BigtypeDao dao=new BigtypeDaoImpl();
    @Override
    public boolean add(Bigtype bigtype) {

        return dao.add(bigtype);
    }

    @Override
    public PageResult query(Page page) {
        page = PageUtil.createPage(page.getEveryPage(), page.getTotalCount(), page.getCurrentPage());//创建分页信息
        List<Bigtype> list = dao.query(page);//通过分页信息模糊查询试题
        PageResult result = new PageResult(page, list);//封装好封页信息和记录信息，返回给调用者
        return result;
    }

    @Override
    public void delete(Bigtype bigtype) {
        dao.delete(bigtype);
    }

    @Override
    public void update() {

    }

    @Override
    public int countBigtype() {
        int countBigtype=dao.countBigtype();
        return countBigtype;
    }

    @Override
    public List<Bigtype> queryall() {
        return dao.queryall();
    }
}
