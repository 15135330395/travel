package com.chinasofti.staff.dao;


import com.chinasofti.base.BaseDao;
import com.chinasofti.base.PageBean;
import com.chinasofti.staff.entity.Staff;

import java.util.List;


public interface StaffDao extends BaseDao<Staff> {
    public List<Staff> queryByPageBeanAndAdminId(PageBean pageBean,String workspace);

    Integer getCountByWorkspace(String workspace);

    Integer queryByJob(String job);
}
