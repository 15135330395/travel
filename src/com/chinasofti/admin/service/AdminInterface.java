package com.chinasofti.admin.service;

import com.chinasofti.admin.entity.Admin;
import com.chinasofti.base.PageBean;

import java.util.List;

/**
 * @author: Iman
 * date   : 2019/4/28
 */
public interface AdminInterface {
    /**
     * 获得用户的总数
     * @return
     */
    public Integer count();
    /**
     * 保存用户
     * @param admin
     * @return
     */
    public void save(Admin admin);
    /**
     * 通过id查询用户
     * @param id
     * @return
     */
    public Admin query(Integer id);
    /**
     * 更新用户
     * @param admin
     * @return
     */
    public void update(Admin admin);
    /**
     * 删除用户
     * @param admin
     * @return
     */
    public void delete(Admin admin);
    /**
     * 获得全部用户
     * @return
     */
    public List<Admin> queryAll();
    /**
     * 获得用户的分页列表
     * @param pageBean
     * @return
     */
    public List<Admin> queryByPageBean(PageBean pageBean);

    /**
     * 通过用户名查询用户
     * @param adminName
     * @return
     */
    Admin queryByName(String adminName);
}
