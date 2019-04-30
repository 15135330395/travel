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
        String hql = "from Menu" +
                "where menuId in" +
                "      (" +
                "        select menuId" +
                "        from menuRole" +
                "        where roleId = (" +
                "          select roleId" +
                "          from Role" +
                "          where roleId = (" +
                "            select roleId" +
                "            from admin" +
                "            where adminId = ?" +
                "          )" +
                "        )" +
                "      );";
        return hibernateTemplate.execute(session -> session.createQuery("hql").list());
    }
}
