package com.chinasofti.role.dao.impl;

import com.chinasofti.base.BaseDao;
import com.chinasofti.base.PageBean;
import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.role.dao.RoleDao;
import com.chinasofti.role.entity.Role;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description RoleDaoImpl
 * @Author WYR
 * @CreateTime 2019-04-28 9:53
 */
@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public Integer getCountByPlace(String place) {
        return hibernateTemplate.execute(session -> {
            Query query = session.createQuery("select count(1) from Role r,Admin a,Staff s where r.RoleId = a.RoleId and a.StaffId = s.StaffId and  workplace=:place").setParameter("place", place);
            Long l = (Long) query.uniqueResult();
            return l.intValue();
        });
    }

    @Override
    public List<Role> queryByPageBeanAndPlace(PageBean pageBean, String place) {
        return null;
    }
}
