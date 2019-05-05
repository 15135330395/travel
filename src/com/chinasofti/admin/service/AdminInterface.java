package com.chinasofti.admin.service;

import com.chinasofti.admin.entity.Admin;
import com.chinasofti.base.PageBean;

import java.util.List;

/**
 * @author: Iman
 * date   : 2019/4/28
 */
public interface AdminInterface {
    public Integer count();
    public void save(Admin admin);
    public Admin query(Integer id);
    public void update(Admin admin);
    public void delete(Admin admin);
    public List<Admin> queryAll();
    public List<String> queryName();
    public List<String> queryRoleName();
    public List<Admin> queryByPageBean(PageBean pageBean);
    public Admin queryBySid(Integer id);


}
