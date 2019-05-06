package com.chinasofti.role.dao.impl;

import com.chinasofti.base.impl.BaseDaoImpl;
import com.chinasofti.role.dao.MenuDao;
import com.chinasofti.role.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description MenuDaoImpl
 * @Author WYR
 * @CreateTime 2019-04-28 9:53
 */
@Repository
public class MenuDaoImpl extends BaseDaoImpl<Menu> implements MenuDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Menu> findMenuByUserId(Integer adminId) {
        String sql = "select * " +
                "from menu " +
                "where menu_id in" +
                "      (" +
                "        select menu_id" +
                "        from menu_role " +
                "        where role_id = (" +
                "          select role_id" +
                "          from role" +
                "          where role_id = (" +
                "            select role_id" +
                "            from admin" +
                "            where admin_id = :id" +
                "          )" +
                "        )" +
                "      );";
        List<Menu> id = hibernateTemplate.execute(session -> session.createSQLQuery(sql).addEntity(Menu.class).setParameter("id", adminId).list());
        return id;
    }
}
