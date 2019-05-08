package com.chinasofti.admin.dao;

import com.chinasofti.admin.entity.Admin;
import com.chinasofti.base.BaseDao;
import com.chinasofti.base.PageBean;
import com.chinasofti.role.entity.Role;

import java.util.List;


public interface AdminDao extends BaseDao<Admin> {
    /**
     * 获得用户的分页列表
     * @param pageBean
     * @return
     */
    public List<Admin> queryByPageBean(PageBean pageBean);

}
