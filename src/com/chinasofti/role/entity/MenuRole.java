package com.chinasofti.role.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @Description MenuRole
 * @Author WYR
 * @CreateTime 2019-04-28 11:31
 */
@Entity
@Table(name = "menu_role")
public class MenuRole {
    /**
     * 中间表编号
     */
    private Integer menuRoleId;
    /**
     * 权限编号
     */
    private Integer menuId;
    /**
     * 角色编号
     */
    private Integer roleId;

    public MenuRole() {
    }

    public MenuRole(Integer menuId, Integer roleId) {
        this.menuId = menuId;
        this.roleId = roleId;
    }

    @Id
    @GeneratedValue(generator = "_native")
    @GenericGenerator(name = "_native", strategy = "native")
    @Column(name = "menu_role_id")
    public Integer getMenuRoleId() {
        return menuRoleId;
    }

    public void setMenuRoleId(Integer menuRoleId) {
        this.menuRoleId = menuRoleId;
    }

    @Column(name = "menu_id")
    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    @Column(name = "role_id")
    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
