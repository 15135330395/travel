package com.chinasofti.staff.service;


import com.chinasofti.base.PageBean;
import com.chinasofti.staff.dao.StaffDao;
import com.chinasofti.staff.entity.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author: Iman
 * date   : 2019/4/28
 */
@Service
public class StaffServiceImpl implements StaffInterface {
    @Autowired
    StaffDao staffDao;

    @Override
    public List<Staff> queryByPageBean(PageBean pageBean) {
            return staffDao.queryByPageBean(pageBean);
    }

    @Transactional
    @Override
    public void save(Staff staff) {
        staffDao.add(staff);
    }

    @Override
    public Staff query(Integer id) {
        Staff staff = staffDao.queryById(id);
        return staff;
    }
    @Transactional
    @Override
    public void update(Staff staff) {
        staffDao.update(staff);
    }
    @Transactional
    @Override
    public void delete(Staff staff) {
        staffDao.delete(staff);
    }

    @Override
    public List<Staff> queryAll() {
        return staffDao.queryAll();
    }

    @Override
    public Integer getCount() {
        return staffDao.getCount();
    }

    @Override
    public List<Staff> queryByPageBeanAndWorkspace(PageBean pageBean, String workspace) {
        return staffDao.queryByPageBeanAndAdminId(pageBean,workspace);
    }

    @Override
    public Integer getCountByWorkspace(String workspace) {
        return staffDao.getCountByWorkspace(workspace);
    }

    @Override
    public Integer queryByJob(String job) {
        return staffDao.queryByJob(job);
    }

//    public List<String> queryWorkPlace(Session session) {
//        return staffDao.queryWorkPlace(session);
//    }



}
