package com.chinasofti.role.dao;

import com.chinasofti.base.BaseDao;
import com.chinasofti.role.entity.Menu;

import java.util.List;

/**
 * @Description MenuDao
 * @Author WYR
 * @CreateTime 2019-04-28 9:51
 */
public interface MenuDao extends BaseDao<Menu> {
    /**
     * 通过AdminId查找权限菜单
     *
     * @param adminId
     * @return
     */
    List<Menu> findMenuByUserId(Integer adminId);
}
