package com.chinasofti.role.dao;

import com.chinasofti.base.BaseDao;
import com.chinasofti.base.PageBean;
import com.chinasofti.role.entity.Role;

import java.util.List;

/**
 * @Description RoleDao
 * @Author WYR
 * @CreateTime 2019-04-28 9:51
 */
public interface RoleDao extends BaseDao<Role> {
    Integer getCountByPlace(String place);

    List<Role> queryByPageBeanAndPlace(PageBean pageBean, String place);
}
