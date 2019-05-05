package com.chinasofti.staff.dao;




import com.chinasofti.admin.entity.Admin;
import com.chinasofti.base.PageBean;
import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.staff.entity.Staff;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StaffDaoImp extends BaseDaoImpl<Staff> implements StaffDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Staff> queryByPageBean(PageBean pageBean) {
        return hibernateTemplate.execute(session -> session.createQuery("from Staff ")
                .setFirstResult(pageBean.getPageIndex())
                .setMaxResults(pageBean.getPageCount())
                .list());
    }

}
