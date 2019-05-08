package com.chinasofti.staff.dao;


import com.chinasofti.base.BaseDao;
import com.chinasofti.base.PageBean;
import com.chinasofti.staff.entity.Staff;

import java.util.List;


public interface StaffDao extends BaseDao<Staff> {
    /**
     * 通过工作地点查找员工
     * @param pageBean
     * @param workspace
     * @return
     */
    public List<Staff> queryByPageBeanAndAdminId(PageBean pageBean,String workspace);
    /**
     * 获得相应数量
     * @param workspace
     * @return
     */
    Integer getCountByWorkspace(String workspace);

    Integer queryByJob(String job);
}
