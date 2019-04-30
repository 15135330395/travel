package com.chinasofti.role.dao.impl;

import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.role.dao.MenuRoleDao;
import com.chinasofti.role.entity.MenuRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description MenuRoleDaoImpl
 * @Author WYR
 * @CreateTime 2019-04-28 12:06
 */
@Repository
public class MenuRoleDaoImpl extends BaseDaoImpl<MenuRole> implements MenuRoleDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<MenuRole> findMenuByRole(Integer id) {
        return hibernateTemplate.execute(session -> session.createQuery("from MenuRole where roleId = :id").setParameter("id", id).list());
    }

    @Override
    public void deleteMenuRole(Integer menuRoleId) {
        hibernateTemplate.execute(session -> session.createQuery("delete from MenuRole where roleId = :id").setParameter("id", menuRoleId));
    }

}

