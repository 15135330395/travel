package com.chinasofti.admin.service;

import com.chinasofti.admin.dao.AdminDao;
import com.chinasofti.admin.entity.Admin;
import com.chinasofti.base.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Iman
 * date   : 2019/4/28
 */
@Service
public class AdminServiceImpl implements AdminInterface {
    @Autowired
    AdminDao adminDao;

    @Override
    public Integer count() {
        return adminDao.getCount();
    }

    @Override
    public void save(Admin admin) {
        adminDao.add(admin);
    }

    @Override
    public Admin query(Integer id) {
        return adminDao.queryById(id);
    }

    @Override
    public void update(Admin admin) {
        adminDao.update(admin);
    }

    @Override
    public void delete(Admin admin) {
        adminDao.delete(admin);
    }

    @Override
    public List<Admin> queryAll() {

        return adminDao.queryAll();
    }

    @Override
    public List<String> queryName() {
        return adminDao.queryName();
    }

    @Override
    public List<String> queryRoleName() {
        return adminDao.queryRoleName();
    }

    @Override
    public List<Admin> queryByPageBean(PageBean pageBean) {
        return adminDao.queryByPageBean(pageBean);
    }

    @Override
    public Admin queryBySid(Integer id) {
        return adminDao.queryBySid(id);
    }


}
