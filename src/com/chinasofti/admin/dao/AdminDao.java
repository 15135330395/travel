package com.chinasofti.admin.dao;

import com.chinasofti.admin.entity.Admin;
import com.chinasofti.base.BaseDao;
import com.chinasofti.base.PageBean;
import com.chinasofti.role.entity.Role;

import java.util.List;


public interface AdminDao extends BaseDao<Admin> {
    public List queryName();
    public List queryRoleName();
    public List<Admin> queryByPageBean(PageBean pageBean);
    public Admin queryBySid(Integer id);
}
