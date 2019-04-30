package com.chinasofti.role.dao.impl;

import com.chinasofti.base.PageBean;
import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.role.dao.RoleDao;
import com.chinasofti.role.entity.Role;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;


/**
 * @Description RoleDaoImpl
 * @Author WYR
 * @CreateTime 2019-04-28 9:53
 */
@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao {
    /*
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public Integer getCountByPlace(String place) {
        return hibernateTemplate.execute(session -> {
            Query query = session.createSQLQuery("select count(1) from role r,admin a,staff s where r.role_id = a.role_id and a.staff_id = s.staff_id and workplace=:place").setParameter("place", place);
            BigInteger l = (BigInteger) query.uniqueResult();
            return l.intValue();
        });
    }

    @Override
    public List<Role> queryByPageBeanAndPlace(PageBean pageBean, String place) {
        return hibernateTemplate.execute(session ->
                session.createSQLQuery("select r.* from role r,admin a,staff s where r.role_id = a.role_id and a.staff_id = s.staff_id and workplace=:place limit :pageIndex,:pageCount")
                        .addEntity(Role.class)
                        .setParameter("place", place).setParameter("pageIndex", pageBean.getPageIndex()).setParameter("pageCount", pageBean.getPageCount()).list());
    }
    */
}
