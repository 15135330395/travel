package com.chinasofti.role.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.role.dao.RoleDao;
import com.chinasofti.role.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description RoleService
 * @Author WYR
 * @CreateTime 2019-04-28 9:52
 */
@Service
public class RoleService {
    @Autowired
    private RoleDao dao;

    public List<Role> queryAll() {
        return dao.queryAll();
    }

    public List<Role> queryByPageBean(PageBean pageBean) {
        return dao.queryByPageBean(pageBean);
    }

    public Integer getCount() {
        return dao.getCount();
    }

    public void addRole(Role role) {
        dao.add(role);
    }

    public Role queryRoleById(Integer roleId) {
        return dao.queryById(roleId);
    }

    public void updateRole(Role role) {
        dao.update(role);
    }

    public void delete(Integer roleId) {
        dao.delete(dao.queryById(roleId));
    }

    public Integer getCountByPlace(String place) {
        return dao.getCountByPlace(place);
    }

    public List<Role> queryByPageBeanAndPlace(PageBean pageBean, String place) {
        return dao.queryByPageBeanAndPlace(pageBean, place);
    }
}
