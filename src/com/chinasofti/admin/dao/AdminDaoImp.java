package com.chinasofti.admin.dao;




import com.chinasofti.admin.entity.Admin;
import com.chinasofti.base.PageBean;
import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.role.entity.Role;
import com.chinasofti.staff.entity.Staff;
import com.chinasofti.user.entity.User;
import net.sf.ehcache.hibernate.HibernateUtil;
import org.hibernate.*;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.List;

@Repository
public class AdminDaoImp extends BaseDaoImpl<Admin> implements AdminDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Admin> queryByPageBean(PageBean pageBean) {
        return hibernateTemplate.execute(session -> session.createQuery("from Admin")
                .setFirstResult(pageBean.getPageIndex())
                .setMaxResults(pageBean.getPageCount())
                .list());
    }


}
