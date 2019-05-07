package com.chinasofti.role.dao;

import com.chinasofti.base.BaseDao;
import com.chinasofti.role.entity.MenuRole;

import java.util.List;

/**
 * @Description MenuRoleDao
 * @Author WYR
 * @CreateTime 2019-04-28 12:05
 */
public interface MenuRoleDao extends BaseDao<MenuRole> {

    /**
     * 通过角色查询权限
     *
     * @param id
     * @return
     */
    List<MenuRole> findMenuByRole(Integer id);

    /**
     * 通过角色删除权限
     *
     * @param roleId
     * @return
     */
    void deleteMenuRole(Integer roleId);
}
