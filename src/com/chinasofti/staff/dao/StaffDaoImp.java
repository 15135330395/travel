package com.chinasofti.staff.dao;


import com.chinasofti.base.PageBean;
import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.staff.entity.Staff;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StaffDaoImp extends BaseDaoImpl<Staff> implements StaffDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Staff> queryByPageBeanAndAdminId(PageBean pageBean, String workspace) {
        System.out.println(workspace);
        List<Staff> staffList = hibernateTemplate.execute(session -> session.createQuery("from Staff where workplace=:workspace")
                .setParameter("workspace", workspace)
                .setFirstResult(pageBean.getPageIndex())
                .setMaxResults(pageBean.getPageCount())
                .list());
        return staffList;
    }


    @Override
    public Integer getCountByWorkspace(String workspace) {
        return hibernateTemplate.execute(session -> {
            Query query = session.createQuery("select count(1) from Staff where workplace=:workspace").setParameter("workspace", workspace);
            Long l = (Long) query.uniqueResult();
            return l.intValue();
        });
    }
}
