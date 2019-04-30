package com.chinasofti.role.service;

import com.chinasofti.role.dao.MenuRoleDao;
import com.chinasofti.role.entity.MenuRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description MenuRoleService
 * @Author WYR
 * @CreateTime 2019-04-28 12:07
 */
@Service
public class MenuRoleService {

    @Autowired
    private MenuRoleDao dao;

    public List<MenuRole> findMenuByRole(Integer id) {
        return dao.findMenuByRole(id);
    }

    public void addMenuRole(MenuRole menuRole) {
        dao.add(menuRole);
    }

    public void deleteMenuRoleByRoleId(Integer roleId) {
        dao.deleteMenuRole(roleId);
    }
}
