package com.chinasofti.staff.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.staff.entity.Staff;


import java.util.List;

/**
 * @author: Iman
 * date   : 2019/4/28
 */
public interface StaffInterface {
    public List<Staff> queryByPageBean(PageBean pageBean);
    public void save(Staff staff);
    public Staff query(Integer id);
    public void update(Staff staff);
    public void delete(Staff staff);
    public List<Staff> queryAll();
    public Integer getCount();
//    public List<String> queryWorkPlace(Session session);

}
